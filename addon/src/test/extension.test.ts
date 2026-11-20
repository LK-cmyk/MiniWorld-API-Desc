import * as assert from 'assert';
import * as fs from 'fs';
import * as os from 'os';
import * as path from 'path';

import * as vscode from 'vscode';

import { buildClassCompletionItems, buildEventCompletionItems, findAnnotatedEventKeysForParam, findEventKeysForFunction, parseEventDefinitions, parseLuaEventDefinitions } from '../eventCompletion';
import { parseLuaDeclarations } from '../apiSearch';

suite('Extension Test Suite', () => {
	vscode.window.showInformationMessage('Start all tests.');

	test('parses event definitions from json', async () => {
		const tempDir = fs.mkdtempSync(path.join(os.tmpdir(), 'miniworld-event-'));
		const filePath = path.join(tempDir, 'MNEvent.d.json');
		fs.writeFileSync(filePath, JSON.stringify({
			'Game.Hour': {
				desc: '世界小时时间变化',
			},
		}, null, 2));

		const definitions = await parseEventDefinitions(filePath);

		assert.strictEqual(definitions.size, 1);
		assert.strictEqual(definitions.get('Game.Hour')?.desc, '世界小时时间变化');
	});

	test('builds 2.0 completion items with bracket-wrap command', () => {
		const definitions = new Map<string, { desc?: string }>([['Player.Die', { desc: '玩家死亡' }]]);
		const items = buildEventCompletionItems(definitions as Map<string, { desc?: string; event_info?: Record<string, string> }>);

		assert.strictEqual(items.length, 1);
		assert.strictEqual(items[0].label, 'Player.Die');
		assert.strictEqual(items[0].detail, '玩家死亡');
		assert.strictEqual(items[0].insertText, 'Player.Die');
		// 2.0 补全项挂长括号包裹命令
		assert.strictEqual(items[0].command?.command, 'complete.wrapEventBrackets');
		assert.strictEqual(items[0].command?.arguments?.[0], 'Player.Die');
	});

	test('parses 3.0 event definitions from LuaDoc', async () => {
		const tempDir = fs.mkdtempSync(path.join(os.tmpdir(), 'miniworld-event-lua-'));
		const filePath = path.join(tempDir, 'MNEvent.d.lua');
		fs.writeFileSync(filePath, [
			'--- @class TriggerEvent',
			'--- @field GameStart any @游戏创建 {}',
			'--- @field PlayerClickBlock any @点击方块 {blockid:方块类型, x,y,z:事件位置}',
			'local TriggerEvent = {}',
			'--- @class ObjectEvent',
			'--- @field PlayerClickBlock any @组件点击',
		].join('\n'));

		const definitions = await parseLuaEventDefinitions(filePath);

		assert.strictEqual(definitions.size, 3);
		assert.strictEqual(definitions.get('TriggerEvent.GameStart')?.desc, '游戏创建');
		assert.strictEqual(definitions.get('TriggerEvent.PlayerClickBlock')?.event_info?.x, '事件位置');
		assert.strictEqual(definitions.get('TriggerEvent.PlayerClickBlock')?.event_info?.y, '事件位置');
		assert.strictEqual(definitions.get('TriggerEvent.PlayerClickBlock')?.event_info?.z, '事件位置');
		assert.strictEqual(definitions.get('ObjectEvent.PlayerClickBlock')?.desc, '组件点击');
	});

	test('parses 3.0 event fields with dotted event table types for sidebar search', async () => {
		const tempDir = fs.mkdtempSync(path.join(os.tmpdir(), 'miniworld-search-event-'));
		const filePath = path.join(tempDir, 'MNEvent.d.lua');
		fs.writeFileSync(filePath, [
			'--- @class TriggerEvent @触发器事件枚举',
			'--- @field GameStart EventInfo.TriggerEvent.GameStart @游戏创建 {}',
			'--- @field PlayerClickBlock EventInfo.TriggerEvent.PlayerClickBlock @点击方块 {blockid:方块类型, x,y,z:事件位置}',
			'local TriggerEvent = {}',
		].join('\n'));

		const items = await parseLuaDeclarations(filePath, '3.0');

		assert.strictEqual(items.length, 1);
		assert.strictEqual(items[0].kind, 'event');
		assert.strictEqual(items[0].fields.length, 2);
		assert.strictEqual(items[0].fields[0].name, 'GameStart');
		assert.ok(items[0].fields[1].type.startsWith('event|'));
		const eventInfo = JSON.parse(items[0].fields[1].type.substring(6));
		assert.strictEqual(eventInfo.blockid, '方块类型');
		assert.strictEqual(eventInfo.x, '事件位置');
	});

	test('resolves event keys from named callback registrations', () => {
		const source = [
			'local s = {}',
			'function s:test(e)',
			'  print(e.)',
			'end',
			'function s:OnStart()',
			'  s:AddEvent(TriggerEvent.BlockAdd, self.test)',
			'  s:AddTriggerEvent(ObjectEvent.BlockAdd, s.test)',
			'end',
		].join('\n');

		assert.deepStrictEqual(findEventKeysForFunction(source, 's:test'), [
			'TriggerEvent.BlockAdd',
			'ObjectEvent.BlockAdd',
		]);
		assert.deepStrictEqual(findEventKeysForFunction(source, 's:missing'), []);
	});

	test('resolves 2.0 event keys from ScriptSupportEvent registrations', () => {
		const source = [
			'local function click(e)',
			'  print(e.blockid)',
			'end',
			'ScriptSupportEvent:registerEvent([=[Player.ClickBlock]=], click)',
			"ScriptSupportEvent:registerEvent('Game.Hour', click)",
		].join('\n');

		assert.deepStrictEqual(findEventKeysForFunction(source, 'click'), [
			'Player.ClickBlock',
			'Game.Hour',
		]);
	});

	test('resolves event keys from event table parameter annotations', () => {
		const lines = [
			'local s = {}',
			'',
			'--- @param e EventInfo.TriggerEvent.BlockAdd',
			'function s:test(e)',
			'end',
		];

		assert.deepStrictEqual(findAnnotatedEventKeysForParam(lines, 3, 'e'), ['TriggerEvent.BlockAdd']);
		assert.deepStrictEqual(findAnnotatedEventKeysForParam(lines, 3, 'other'), []);
	});

	test('builds 3.0 completion items filtered by event class', () => {
		const definitions = new Map<string, { desc?: string; event_info?: Record<string, string> }>([
			['TriggerEvent.PlayerClickBlock', { desc: '当任意玩家点击方块', event_info: { blockid: '方块类型' } }],
			['TriggerEvent.GameStart', { desc: '游戏创建' }],
			['ObjectEvent.PlayerClickBlock', { desc: '当此玩家点击方块' }],
		]);

		const triggerItems = buildClassCompletionItems(definitions, 'TriggerEvent');
		const objectItems = buildClassCompletionItems(definitions, 'ObjectEvent');

		// 只包含 TriggerEvent 前缀的键，去掉类名前缀作为补全名
		assert.strictEqual(triggerItems.length, 2);
		assert.strictEqual(triggerItems[0].label, 'PlayerClickBlock');
		assert.strictEqual(triggerItems[0].detail, '当任意玩家点击方块');
		assert.strictEqual(triggerItems[0].insertText, 'PlayerClickBlock');
		assert.strictEqual(triggerItems[1].label, 'GameStart');
		// 3.0 使用枚举引用，不挂长括号包裹命令
		assert.strictEqual(triggerItems[0].command, undefined);

		assert.strictEqual(objectItems.length, 1);
		assert.strictEqual(objectItems[0].label, 'PlayerClickBlock');
		assert.strictEqual(objectItems[0].detail, '当此玩家点击方块');
	});
});

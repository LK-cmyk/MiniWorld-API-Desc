import { defineConfig } from '@vscode/test-cli';
import { fileURLToPath } from 'node:url';
import path from 'node:path';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const repoRoot = path.resolve(__dirname, '..');

export default defineConfig({
	cwd: repoRoot,
	files: './addon/out/test/**/*.test.js',
	launchArgs: ['--disable-extensions'],
});

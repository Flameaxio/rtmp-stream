module.exports = {
  env: {
    browser: true,
    es2021: true,
  },
  plugins: ['prettier'],
  extends: 'eslint:recommended',
  overrides: [],
  parserOptions: {
    ecmaVersion: 'latest',
    sourceType: 'module',
  },
  rules: {
    curly: ['error', 'all'],
    'require-await': 'error',
    'no-debugger': 'error',
    'prettier/prettier': 'error',
    indent: ['error', 2],
    semi: ['error', 'never'],
  },
}

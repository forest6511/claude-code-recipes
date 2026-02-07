import { test, expect } from '@playwright/test';

test.describe('ログインフォーム', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('http://localhost:3000/login');
  });

  test('正常なログイン', async ({ page }) => {
    await page.getByRole('textbox', { name: 'メールアドレス' }).fill('user@example.com');
    await page.getByRole('textbox', { name: 'パスワード' }).fill('password123');
    await page.getByRole('button', { name: 'ログイン' }).click();
    await expect(page.getByRole('heading', { name: 'ダッシュボード' })).toBeVisible();
  });

  test('パスワードが間違っている場合', async ({ page }) => {
    await page.getByRole('textbox', { name: 'メールアドレス' }).fill('user@example.com');
    await page.getByRole('textbox', { name: 'パスワード' }).fill('wrong');
    await page.getByRole('button', { name: 'ログイン' }).click();
    await expect(page.getByText('メールアドレスまたはパスワードが正しくありません')).toBeVisible();
  });

  test('空欄で送信した場合', async ({ page }) => {
    await page.getByRole('button', { name: 'ログイン' }).click();
    await expect(page.getByText('メールアドレスを入力してください')).toBeVisible();
  });
});

/**
 * MCPサーバーのinstructionsフィールド設定例
 *
 * instructionsは、Claude CodeのTool Searchが適切なツールを
 * 見つけるためのヒントとして機能します。
 * ユーザーのプロンプトとinstructionsのマッチングにより、
 * 関連性の高いサーバーのツールが優先的に検索されます。
 */

import { McpServer } from "@modelcontextprotocol/sdk/server/mcp.js";

const server = new McpServer({
  name: "project-management",
  version: "1.0.0",
  instructions:
    "プロジェクト管理ツールを提供します。タスクの作成・更新・検索、" +
    "スプリント管理、バックログの優先度設定が可能です。" +
    "Jira、Linear、Asanaのようなプロジェクト管理に関する質問で利用してください。",
});

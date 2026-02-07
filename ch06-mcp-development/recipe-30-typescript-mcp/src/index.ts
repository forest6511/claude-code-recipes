import { McpServer } from "@modelcontextprotocol/sdk/server/mcp.js";
import { StdioServerTransport } from "@modelcontextprotocol/sdk/server/stdio.js";
import { z } from "zod";

// サーバーインスタンスの作成
const server = new McpServer({
  name: "todo",
  version: "1.0.0",
});

// インメモリのタスクストア
interface Todo {
  id: string;
  title: string;
  completed: boolean;
  createdAt: string;
}

const todos: Map<string, Todo> = new Map();
let nextId = 1;

// ツール登録: タスクの追加
server.registerTool(
  "add_todo",
  {
    description:
      "新しいタスクを追加します。タイトルは必須です。追加されたタスクのIDを返します。",
    inputSchema: {
      title: z
        .string()
        .min(1)
        .max(200)
        .describe("タスクのタイトル（1〜200文字）"),
    },
  },
  async ({ title }) => {
    const id = `todo_${nextId++}`;
    const todo: Todo = {
      id,
      title,
      completed: false,
      createdAt: new Date().toISOString(),
    };
    todos.set(id, todo);
    return {
      content: [
        {
          type: "text" as const,
          text: JSON.stringify({ id, message: `タスク「${title}」を追加しました` }),
        },
      ],
    };
  }
);

// ツール登録: タスク一覧の取得
server.registerTool(
  "list_todos",
  {
    description:
      "登録されているタスクの一覧を取得します。パラメータは不要です。タスクがない場合は空の配列を返します。",
    inputSchema: {},
  },
  async () => {
    const allTodos = Array.from(todos.values());
    return {
      content: [
        {
          type: "text" as const,
          text: JSON.stringify(allTodos, null, 2),
        },
      ],
    };
  }
);

// ツール登録: タスクの完了
server.registerTool(
  "complete_todo",
  {
    description:
      "指定されたIDのタスクを完了状態にします。存在しないIDの場合はエラーを返します。",
    inputSchema: {
      id: z.string().describe("完了にするタスクのID（例: todo_1）"),
    },
  },
  async ({ id }) => {
    const todo = todos.get(id);
    if (!todo) {
      return {
        content: [
          {
            type: "text" as const,
            text: `エラー: タスクID「${id}」が見つかりません。list_todosで現在のタスク一覧を確認してください。`,
          },
        ],
        isError: true,
      };
    }
    todo.completed = true;
    return {
      content: [
        {
          type: "text" as const,
          text: JSON.stringify({
            id,
            message: `タスク「${todo.title}」を完了にしました`,
          }),
        },
      ],
    };
  }
);

// サーバーの起動
async function main() {
  const transport = new StdioServerTransport();
  await server.connect(transport);
  console.error("Todo MCP Server running on stdio");
}

main().catch((error) => {
  console.error("Fatal error in main():", error);
  process.exit(1);
});

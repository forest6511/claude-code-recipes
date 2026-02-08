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
          type: "text",
          text: JSON.stringify(todo, null, 2),
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
      "タスクの一覧を取得します。statusでフィルタリングできます。",
    inputSchema: {
      status: z
        .enum(["all", "completed", "pending"])
        .default("all")
        .describe("フィルタ条件: all=全件, completed=完了済み, pending=未完了"),
    },
  },
  async ({ status }) => {
    let result = Array.from(todos.values());
    if (status === "completed") {
      result = result.filter((t) => t.completed);
    } else if (status === "pending") {
      result = result.filter((t) => !t.completed);
    }
    return {
      content: [
        {
          type: "text",
          text:
            result.length === 0
              ? "タスクはありません。"
              : JSON.stringify(result, null, 2),
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
      "指定されたIDのタスクを完了状態にします。IDはtodo_で始まる文字列です。",
    inputSchema: {
      id: z.string().describe("タスクのID（例: todo_1）"),
    },
  },
  async ({ id }) => {
    const todo = todos.get(id);
    if (!todo) {
      return {
        content: [
          {
            type: "text",
            text: `エラー: ID '${id}' のタスクが見つかりません。list_todosで有効なIDを確認してください。`,
          },
        ],
        isError: true,
      };
    }
    todo.completed = true;
    return {
      content: [
        {
          type: "text",
          text: JSON.stringify(todo, null, 2),
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

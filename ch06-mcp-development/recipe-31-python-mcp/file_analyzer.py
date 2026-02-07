import os
from pathlib import Path
from mcp.server.fastmcp import FastMCP

# FastMCPサーバーの初期化
mcp = FastMCP("file-analyzer")


@mcp.tool()
async def analyze_file(file_path: str) -> str:
    """指定されたファイルの統計情報を返します。

    Args:
        file_path: 分析対象のファイルの絶対パス（例: /Users/user/project/src/main.py）
    """
    path = Path(file_path)

    if not path.is_absolute():
        return f"エラー: 絶対パスを指定してください。受け取ったパス: {file_path}"

    if not path.exists():
        return f"エラー: ファイルが見つかりません: {file_path}"

    if not path.is_file():
        return f"エラー: ディレクトリではなくファイルを指定してください: {file_path}"

    stat = path.stat()
    try:
        content = path.read_text(encoding="utf-8")
        lines = content.split("\n")
        return (
            f"ファイル: {path.name}\n"
            f"パス: {file_path}\n"
            f"サイズ: {stat.st_size:,} bytes\n"
            f"行数: {len(lines)}\n"
            f"文字数: {len(content)}\n"
            f"拡張子: {path.suffix or 'なし'}"
        )
    except UnicodeDecodeError:
        return (
            f"ファイル: {path.name}\n"
            f"パス: {file_path}\n"
            f"サイズ: {stat.st_size:,} bytes\n"
            f"注意: バイナリファイルのため、行数と文字数は取得できません"
        )


@mcp.tool()
async def analyze_directory(dir_path: str, extension: str = "") -> str:
    """指定されたディレクトリの統計情報を返します。

    Args:
        dir_path: 分析対象のディレクトリの絶対パス（例: /Users/user/project/src）
        extension: フィルタする拡張子（例: .py）。空の場合は全ファイルを対象
    """
    path = Path(dir_path)

    if not path.is_absolute():
        return f"エラー: 絶対パスを指定してください。受け取ったパス: {dir_path}"

    if not path.exists():
        return f"エラー: ディレクトリが見つかりません: {dir_path}"

    if not path.is_dir():
        return f"エラー: ファイルではなくディレクトリを指定してください: {dir_path}"

    files = []
    total_size = 0
    total_lines = 0

    for f in sorted(path.rglob(f"*{extension}" if extension else "*")):
        if f.is_file() and not any(part.startswith(".") for part in f.parts):
            stat = f.stat()
            total_size += stat.st_size
            try:
                content = f.read_text(encoding="utf-8")
                line_count = len(content.split("\n"))
                total_lines += line_count
                files.append(f"  {f.relative_to(path)}: {line_count} lines, {stat.st_size:,} bytes")
            except (UnicodeDecodeError, PermissionError):
                files.append(f"  {f.relative_to(path)}: (binary), {stat.st_size:,} bytes")

    result = (
        f"ディレクトリ: {path.name}\n"
        f"パス: {dir_path}\n"
        f"ファイル数: {len(files)}\n"
        f"合計サイズ: {total_size:,} bytes\n"
        f"合計行数: {total_lines:,}\n"
        f"\nファイル一覧:\n" + "\n".join(files[:50])
    )

    if len(files) > 50:
        result += f"\n  ... 他 {len(files) - 50} ファイル"

    return result


if __name__ == "__main__":
    mcp.run(transport="stdio")

#!/bin/bash
# Git Worktreeの基本操作スクリプト
# 使い方: ./worktree-setup.sh [create|list|remove] [branch-name]

set -euo pipefail

ACTION=${1:-list}
BRANCH=${2:-}
PROJECT_NAME=$(basename "$(git rev-parse --show-toplevel)")

case "$ACTION" in
  create)
    if [ -z "$BRANCH" ]; then
      echo "Usage: $0 create <branch-name>"
      exit 1
    fi
    WORKTREE_DIR="../${PROJECT_NAME}-${BRANCH//\//-}"
    echo "Creating worktree: $WORKTREE_DIR (branch: $BRANCH)"
    git worktree add "$WORKTREE_DIR" -b "$BRANCH"
    echo ""
    echo "Worktree created. Start Claude Code:"
    echo "  cd $WORKTREE_DIR && claude"
    ;;

  list)
    echo "Active worktrees:"
    git worktree list
    ;;

  remove)
    if [ -z "$BRANCH" ]; then
      echo "Usage: $0 remove <branch-name>"
      exit 1
    fi
    WORKTREE_DIR="../${PROJECT_NAME}-${BRANCH//\//-}"
    echo "Removing worktree: $WORKTREE_DIR"
    git worktree remove "$WORKTREE_DIR"
    echo "Worktree removed."
    ;;

  *)
    echo "Usage: $0 [create|list|remove] [branch-name]"
    exit 1
    ;;
esac

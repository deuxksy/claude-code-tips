# Claude Code 45가지 팁: 기초부터 고급까지

Claude Code를 최대한 활용하기 위한 팁입니다. 커스텀 status line 스크립트, 시스템 프롬프트 절반으로 줄이기, Gemini CLI를 Claude Code의 minion으로 사용하기, 컨테이너에서 Claude Code 자체 실행하기 등. 또한 [dx plugin](#tip-44-install-the-dx-plugin) 포함.

📺 [빠른 데모](https://www.youtube.com/watch?v=hiISl558JGE) - 다중 Claude 워크플로우와 음성 입력으로 일부 팁 시연:

[![데모 비디오 썸네일](../assets/demo-thumbnail.png)](https://www.youtube.com/watch?v=hiISl558JGE)

<!-- TOC -->
## 목차

- [Tip 0: Customize your status line](#tip-0-customize-your-status-line)
- [Tip 1: Learn a few essential slash commands](#tip-1-learn-a-few-essential-slash-commands)
- [Tip 2: Talk to Claude Code with your voice](#tip-2-talk-to-claude-code-with-your-voice)
- [Tip 3: Break down large problems into smaller ones](#tip-3-break-down-large-problems-into-smaller-ones)
- [Tip 4: Using Git and GitHub CLI like a pro](#tip-4-using-git-and-github-cli-like-a-pro)
- [Tip 5: AI context is like milk; it's best served fresh and condensed!](#tip-5-ai-context-is-like-milk-its-best-served-fresh-and-condensed)
- [Tip 6: Getting output out of your terminal](#tip-6-getting-output-out-of-your-terminal)
- [Tip 7: Set up terminal aliases for quick access](#tip-7-set-up-terminal-aliases-for-quick-access)
- [Tip 8: Proactively compact your context](#tip-8-proactively-compact-your-context)
- [Tip 9: Complete the write-test cycle for autonomous tasks](#tip-9-complete-the-write-test-cycle-for-autonomous-tasks)
- [Tip 10: Cmd+A and Ctrl+A are your friends](#tip-10-cmda-and-ctrla-are-your-friends)
- [Tip 11: Use Gemini CLI as a fallback for blocked sites](#tip-11-use-gemini-cli-as-a-fallback-for-blocked-sites)
- [Tip 12: Invest in your own workflow](#tip-12-invest-in-your-own-workflow)
- [Tip 13: Search through your conversation history](#tip-13-search-through-your-conversation-history)
- [Tip 14: Multitasking with terminal tabs](#tip-14-multitasking-with-terminal-tabs)
- [Tip 15: Slim down the system prompt](#tip-15-slim-down-the-system-prompt)
- [Tip 16: Git worktrees for parallel branch work](#tip-16-git-worktrees-for-parallel-branch-work)
- [Tip 17: Manual exponential backoff for long-running jobs](#tip-17-manual-exponential-backoff-for-long-running-jobs)
- [Tip 18: Claude Code as a writing assistant](#tip-18-claude-code-as-a-writing-assistant)
- [Tip 19: Markdown is the s**t](#tip-19-markdown-is-the-st)
- [Tip 20: Use Notion to preserve links when pasting](#tip-20-use-notion-to-preserve-links-when-pasting)
- [Tip 21: Containers for long-running risky tasks](#tip-21-containers-for-long-running-risky-tasks)
- [Tip 22: The best way to get better at using Claude Code is by using it](#tip-22-the-best-way-to-get-better-at-using-claude-code-is-by-using-it)
- [Tip 23: Clone/fork and half-clone conversations](#tip-23-clonefork-and-half-clone-conversations)
- [Tip 24: Use realpath to get absolute paths](#tip-24-use-realpath-to-get-absolute-paths)
- [Tip 25: Understanding CLAUDE.md vs Skills vs Slash Commands vs Plugins](#tip-25-understanding-claudemd-vs-skills-vs-slash-commands-vs-plugins)
- [Tip 26: Interactive PR reviews](#tip-26-interactive-pr-reviews)
- [Tip 27: Claude Code as a research tool](#tip-27-claude-code-as-a-research-tool)
- [Tip 28: Mastering different ways of verifying its output](#tip-28-mastering-different-ways-of-verifying-its-output)
- [Tip 29: Claude Code as a DevOps engineer](#tip-29-claude-code-as-a-devops-engineer)
- [Tip 30: Keep CLAUDE.md simple and review it periodically](#tip-30-keep-claudemd-simple-and-review-it-periodically)
- [Tip 31: Claude Code as the universal interface](#tip-31-claude-code-as-the-universal-interface)
- [Tip 32: It's all about choosing the right level of abstraction](#tip-32-its-all-about-choosing-the-right-level-of-abstraction)
- [Tip 33: Audit your approved commands](#tip-33-audit-your-approved-commands)
- [Tip 34: Write lots of tests (and use TDD)](#tip-34-write-lots-of-tests-and-use-tdd)
- [Tip 35: Be braver in the unknown; iterative problem solving](#tip-35-be-braver-in-the-unknown-iterative-problem-solving)
- [Tip 36: Running bash commands and subagents in the background](#tip-36-running-bash-commands-and-subagents-in-the-background)
- [Tip 37: The era of personalized software is here](#tip-37-the-era-of-personalized-software-is-here)
- [Tip 38: Navigating and editing your input box](#tip-38-navigating-and-editing-your-input-box)
- [Tip 39: Spend some time planning, but also prototype quickly](#tip-39-spend-some-time-planning-but-also-prototype-quickly)
- [Tip 40: Simplify overcomplicated code](#tip-40-simplify-overcomplicated-code)
- [Tip 41: Automation of automation](#tip-41-automation-of-automation)
- [Tip 42: Share your knowledge and contribute where you can](#tip-42-share-your-knowledge-and-contribute-where-you-can)
- [Tip 43: Keep learning!](#tip-43-keep-learning)
- [Tip 44: Install the dx plugin](#tip-44-install-the-dx-plugin)
- [Tip 45: Quick setup script](#tip-45-quick-setup-script)

<!-- /TOC -->

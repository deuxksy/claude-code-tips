# Claude Code 45가지 팁: 기초부터 고급까지

[English](../README.md) | [한국어](ko/README.md)

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

## Tip 0: Customize your status line

Claude Code 하단의 status line을 커스터마이즈하여 유용한 정보를 표시할 수 있습니다. 저는 모델, 현재 디렉토리, git 브랜치(있는 경우), 커밋되지 않은 파일 수, origin과의 동기화 상태, 토큰 사용량의 시각적 진행률 바를 표시하도록 설정했습니다. 또한 마지막 메시지를 보여주는 두 번째 줄이 있어 대화 내용을 기억할 수 있습니다:

```
Opus 4.5 | 📁claude-code-tips | 🔀main (scripts/context-bar.sh uncommitted, synced 12m ago) | ██░░░░░░░░ 18% of 200k tokens
💬 This is good. I don't think we need to change the documentation as long as we don't say that the default color is orange el...
```

이는 특히 컨텍스트 사용량을 모니터링하고 작업 중인 내용을 기억하는 데 유용합니다. 스크립트는 10가지 색상 테마(orange, blue, teal, green, lavender, rose, gold, slate, cyan, gray)를 지원합니다.

![Color preview options](../scripts/color-preview.png)

설정하려면 [샘플 스크립트](../scripts/context-bar.sh)를 사용하고 [설정 지침](../scripts/README.md)을 확인하세요.

## Tip 1: Learn a few essential slash commands

내장된 slash command가 많습니다 (`/`를 입력하여 모두 확인). 여기 몇 가지 알아두면 좋은 명령어들이 있습니다:

### /usage

rate limits을 확인하세요:

```
 Current session
 █████████▌                                         19% used
 Resets 12:59am (America/Vancouver)

 Current week (all models)
 █████████████████████▌                             43% used
 Resets Feb 3 at 1:59pm (America/Vancouver)

 Current week (Sonnet only)
 ███████████████████▌                               39% used
 Resets 8:59am (America/Vancouver)
```

사용량을 면밀히 모니터링하려면 탭에서 열어두고 Tab 후 Shift+Tab 또는 ← 후 →를 사용하여 새로고침하세요.

### /chrome

Claude의 기본 브라우저 통합을 토글합니다:

```
> /chrome
Chrome integration enabled
```

### /mcp

MCP (Model Context Protocol) 서버를 관리합니다:

```
 Manage MCP servers
 1 server

 ❯ 1. playwright  ✔ connected · Enter to view details

 MCP Config locations (by scope):
  • User config (available in all your projects):
    • /Users/yk/.claude.json
```

### /stats

GitHub 스타일의 활동 그래프로 사용 통계를 확인합니다:

```
      Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec Jan
      ··········································▒█░▓░█░▓▒▒
  Mon ·········································▒▒██▓░█▓█░█
      ·········································░▒█▒▓░█▒█▒█
  Wed ········································░▓▒█▓▓░▒▓▒██
      ········································░▓░█▓▓▓▓█░▒█
  Fri ········································▒░░▓▒▒█▓▓▓█
      ········································▒▒░▓░░▓▒▒░░

      Less ░ ▒ ▓ █ More

  Favorite model: Opus 4.5        Total tokens: 17.6m

  Sessions: 4.1k                  Longest session: 20h 40m 45s
  Active days: 79/80              Longest streak: 75 days
  Most active day: Jan 26         Current streak: 74 days

  You've used ~24x more tokens than War and Peace
```

### /clear

대화를 지우고 새로 시작합니다.

## Tip 2: Talk to Claude Code with your voice

음성으로 전달하는 것이 타이핑하는 것보다 훨씬 빠르게 소통할 수 있다는 것을 알게 되었습니다. 로컬 머신에서 음성 전사 시스템을 사용하는 것이 정말 도움이 됩니다.

Mac에서 저는 몇 가지 다른 옵션을 시도했습니다:
- [superwhisper](https://superwhisper.com/)
- [MacWhisper](https://goodsnooze.gumroad.com/l/macwhisper)
- [Super Voice Assistant](https://github.com/ykdojo/super-voice-assistant) (오픈 소스, Parakeet v2/v3 지원)

호스팅 서비스를 사용하면 더 정확할 수 있지만, 이 목적에는 로컬 모델도 충분히 강력하다는 것을 알게 되었습니다. 전사에 실수나 오타가 있어도 Claude는 당신이 말하려는 것을 이해할 만큼 똑똑합니다. 때로는 특정 내용을 더 명확하게 말해야 하지만, 전반적으로 로컬 모델도 충분히 잘 작동합니다.

예를 들어, 이 스크린샷에서 Claude가 "ExcelElanishMark"와 "advast"와 같이 잘못 전사된 단어를 "exclamation mark"와 "Advanced"로 올바르게 해석한 것을 볼 수 있습니다:

![Voice transcription mistakes interpreted correctly](../assets/voice-transcription-mistakes.png)

이것을 생각하는 가장 좋은 방법은 친구와 소통하는 것과 같다는 것입니다. 물론 텍스트로 소통할 수 있습니다. 어떤 사람들에게는 더 쉬울 수 있고, 이메일도 가능합니다. Claude Code를 사용하는 대부분의 사람들이 그렇게 합니다. 하지만 더 빨리 소통하고 싶다면 왜 빠른 전화를 하지 않을까요? 음성 메시지를 보낼 수 있습니다. Claude Code와 문자 그대로 전화를 할 필요는 없습니다. 음성 메시지를 여러 개 보내면 됩니다. 지난 몇 년 동안 말하는 기술을 연습한 사람으로서, 저에게는 더 빠릅니다. 하지만 대부분의 사람들에게도 더 빠를 것이라고 생각합니다.

일반적인 반대 의견은 "다른 사람이 있는 방에서는 어떡하나?"입니다. 저는 이어폰을 사용하고 속삭입니다 - 개인적으로 Apple EarPods(AirPods 아님)를 좋아합니다. 저렴하고, 품질이 충분히 좋으며, 조용히 속삭이면 됩니다. 다른 사람 앞에서도 해봤는데 잘 작동합니다. 사무실에서는 사람들이 어차피 이야기합니다 - 동료와 이야기하는 대신 음성 전사 시스템과 조용히 이야기하는 것입니다. 저는 그것에 문제가 없다고 생각합니다. 이 방법은 너무 잘 작동해서 비행기에서도 작동합니다. 다른 사람이 당신을 듣지 않을 만큼 조용하지만, 마이크에 충분히 가까이 말하면 로컬 모델은 당신이 말하는 내용을 이해할 수 있습니다. (사실 저는 비행기에서 이 방법으로 이 문단을 쓰고 있습니다.)

## Tip 3: Break down large problems into smaller ones

이것은 마스터해야 할 가장 중요한 개념 중 하나입니다. 기존 소프트웨어 엔지니어링과 완전히 동일합니다 - 최고의 소프트웨어 엔지니어들은 이미 이것을 하는 방법을 알고 있으며, Claude Code에도 적용됩니다.

Claude Code가 어려운 문제나 코딩 작업을 한 번에 해결하지 못하는 것 같다면, 여러 개의 작은 문제로 나누도록 요청하세요. 개별 부분을 해결할 수 있는지 확인하세요. 여전히 너무 어렵다면 더 작은 하위 문제를 해결할 수 있는지 확인하세요. 모든 것이 해결 가능할 때까지 계속하세요.

본질적으로, A에서 B로 가는 대신:

![Direct approach](../assets/breakdown-direct.png)

A에서 A1에서 A2에서 A3를 거쳐 B로 갈 수 있습니다:

![Step-by-step approach](../assets/breakdown-steps.png)

이것의 좋은 예는 제가 자신의 음성 전사 시스템을 구축할 때였습니다. 사용자가 모델을 선택하고 다운로드할 수 있게 하고, 키보드 단축키를 받고, 전사를 시작하고, 전사된 텍스트를 사용자의 커서에 놓고, 이 모든 것을 멋진 UI로 래핑하는 시스템을 만들어야 했습니다. 그것은 많은 일입니다. 그래서 저는 더 작은 작업으로 나누었습니다. 먼저 모델을 다운로드하는 실행 파일을 만들었습니다. 그 다음 음성만 녹음하는 것을 만들었습니다. 그 다음 미리 녹음된 오디오만 전사하는 것을 만들었습니다. 저는 마지막에 결합하기 전에 하나씩 완료했습니다.

이것과 매우 관련이 있는 것: 문제 해결 기술과 소프트웨어 엔지니어링 기술은 agentic 코딩과 Claude Code의 세계에서도 여전히 매우 관련이 있습니다. 스스로 많은 문제를 해결할 수 있지만, 일반적인 문제 해결 및 소프트웨어 엔지니어링 기술을 적용하면 훨씬 더 강력해집니다.

## Tip 4: Using Git and GitHub CLI like a pro

Claude에게 Git 및 GitHub CLI 작업을 처리하도록 요청하세요. 여기에는 커밋(커밋 메시지를 수동으로 작성할 필요 없음), 브랜칭, 풀링, 푸싱이 포함됩니다.

저는 개인적으로 pull은 자동으로 허용하지만 push는 그렇지 않습니다. 왜냐하면 push가 더 위험하기 때문입니다 - pull에 문제가 생겨도 origin이 오염되지 않습니다.

GitHub CLI(`gh`)의 경우 할 수 있는 것이 많습니다. Claude Code를 사용한 후 제가 더 많이 하기 시작한 것 한 가지는 draft PR을 만드는 것입니다. 이렇게 하면 Claude Code가 낮은 위험으로 PR 생성 프로세스를 처리할 수 있습니다 - 검토할 준비가 되었다고 표시하기 전에 모든 것을 검토할 수 있습니다.

그리고 `gh`는 꽤 강력합니다. GraphQL 쿼리까지 보낼 수 있습니다. 예를 들어, GitHub PR 설명이 편집된 정확한 시간까지 찾을 수 있습니다:

```
⏺ Bash(gh api graphql -f query='
      query {
        repository(owner: "...", name: "...") {
          pullRequest(number: ...) {
            userContentEdits(first: 100) {
              nodes { editedAt editor { login } }
            }
          }
        }
      }')

⏺ Here's the full edit history for your PR description:

  | #  | Edited At (UTC)     | Editor |
  |----|---------------------|--------|
  | 1  | 2025-12-01 00:08:34 | ykdojo |
  | 2  | 2025-12-01 15:57:21 | ykdojo |
  | 3  | 2025-12-01 16:24:33 | ykdojo |
  | 4  | 2025-12-01 16:27:00 | ykdojo |
  | 5  | 2025-12-04 00:40:02 | ykdojo |
  ...
```

### Disable commit/PR attribution

기본적으로 Claude Code는 커밋에 `Co-Authored-By` 트레일러를 추가하고 PR에 attribution footer를 추가합니다. `~/.claude/settings.json`에 이것을 추가하여 둘 다 비활성화할 수 있습니다:

```json
{
  "attribution": {
    "commit": "",
    "pr": ""
  }
}
```

둘 다 빈 문자열로 설정하면 attribution이 완전히 제거됩니다. 이것은 이제 deprecated된 오래된 `includeCoAuthoredBy` 설정을 대체합니다.

## Tip 5: AI context is like milk; it's best served fresh and condensed!

Claude Code로 새 대화를 시작하면 대화의 이전 부분에서 이전 컨텍스트를 처리해야 하는 추가 복잡성이 없기 때문에 최고의 성능을 발휘합니다. 하지만 더 오래 이야기할수록 컨텍스트가 길어지고 성능이 저하되는 경향이 있습니다.

따라서 모든 새 주제에 대해 새 대화를 시작하거나 성능이 저하되기 시작하면 새 대화를 시작하는 것이 가장 좋습니다.

## Tip 6: Getting output out of your terminal

때로는 Claude Code의 출력을 복사하여 붙여넣고 싶지만, 터미널에서 직접 복사하는 것이 항상 깨끗하지는 않습니다. 콘텐츠를 더 쉽게 가져오는 몇 가지 방법이 있습니다:

- **`/copy` command**: 가장 간단한 옵션 - `/copy`를 입력하여 Claude의 마지막 응답을 markdown으로 클립보드에 복사
- **Clipboard directly**: Mac 또는 Linux에서 Claude에게 `pbcopy`를 사용하도록 요청하여 출력을 바로 클립보드로 보낼 수 있습니다
- **Write to a file**: Claude에게 콘텐츠를 파일에 넣도록 한 다음 VS Code(또는 좋아하는 에디터)에서 열도록 요청하여 거기서 복사할 수 있습니다. 줄 번호를 지정할 수도 있으므로 Claude가 방금 편집한 특정 줄을 열도록 요청할 수 있습니다. Markdown 파일의 경우 VS Code에서 열리면 Cmd+Shift+P(Linux/Windows에서는 Ctrl+Shift+P)를 사용하고 "Markdown: Open Preview"를 선택하여 렌더링된 버전을 볼 수 있습니다
- **Opening URLs**: 직접 확인하려는 URL이 있는 경우 Claude에게 브라우저에서 열도록 요청하세요. Mac에서는 `open` 명령을 사용하도록 요청할 수 있지만, 일반적으로 좋아하는 브라우저에서 열도록 요청하면 모든 플랫폼에서 작동해야 합니다
- **GitHub Desktop**: Claude에게 현재 repo를 GitHub Desktop에서 열도록 요청할 수 있습니다. 이것은 비루트 디렉토리에서 작업할 때 특히 유용합니다 - 예를 들어 다른 디렉토리에 git worktree를 만들도록 요청했고 아직 거기서 Claude Code를 열지 않은 경우

이 중 일부를 결합할 수도 있습니다. 예를 들어, GitHub PR 설명을 편집하려는 경우 Claude가 직접 편집하게 하는 대신(실수를 할 수 있음), 먼저 콘텐츠를 로컬 파일에 복사하도록 할 수 있습니다. 그것이 편집하게 하고, 결과를 직접 확인한 다음, 좋아 보이면 Claude가 복사하여 GitHub PR에 다시 붙여넣도록 합니다. 이것은 정말 잘 작동합니다. 또는 직접 수행하려는 경우 VS Code에서 열도록 요청하거나 pbcopy를 통해 제공하도록 요청하여 수동으로 복사하여 붙여넣을 수 있습니다.

물론 이 명령어들을 직접 실행할 수 있지만, 반복적으로 수행하고 있다는 것을 발견하면 Claude가 실행하도록 하는 것이 도움이 됩니다.

## Tip 7: Set up terminal aliases for quick access

Claude Code 때문에 터미널을 더 사용하게 되어 빠르게 시작할 수 있도록 짧은 별칭을 설정하는 것이 도움이 된다는 것을 알게 되었습니다. 여기 제가 사용하는 것들이 있습니다:

- `c` for Claude Code (제가 가장 많이 사용하는 것입니다)
- `ch` for Claude Code with Chrome integration
- `gb` for GitHub Desktop
- `co` for VS Code
- `q`: 대부분의 프로젝트가 있는 프로젝트 디렉토리로 이동합니다. 그 다음 개별 프로젝트 폴더로 이동하거나, `c`를 실행하여 Claude Code에서 해당 폴더의 모든 프로젝트에 기본적으로 접근할 수 있습니다.

이것들을 설정하려면 셸 설정 파일(`~/.zshrc` 또는 `~/.bashrc`)에 다음과 같은 줄을 추가하세요:

```bash
alias c='claude'
alias ch='claude --chrome'
alias gb='github'
alias co='code'
alias q='cd ~/Desktop/projects'
```

이 별칭들이 있으면 플래그와 결합할 수 있습니다: `c -c`는 마지막 대화를 계속하고, `c -r`은 재개할 최근 대화 목록을 표시합니다. 이것은 Chrome 세션용 `ch`에서도 작동합니다(`ch -c`, `ch -r`).

## Tip 8: Proactively compact your context

Claude Code에는 대화를 요약하여 컨텍스트 공간을 확보하는 `/compact` 명령이 있습니다. 사용 가능한 전체 컨텍스트가 채워지면 자동 압축도 발생합니다. Opus 4.5의 총 사용 가능한 컨텍스트 창은 현재 200k이며, 그중 45k는 자동 압축을 위해 예약되어 있습니다. 전체 200k의 약 10%가 시스템 프롬프트, 도구, 메모리, 동적 컨텍스트로 자동 채워집니다. 하지만 저는 적극적으로 수동으로 조정하는 것이 더 좋다는 것을 알게 되었습니다. `/config`로 auto-compact를 껐습니다. 주요 대화에 더 많은 컨텍스트를 사용할 수 있고 언제 어떻게 압축이 발생하는지 더 많은 제어를 할 수 있기 때문입니다.

제가 이것을 하는 방법은 새로 시작하기 전에 Claude에게 handoff 문서를 작성하도록 요청하는 것입니다. 다음과 같이:

> Put the rest of the plan in the system-prompt-extraction folder as HANDOFF.md. Explain what you have tried, what worked, what didn't work, so that the next agent with fresh context is able to just load that file and nothing else to get started on this task and finish it up.

Claude는 작업의 현재 상태를 요약하는 파일을 만듭니다:

```
⏺ Write(experiments/system-prompt-extraction/HANDOFF.md)
  ⎿  Wrote 129 lines to experiments/system-prompt-extraction/HANDOFF.md
     # System Prompt Slimming - Handoff Document
     ## Goal
     Reduce Claude Code's system prompt by ~45% (currently at 11%, need ~34% more).
     ## Current Progress
     ### What's Been Done
     - **Backup/restore system**: `backup-cli.sh` and `restore-cli.sh` with SHA256 verification
     - **Patch system**: `patch-cli.js` that restores from backup then applies patches
     ...
```

Claude가 작성한 후 빠르게 검토하세요. 누락된 것이 있으면 편집을 요청하세요:

> Did you add a note about iteratively testing instead of trying to do everything all at once?

그런 다음 새 대화를 시작하세요. 새 agent의 경우 파일 경로만 주고 다른 것은 없이 작동해야 합니다:

```
> experiments/system-prompt-extraction/HANDOFF.md
```

후속 대화에서 agent에게 다음 agent를 위해 문서를 업데이트하도록 요청할 수 있습니다.

또한 이것을 자동화하는 `/handoff` slash command를 만들었습니다 - 기존 HANDOFF.md를 확인하고, 있으면 읽은 다음 목표, 진행 상황, 작동한 것, 작동하지 않은 것, 다음 단계로 생성하거나 업데이트합니다. [skills folder](../skills/handoff/SKILL.md)에서 찾을 수 있거나 [dx plugin](#tip-44-install-the-dx-plugin)을 통해 설치할 수 있습니다.

**Alternative: Use plan mode**

또 다른 옵션은 plan mode를 사용하는 것입니다. `/plan` 또는 Shift+Tab으로 입력하세요. Claude에게 다음 agent를 위해 모든 관련 컨텍스트를 수집하고 포괄적인 계획을 만들도록 요청하세요:

> I just enabled plan mode. Bring over all of the context that you need for the next agent. The next agent will not have any other context, so you'll need to be pretty comprehensive.

Claude는 코드베이스를 탐색하고, 컨텍스트를 수집하고, 자세한 계획을 작성합니다. 완료되면 다음과 같은 옵션이 표시됩니다:

```
Would you like to proceed?

❯ 1. Yes, clear context and auto-accept edits (shift+tab)
  2. Yes, auto-accept edits
  3. Yes, manually approve edits
  4. Type here to tell Claude what to change
```

옵션 1은 이전 컨텍스트를 지우고 계획으로 새로 시작합니다. 새 Claude 인스턴스는 계획만 보므로 오래된 대화의 짐 없이 집중할 수 있습니다. 또한 특정 세부 정보를 조회해야 하는 경우 오래된 전사 기록 파일에 대한 링크도 받습니다.

## Tip 9: Complete the write-test cycle for autonomous tasks

Claude Code가 `git bisect`와 같은 것을 자율적으로 실행하도록 하려면 결과를 검증할 방법을 제공해야 합니다. 핵심은 작성-테스트 주기를 완료하는 것입니다: 코드를 작성하고, 실행하고, 출력을 확인하고, 반복합니다.

예를 들어, Claude Code 자체에서 작업 중이고 `/compact`가 작동을 멈추고 400 오류를 throw하기 시작한 것을 발견했다고 가정해 보세요. 이것을 caused한 정확한 커밋을 찾는 고전적인 도구는 `git bisect`입니다. 좋은 점은 Claude Code가 스스로 bisect를 실행하도록 할 수 있지만 각 커밋을 테스트할 방법이 필요합니다.

Claude Code와 같은 대화형 터미널이 포함된 작업의 경우 tmux를 사용할 수 있습니다. 패턴은 다음과 같습니다:

1. tmux 세션 시작
2. 명령 보내기
3. 출력 캡처
4. 예상한 것인지 확인

다음은 `/context`가 작동하는지 테스트하는 간단한 예입니다:

```bash
tmux kill-session -t test-session 2>/dev/null
tmux new-session -d -s test-session
tmux send-keys -t test-session 'claude' Enter
sleep 2
tmux send-keys -t test-session '/context' Enter
sleep 1
tmux capture-pane -t test-session -p
```

이와 같은 테스트가 있으면 Claude Code는 `git bisect`를 실행하고 문제를 일으킨 커밋을 찾을 때까지 각 커밋을 자동으로 테스트할 수 있습니다.

이것은 소프트웨어 엔지니어링 기술이 여전히 중요한 이유의 예이기도 합니다. 소프트웨어 엔지니어라면 `git bisect`와 같은 도구에 대해 알고 있을 것입니다. 그 지식은 AI로 작업할 때도 여전히 정말 가치 있습니다 - 새로운 방식으로 적용할 뿐입니다.

또 다른 예는 간단히 테스트를 작성하는 것입니다. Claude Code가 코드를 작성하도록 한 후 테스트하려면 자신을 위해 테스트도 작성하도록 할 수 있습니다. 그리고 스스로 실행하도록 하고 수정할 수 있다면 수정하게 하세요. 물론 항상 올바른 방향으로 가지는 않고 때로는 감독해야 하지만, 놀랍게도 많은 코딩 작업을 스스로 할 수 있습니다.

### Creative testing strategies

때로는 작성-테스트 주기를 완료하는 방법에서 창의적이어야 합니다. 예를 들어, 웹 앱을 구축하는 경우 Playwright MCP, Chrome DevTools MCP 또는 Claude의 기본 브라우저 통합(`/chrome` 통해)을 사용할 수 있습니다. Chrome DevTools는 아직 시도하지 않았지만 Playwright와 Claude의 기본 통합은 시도했습니다. 전반적으로 Playwright가 일반적으로 더 잘 작동합니다. 많은 컨텍스트를 사용하지만 200k 컨텍스트 창은 일반적으로 단일 작업 또는 몇 개의 작은 작업에 충분합니다.

이 두 가지의 주요 차이점은 Playwright가 스크린샷을 찍는 대신 접근성 트리(페이지 요소에 대한 구조화된 데이터)에 중점을 둔다는 것입니다. 스크린샷을 찍을 수 있는 기능이 있지만 일반적으로 작업을 수행하기 위해 사용하지 않습니다. 반면에 Claude의 기본 브라우저 통합은 특정 좌표로 요소를 클릭하는 데 더 중점을 둡니다. 때로는 무작위 것들을 클릭할 수 있고 전체 프로세스가 느릴 수 있습니다.

이것은 시간이 지남에 따라 개선될 수 있지만 기본적으로 시각적으로 집중되지 않은 대부분의 작업에는 Playwright를 선택할 것입니다. 로그인된 상태를 사용해야 하는데 자격 증명을 제공하지 않으려는 경우(자체 브라우저 프로필에서 실행되므로) 또는 좌표를 사용하여 시각적으로 특정 것들을 클릭해야 하는 경우에만 Claude의 기본 브라우저 통합을 사용할 것입니다.

이것이 제가 기본적으로 Claude의 기본 브라우저 통합을 비활성화하고 이전에 정의한 `ch` 바로 가기를 통해 사용하는 이유입니다. 그렇게 하면 Playwright가 대부분의 브라우저 작업을 처리하고 특별히 필요할 때만 Claude의 기본 통합을 활성화합니다.

또한 좌표 대신 접근성 트리 ref를 사용하도록 요청할 수 있습니다. 제가 이것을 위해 CLAUDE.md에 넣은 것은 다음과 같습니다:

```markdown
# Claude for Chrome

- Use `read_page` to get element refs from the accessibility tree
- Use `find` to locate elements by description
- Click/interact using `ref`, not coordinates
- NEVER take screenshots unless explicitly requested by the user
```

개인적인 경험에서, Python 라이브러리([Daft](https://github.com/Eventual-Inc/Daft))에서 작업하고 있었고 Google Colab에서 로컬로 구축한 버전을 테스트해야 하는 상황도 있었습니다. 문제는 Google Colab에서 Rust 백엔드로 Python 라이브러리를 구축하기 어렵다는 것입니다 - 잘 작동하지 않는 것 같습니다. 그래서 실제로 로컬로 wheel을 구축한 다음 수동으로 업로드하여 Google Colab에서 실행할 수 있어야 했습니다. 또한 monkey patching도 시도했는데, 전체 wheel을 로컬로 구축할 때까지 기다려야 하는 단기적으로 잘 작동했습니다. 저는 이러한 테스트 전략을 생각해 냈고 Claude Code와 왕복하면서 실행했습니다.

또 다른 상황은 Windows에서 무언가를 테스트해야 하는데 Windows 머신을 실행하지 않는다는 것입니다. 같은 repo의 CI 테스트가 Windows에서 Rust 문제로 실패하고 있어 로컬로 테스트할 방법이 없었습니다. 따라서 모든 변경 사항으로 draft PR을 만들고 동일한 변경 사항과 비주요 브랜치에서 Windows CI 실행을 활성화한 또 다른 draft PR을 만들어야 했습니다. Claude Code에게 모든 것을 수행하도록 지시했고 새 브랜치에서 CI를 직접 테스트했습니다.

## Tip 10: Cmd+A and Ctrl+A are your friends

몇 년 동안 이 말을 해왔습니다: Cmd+A와 Ctrl+A는 AI 세계의 친구입니다. 이것은 Claude Code에도 적용됩니다.

때로는 Claude Code에 URL을 주고 싶지만 직접 액세스할 수 없는 경우가 있습니다. 비공개 페이지(민감한 데이터는 아니지만 공개적으로 액세스할 수 없음) 또는 Claude Code가 가져오는 데 문제가 있는 Reddit 게시물과 같은 것일 수 있습니다. 그러한 경우 보는 모든 내용을 선택(Mac에서는 Cmd+A, 다른 플랫폼에서는 Ctrl+A)하고 복사하여 Claude Code에 직접 붙여넣을 수 있습니다. 꽤 강력한 방법입니다.

이것은 터미널 출력에도 효과적입니다. Claude Code 자체 또는 다른 CLI 응용 프로그램의 출력이 있는 경우 같은 트릭을 사용할 수 있습니다: 모두 선택, 복사, CC에 다시 붙여넣기. 꽤 도움이 됩니다.

일부 페이지는 기본적으로 모두 선택하기에 적합하지 않지만 - 먼저 더 나은 상태로 만드는 트릭이 있습니다. 예를 들어, Gmail 스레드의 경우 Print All을 클릭하여 인쇄 미리보기를 가져옵니다(실제 인쇄는 취소). 해당 페이지는 스레드의 모든 이메일이 확장되어 표시하므로 전체 대화를 깔끔하게 Cmd+A할 수 있습니다.

이것은 Claude Code뿐만 아니라 모든 AI에 적용됩니다.

## Tip 11: Use Gemini CLI as a fallback for blocked sites

Claude Code의 WebFetch 도구는 Reddit과 같은 특정 사이트에 액세스할 수 없습니다. 하지만 Claude에게 Gemini CLI를 대안으로 사용하도록 지시하는 skill을 만들어 이것을 우회할 수 있습니다. Gemini는 웹 액세스를 가지고 있으며 Claude가 직접 도달할 수 없는 사이트에서 콘텐츠를 가져올 수 있습니다.

이것은 Tip 9의 동일한 tmux 패턴을 사용합니다 - 세션 시작, 명령 전송, 출력 캡처. skill 파일은 `~/.claude/skills/reddit-fetch/SKILL.md`에 들어갑니다. 전체 내용은 [skills/reddit-fetch/SKILL.md](../skills/reddit-fetch/SKILL.md)를 참조하세요.

Skills는 필요할 때만 로드되므로 더 토큰 효율적입니다. 더 간단한 것이 필요하면 `~/.claude/CLAUDE.md`에 압축된 버전을 넣을 수 있지만, 필요하지 않아도 모든 대화에 로드됩니다.

저는 Claude Code에게 Reddit에서 Claude Code skills가 어떻게 간주되는지 확인하도록 요청하여 이것을 테스트했습니다 - 약간 메타입니다. 잠시 동안 Gemini와 왕복하므로 빠르지 않지만 보고서 품질은 놀랍게도 좋았습니다. 당연히 이것이 작동하려면 Gemini CLI가 설치되어 있어야 합니다. 또한 [dx plugin](#tip-44-install-the-dx-plugin)을 통해 이 skill을 설치할 수 있습니다.

## Tip 12: Invest in your own workflow

개인적으로 저는 Swift로 처음부터 자신의 음성 전사 앱을 만들었습니다. Claude Code를 사용하여 bash로 처음부터 자신의 커스텀 상태 표시줄을 만들었습니다. 그리고 Claude Code의 축소된 JavaScript 파일에서 시스템 프롬프트를 단순화하는 자신만의 시스템을 만들었습니다.

하지만 그렇게 과도하게 할 필요는 없습니다. CLAUDE.md를 돌보는 것, 목표를 달성하는 데 도움이 될 수 있으면서 가능한 한 간결하게 만드는 것 - 그런 것들이 도움이 됩니다. 그리고 물론 이러한 팁을 배우고, 이러한 도구를 배우고, 가장 중요한 일부 기능을 배우는 것.

이것들은 당신이 무엇이든 구축하는 데 사용하는 도구에 대한 투자입니다. 적어도 약간의 시간을 그것에 쓰는 것이 중요하다고 생각합니다.

## Tip 13: Search through your conversation history

Claude Code에게 과거 대화에 대해 물어볼 수 있으며 찾고 검색하는 데 도움이 됩니다. 대화 기록은 `~/.claude/projects/`에 로컬로 저장되며 폴더 이름은 프로젝트 경로를 기반으로 합니다(슬래시는 대시가 됨).

예를 들어, `/Users/yk/Desktop/projects/claude-code-tips`에 있는 프로젝트의 대화는 다음에 저장됩니다:

```
~/.claude/projects/-Users-yk-Desktop-projects-claude-code-tips/
```

각 대화는 `.jsonl` 파일입니다. 기본 bash 명령으로 검색할 수 있습니다:

```bash
# Find all conversations mentioning "Reddit"
grep -l -i "reddit" ~/.claude/projects/-Users-yk-Desktop-projects-*/*.jsonl

# Find today's conversations about a topic
find ~/.claude/projects/-Users-yk-Desktop-projects-*/*.jsonl -mtime 0 -exec grep -l -i "keyword" {} \;

# Extract just the user messages from a conversation (requires jq)
cat ~/.claude/projects/.../conversation-id.jsonl | jq -r 'select(.type=="user") | .message.content'
```

또는 Claude Code에 직접 물어보세요: "What did we talk about regarding X today?" 그러면 기록을 검색해 줍니다.

## Tip 14: Multitasking with terminal tabs

여러 Claude Code 인스턴스를 실행할 때 Git worktrees와 같은 특정 기술 설정보다 체계적으로 유지하는 것이 더 중요합니다. 한 번에 최대 3~4개 작업에 중점을 두는 것이 좋습니다.

저의 개인적인 방법은 "캐스케이드"라고 부르는 것입니다 - 새 작업을 시작할 때마다 오른쪽에 새 탭을 엽니다. 그런 다음 왼쪽에서 오른쪽으로, 왼쪽에서 오른쪽으로 쓸어서 가장 오래된 작업에서 최신 작업으로 이동합니다. 특정 작업을 확인해야 하거나 알림을 받아야 할 때를 제외하고 일반적인 방향은 일관되게 유지됩니다.

제 설정이 일반적으로 어떻게 보이는지는 다음과 같습니다:

![Terminal tabs showing multitasking workflow](../assets/multitasking-terminal-tabs.png)

이 예에서:
1. **왼쪽 탭** - 음성 전사 시스템을 실행하는 지속적인 탭(항상 여기에 유지)
2. **두 번째 탭** - Docker 컨테이너 설정
3. **세 번째 탭** - 로컬 머신의 디스크 사용량 확인
4. **네 번째 탭** - 엔지니어링 프로젝트 작업
5. **다섯 번째 탭(현재)** - 이 팁 작성

## Tip 15: Slim down the system prompt

Claude Code의 시스템 프롬프트와 도구 정의는 작업을 시작하기도 전에 약 19k 토큰(200k 컨텍스트의 약 10%)을 차지합니다. 저는 이것을 약 9k 토큰으로 줄이는 패치 시스템을 만들었습니다 - 약 10,000 토큰(오버헤드의 ~50%)을 절약합니다.

| Component | Before | After | Savings |
|-----------|--------|-------|---------|
| System prompt | 3.0k | 1.8k | 1,200 tokens |
| System tools | 15.6k | 7.4k | 8,200 tokens |
| **Total** | **~19k** | **~9k** | **~10k tokens (~50%)** |

패치 전후의 `/context` 모습은 다음과 같습니다:

**Unpatched (~20k, 10%)**

![Unpatched context](../assets/context-unpatched.png)

**Patched (~10k, 5%)**

![Patched context](../assets/context-patched.png)

패치는 필수적인 지침을 유지하면서 축소된 CLI 번들에서 장황한 예와 중복 텍스트를 잘라내어 작동합니다.

저는 이것을 광범위하게 테스트했으며 잘 작동합니다. 더 원시적 느낌 - 더 강력하지만 약간 덜 규제되는 것 같습니다. 시스템 지침이 더 짧기 때문입니다. 이렇게 사용하면 더 전문적인 도구 느낌이 듭니다. 더 낮은 컨텍스트로 시작하는 것을 정말 좋아합니다. 채워지기 전에 더 많은 공간이 있어 대화를 조금 더 계속할 수 있는 옵션이 있기 때문입니다. 이것이 확실히 이 전략의 가장 좋은 부분입니다.

패치 스크립트와 잘리는 것에 대한 전체 세부 정보는 [system-prompt folder](../system-prompt/)를 확인하세요.

**Why patching?** Claude Code에는 파일에서 단순화된 시스템 프롬프트를 제공하는 플래그(`--system-prompt` 또는 `--system-prompt-file`)가 있으므로 그것이 또 다른 방법입니다. 하지만 도구 설명의 경우 사용자 지정할 수 있는 공식 옵션이 없습니다. CLI 번들을 패치하는 것이 유일한 방법입니다. 내 패치 시스템은 모든 것을 하나의 통합된 접근 방식으로 처리하므로 지금은 이렇게 유지하고 있습니다. 나중에 플래그를 사용하여 시스템 프롬프트 부분을 다시 구현할 수 있습니다.

**Supported installations:** npm and native binary (macOS and Linux).

**Important**: 패치된 시스템 프롬프트를 유지하려면 `~/.claude/settings.json`에 이것을 추가하여 auto-updates를 비활성화하세요:

```json
{
  "env": {
    "DISABLE_AUTOUPDATER": "1"
  }
}
```

이것은 shell 타입(interactive, non-interactive, tmux)에 관계없이 모든 Claude Code 세션에 적용됩니다. 나중에 새 버전에 패치를 다시 적용할 준비가 되면 수동으로 업데이트할 수 있습니다.

### MCP 도구 지연 로드

MCP 서버를 사용하는 경우 기본적으로 모든 대화에 도구 정의가 로드됩니다 - 사용하지 않더라도 마찬가지입니다. 특히 여러 서버가 구성된 경우 상당한 오버헤드가 추가될 수 있습니다.

필요할 때만 MCP 도구가 로드되도록 lazy-loading을 활성화하세요:

```json
{
  "env": {
    "ENABLE_TOOL_SEARCH": "true"
  }
}
```

이것을 `~/.claude/settings.json`에 추가하세요. Claude는 필요할 때 MCP 도구를 검색하고 로드하며 처음부터 모든 것이 있도록 하지 않습니다. 버전 2.1.7부터 MCP 도구 설명이 컨텍스트 창의 10%를 초과하면 자동으로 발생합니다.

## Tip 16: Git worktrees for parallel branch work

동일한 프로젝트에서 동시에 여러 작업을 수행하고 있고 충돌이 발생하지 않게 하려면 Git worktrees가 좋은 방법입니다. git worktree를 만들도록 Claude Code에 요청하고 거기서 작업을 시작할 수 있습니다 - 특정 문법을 걱정할 필요가 없습니다.

기본 아이디어는 다른 디렉토리에서 다른 브랜치에서 작업할 수 있다는 것입니다. 본질적으로 브랜치 + 디렉토리입니다.

멀티태스킹 팁에서 논의한 캐스케이드 방법 위에 이 Git worktrees 레이어를 추가할 수 있습니다.

### Git worktrees란 무엇인가요?

Git worktree는 다른 git 브랜치와 같지만 새로운 디렉토리가 특별히 할당되어 있습니다.

예를 들어 main 브랜치와 feature-branch-1에서 작업 중이라면 git worktrees가 없으면 프로젝트 폴더가 한 번에 하나의 브랜치에만 설정될 수 있으므로 한 번에 하나만 작업할 수 있습니다.

하지만 git worktree를 사용하면 원래 프로젝트 폴더에서 main 브랜치(또는 다른 브랜치)에서 계속 작업하면서 동시에 새 폴더에서 feature-branch-1에서 작업할 수 있습니다.

![별도 디렉토리에서 병렬 브랜치 작업을 보여주는 Git worktrees 다이어그램](../assets/git-worktrees.png)

## Tip 17: Manual exponential backoff for long-running jobs

Docker 빌드 또는 GitHub CI와 같은 오래 실행되는 작업을 기다릴 때 Claude Code에 수동 exponential backoff를 수행하도록 요청할 수 있습니다. Exponential backoff는 소프트웨어 엔지니어링의 일반적인 기술이지만 여기서도 적용할 수 있습니다. 점차 길어지는 sleep 간격으로 상태를 확인하도록 Claude Code에 요청하세요 - 1분, 그 다음 2분, 그 다음 4분 등입니다. 전통적인 의미에서 프로그래밍 방식으로 수행하는 것은 아닙니다 - AI가 수동으로 수행합니다 - 하지만 꽤 잘 작동합니다.

이 방법으로 agent는 지속적으로 상태를 확인하고 완료되면 알려줄 수 있습니다.

(GitHub CI의 경우 특히 `gh run watch`가 있지만 지속적으로 많은 줄을 출력하므로 토큰을 낭비합니다. `gh run view <run-id> | grep <job-name>`을 통한 수동 exponential backoff가 실제로 더 토큰 효율적입니다. 이것은 또한 전용 대기 명령이 없을 때도 잘 작동하는 일반적인 기술입니다.)

예를 들어, 백그라운드에서 Docker 빌드를 실행 중인 경우:

![Docker 빌드 진행 상황을 확인하는 수동 exponential backoff](../assets/manual-exponential-backoff.png)

그리고 작업이 완료될 때까지 계속 진행됩니다.

## Tip 18: Claude Code as a writing assistant

Claude Code는 훌륭한 작성 도우미이자 파트너입니다. 제가 작성을 위해 사용하는 방법은 먼저 작성하려는 것에 대한 모든 컨텍스트를 제공한 다음 음성을 사용하여 말로 자세한 지침을 제공합니다. 그러면 첫 번째 초안이 나옵니다. 충분히 좋지 않으면 몇 번 시도합니다.

그런 다음 줄별로 거의 다 살펴봅니다. 좋아요, 같이 살펴봅시다라고 말합니다. 저는 이런 이유로 이 줄을 좋아합니다. 이 줄은 저기로 이동해야 한다고 느낍니다. 이 줄은 이 특정한 방식으로 변경되어야 합니다. 참고 자료에 대해서도 물어볼 수 있습니다.

그래서 이런 종류의 왕복 프로세스인데, 아마 왼쪽에 터미널이 있고 오른쪽에 코드 에디터가 있을 것입니다:

![Claude Code와 함께하는 나란한 작성 워크플로우](../assets/writing-assistant-side-by-side.png)

이것은 정말 잘 작동합니다.

## Tip 19: Markdown is the s**t

일반적으로 사람들이 새 문서를 작성할 때 Google Docs나 Notion과 같은 것을 사용할 수 있습니다. 하지만 이제는 솔직하게 markdown이 가장 효율적인 방법이라고 생각합니다.

AI가 등장하기 전에도 markdown은 꽤 좋았지만 특히 Claude Code의 경우 작성과 관련하여 언급한 것처럼 매우 효율적이므로 markdown의 가치가 더 높아졌다고 생각합니다. 블로그 게시물 또는 LinkedIn 게시물을 작성하려는 경우 언제든지 Claude Code와 대화하고 markdown으로 저장한 다음 거기서 진행할 수 있습니다.

이것에 대한 빠른 팁: markdown 콘텐츠를 쉽게 받아들이지 않는 플랫폼에 복사하여 붙여넣으려는 경우 먼저 새 Notion 파일에 붙여넣은 다음 Notion에서 다른 플랫폼으로 복사할 수 있습니다. Notion은 다른 플랫폼이 받아들일 수 있는 형식으로 변환합니다. 일반 붙여넣기가 작동하지 않으면 Command + Shift + V를 사용하여 서식 없이 붙여넣으세요.

## Tip 20: Use Notion to preserve links when pasting

반대로도 작동한다는 것이 밝혀졌습니다. 다른 곳(예: Slack)에서 링크가 있는 텍스트가 있는 경우 복사할 수 있습니다. Claude Code에 직접 붙여넣으면 링크가 표시되지 않습니다. 하지만 먼저 Notion 문서에 넣은 다음 거기서 복사하면 markdown으로 얻을 수 있으며 물론 Claude Code가 읽을 수 있습니다.

## Tip 21: Containers for long-running risky tasks

일반 세션은 부여하는 권한을 제어하고 출력을 더 신중하게 검토하는 체계적인 작업을 위한 것입니다. 컨테이너화된 환경은 작은 것마다 권한을 부여할 필요가 없는 `--dangerously-skip-permissions` 세션에 적합합니다. 당분간 스스로 실행하도록 둘 수 있습니다.

이것은 오래 걸리고 위험할 수 있는 연구나 실험에 유용합니다. 좋은 예는 Tip 11의 Reddit 연구 워크플로우입니다. 여기서 reddit-fetch skill은 tmux를 통해 Gemini CLI와 왕복합니다. 주 시스템에서 감독 없이 실행하는 것은 위험하지만 컨테이너에서는 문제가 발생해도 포함됩니다.

또 다른 예는 제가 이 저장소에서 [system prompt patching scripts](../system-prompt/)를 만든 방법입니다. Claude Code의 새 버전이 나올 때 minified CLI 번들에 대한 패치를 업데이트해야 합니다. 호스트 머신(모든 것에 액세스하는 곳)에서 `--dangerously-skip-permissions`로 Claude Code를 실행하는 대신 컨테이너에서 실행합니다. Claude Code는 minified JavaScript를 탐색하고 변수 매핑을 찾고 모든 작은 것을 승인하지 않고 새 패치 파일을 만들 수 있습니다.

사실 그것은 거의 자체적으로 마이그레이션을 완료할 수 있었습니다. 패치를 적용하려고 시도하고 일부가 새 버전에서 작동하지 않는다는 것을 발견하고 수정하기 위해 반복하고 배운 내용을 바탕으로 향후 인스턴스를 위해 [instruction document](../system-prompt/UPGRADING.md)를 개선했습니다.

사실 저는 컨테이너화된 Claude Code 세션을 쉽게 실행하기 위해 [SafeClaw](https://github.com/ykdojo/safeclaw)를 만들었습니다. 여러 개의 격리된 세션을 시작하고 각각 웹 터미널을 가지며 대시보드에서 모두 관리할 수 있습니다. 이 저장소의 여러 사용자 정의를 사용합니다. 최적화된 시스템 프롬프트, [DX plugin](#tip-44-install-the-dx-plugin), [status line](#tip-0-customize-your-status-line)을 포함합니다.

### Advanced: 컨테이너에서 worker Claude Code 오케스트레이션

로컬 Claude Code가 컨테이너 내에서 실행 중인 다른 Claude Code 인스턴스를 제어하도록 하여 이것을 더 발전시킬 수 있습니다. 요령은 tmux를 제어 레이어로 사용하는 것입니다:

1. 로컬 Claude Code가 tmux 세션을 시작합니다
2. 해당 tmux 세션에서 컨테이너를 실행하거나 연결합니다
3. 컨테이너 내부에서 Claude Code가 `--dangerously-skip-permissions`로 실행됩니다
4. 외부 Claude Code는 `tmux send-keys`를 사용하여 프롬프트를 보내고 `capture-pane`을 사용하여 출력을 읽습니다

이것은 완전히 자율적인 "worker" Claude Code를 제공하여 모든 작업을 승인하지 않고 실험적이거나 오래 실행되는 작업을 실행할 수 있습니다. 완료되면 로컬 Claude Code가 결과를 다시 가져올 수 있습니다. 문제가 발생해도 모두 컨테이너에 샌드박싱됩니다.

### Advanced: 다중 모델 오케스트레이션

Claude Code뿐만 아니라 컨테이너에서 다른 AI CLI를 실행할 수 있습니다 - Codex, Gemini CLI 또는 기타. 저는 코드 검토를 위해 OpenAI Codex를 시도했고 잘 작동합니다. 핵심은 호스트 머신에서 직접 이러한 CLI를 실행할 수 없다는 것이 아닙니다 - 분명히 할 수 있습니다. 가치는 Claude Code의 UI/UX가 매끄러워서 그냥 말하고 오케스트레이션을 처리하도록 할 수 있다는 것입니다. 다른 모델 시작, 컨테이너와 호스트 간의 데이터 전송. 터미널 간 수동 전환 및 복사-붙여넣기 대신 Claude Code가 모든 것을 조정하는 중앙 인터페이스가 됩니다.

## Tip 22: The best way to get better at using Claude Code is by using it

최근에 세계적 수준의 암벽 등반가가 다른 암벽 등반가와 인터뷰하는 것을 보았습니다. 그녀는 "암벽 등반을 어떻게 더 잘하게 되었나요?"라고 물었습니다. 그녀는 단순히 "암벽 등반을 하면서요"라고 말했습니다.

저도 이것에 대해 같은 느낌을 받습니다. 물론 비디오를 보고, 책을 읽고, 팁을 배우는 등 보충할 수 있는 것들이 있습니다. 하지만 Claude Code를 사용하는 것이 Claude Code를 사용하는 방법을 배우는 최고의 방법입니다. 일반적으로 AI를 사용하는 것이 AI를 사용하는 방법을 배우는 최고의 방법입니다.

10,000 시간 규칙 대신 10억 토큰 규칙으로 생각하는 것을 좋아합니다. AI에서 더 나아지고 그것이 어떻게 작동하는지 좋은 직관을 얻고 싶다면 가장 좋은 방법은 많은 토큰을 소비하는 것입니다. 그리고 요즘 가능합니다. 특히 Opus 4.5의 경우 충분히 강력하지만 충분히 저렴하여 동시에 여러 세션을 실행할 수 있다는 것을 알게 되었습니다. 토큰 사용량에 대해 그렇게 걱정할 필요가 없으므로 훨씬 더 자유로워집니다.

## Tip 23: Clone/fork and half-clone conversations

때로는 원래 스레드를 잃지 않고 대화의 특정 지점에서 다른 접근 방식을 시도하고 싶을 때가 있습니다. [clone-conversation script](../scripts/clone-conversation.sh)를 사용하면 새 UUID로 대화를 복제하여 분기할 수 있습니다.

**내장된 대안(최신 버전):** Claude Code에는 이제 기본 forking이 있습니다:
- `/fork` - 대화 내에서 현재 세션을 포크합니다
- `--fork-session` - `--resume` 또는 `--continue`와 함께 사용 (예: `claude -c --fork-session`)

`--fork-session`에는 단축 형식이 없으므로 `~/.zshrc` 또는 `~/.bashrc`에 이 함수를 추가하여 `--fs`를 단축키로 사용할 수 있습니다:

```bash
claude() {
  local args=()
  for arg in "$@"; do
    if [[ "$arg" == "--fs" ]]; then
      args+=("--fork-session")
    else
      args+=("$arg")
    fi
  done
  command claude "${args[@]}"
}
```

이것은 모든 `claude` 명령을 가로채서 `--fs`를 `--fork-session`으로 확장하고 다른 모든 것은 변경 없이 전달합니다. 별칭과도 작동합니다 ([Tip 7](#tip-7-set-up-terminal-aliases-for-quick-access) 참조): `c -c --fs`, `ch -c --fs` 등.

아래의 clone 스크립트는 이러한 내장 옵션보다 앞서지만 그 아래의 half-clone 스크립트는 컨텍스트를 줄이기 위해 여전히 고유합니다.

첫 번째 메시지는 `[CLONED <timestamp>]`(예: `[CLONED Jan 7 14:30]`)로 태그가 지정되며 `claude -r` 목록과 대화 내부 모두에 표시됩니다.

수동으로 설정하려면 두 파일 모두에 symlink를 만드세요:
```bash
ln -s /path/to/this/repo/scripts/clone-conversation.sh ~/.claude/scripts/clone-conversation.sh
ln -s /path/to/this/repo/skills/clone ~/.claude/skills/clone
```

또는 [dx plugin](#tip-44-install-the-dx-plugin)을 통해 설치 - symlink가 필요 없습니다.

이제 어떤 대화에서든 `/clone`(또는 플러그인을 사용하는 경우 `/dx:clone`)을 입력하면 Claude가 세션 ID를 찾고 스크립트를 실행합니다.

저는 이것을 광범위하게 테스트했고 복제가 정말 잘 작동합니다.

### 컨텍스트를 줄이기 위한 Half-clone

대화가 너무 길어지면 [half-clone-conversation script](../scripts/half-clone-conversation.sh)는 후반부만 유지합니다. 이것은 최근 작업을 보존하면서 토큰 사용량을 줄입니다. 첫 번째 메시지는 `[HALF-CLONE <timestamp>]`(예: `[HALF-CLONE Jan 7 14:30]`)로 태그가 지정됩니다.

수동으로 설정하려면 두 파일 모두에 symlink를 만드세요:
```bash
ln -s /path/to/this/repo/scripts/half-clone-conversation.sh ~/.claude/scripts/half-clone-conversation.sh
ln -s /path/to/this/repo/skills/half-clone ~/.claude/skills/half-clone
```

또는 [dx plugin](#tip-44-install-the-dx-plugin)을 통해 설치 - symlink가 필요 없습니다.

### Hook으로 half-clone 자동 제안

선택적으로 [hook](https://docs.anthropic.com/en/docs/claude-code/hooks)을 사용하여 컨텍스트가 너무 길어지면 자동으로 `/half-clone`을 트리거할 수 있습니다. [check-context script](../scripts/check-context.sh)는 모든 Claude 응답 후에 실행되고 컨텍스트 사용량을 확인합니다. 85% 이상이면 Claude에게 `/half-clone`을 실행하라고 알려주는데, 이것은 새 agent가 거기서 계속할 수 있도록 후반부만 있는 새 대화를 만듭니다.

설정하려면 먼저 스크립트를 복사하세요:
```bash
cp /path/to/this/repo/scripts/check-context.sh ~/.claude/scripts/check-context.sh
chmod +x ~/.claude/scripts/check-context.sh
```

그런 다음 `~/.claude/settings.json`에 hook을 추가하세요:
```json
{
  "hooks": {
    "Stop": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "~/.claude/scripts/check-context.sh"
          }
        ]
      }
    ]
  }
}
```

이것은 auto-compact가 비활성화되어야 합니다(`/config` > Auto-compact > false). 그렇지 않으면 Claude Code가 hook이 실행될 기회를 갖기 전에 컨텍스트를 압축할 수 있습니다. 트리거되면 hook이 Claude가 멈추는 것을 차단하고 `/half-clone`을 실행하라고 알립니다. auto-compact에 대한 장점은 half-clone이 결정적이고 빠르다는 것입니다 - 요약하는 대신 실제 메시지를 유지합니다.

### 복제 스크립트에 권장되는 권한

두 복제 스크립트 모두 `~/.claude`(대화 파일 및 기록용)를 읽어야 합니다. 어떤 프로젝트에서 권한 프롬프트를 피하려면 전역 설정(`~/.claude/settings.json`)에 이것을 추가하세요:
```json
{
  "permissions": {
    "allow": ["Read(~/.claude)"]
  }
}
```

## Tip 24: Use realpath to get absolute paths

Claude Code에 다른 폴더의 파일에 대해 알려줘야 할 때 `realpath`를 사용하여 전체 절대 경로를 얻으세요:

```bash
realpath some/relative/path
```

## Tip 25: Understanding CLAUDE.md vs Skills vs Slash Commands vs Plugins

이것들은 약간 비슷한 기능이며 저는 처음에 꽤 혼란스러웠습니다. 저는 그것들을 풀고 머리로 감싸려고 최선을 답했으므로 배운 것을 공유하고 싶었습니다.

**CLAUDE.md**는 가장 간단한 것입니다. 기본 프롬프트로 처리되는 파일들의 묶음으로 무조건 모든 대화의 시작에 로드됩니다. 좋은 점은 단순성입니다. 특정 프로젝트(`./CLAUDE.md`) 또는 전역(`~/.claude/CLAUDE.md`)에서 프로젝트가 무엇인지 설명할 수 있습니다.

**Skills**는 더 잘 구조화된 CLAUDE.md 파일과 같습니다. 관련할 때 Claude가 자동으로 호출하거나 사용자가 슬래시로 수동으로 호출할 수 있습니다(예: `/my-skill`). 예를 들어, 특정 언어로 단어를 발음하는 방법을 물을 때 적절한 서식으로 Google Translate 링크를 여는 skill을 가질 수 있습니다. 이러한 지침이 skill에 있으면 필요할 때만 로드됩니다. CLAUDE.md에 있으면 이미 거기에 공간을 차지하고 있습니다. 따라서 이론적으로 skills는 더 토큰 효율적입니다.

**Slash Commands**는 지침을 별도로 패키징하는 방법이라는 점에서 skills와 유사합니다. 사용자가 수동으로 호출하거나 Claude 자체가 호출할 수 있습니다. 더 정확한 것이 필요하고 자신의 속도로 올바른 시간에 호출하려면 slash commands를 사용하는 도구입니다.

Skills와 slash commands는 기능하는 방식이 꽤 비슷합니다. 차이점은 설계 의도입니다 - skills는 주로 Claude가 사용하도록 설계되었고 slash commands는 주로 사용자가 사용하도록 설계되었습니다. 하지만 그것들은 [병합](https://www.reddit.com/r/ClaudeAI/comments/1q92wwv/merged_commands_and_skills_in_213_update/)되었는데, 제가 [이 변경을 제안](https://github.com/anthropics/claude-code/issues/13115)했기 때문입니다.

**Plugins**는 skills, slash commands, agents, hooks, MCP 서버를 함께 패키징하는 방법입니다. 하지만 plugin이 모든 것을 사용할 필요는 없습니다. Anthropic의 공식 `frontend-design` plugin은 기본적으로 skill일 뿐이며 다른 것은 없습니다. 독립형 skill로 배포될 수 있지만 plugin 형식이 설치하기 쉽습니다.

예를 들어, 저는 이 저장소의 slash commands와 skill을 번들로 묶는 `dx`라는 plugin을 만들었습니다. [Install the dx plugin](#tip-44-install-the-dx-plugin) 섹션에서 작동 방식을 볼 수 있습니다.

## Tip 26: Interactive PR reviews

Claude Code는 PR 검토에 탁월합니다. 절차는 꽤 간단합니다. `gh` 명령을 사용하여 PR 정보를 검색하도록 요청한 다음 원하는 방식대로 검토를 진행할 수 있습니다.

일반적인 검토를 하거나 파일별로 단계별로 진행할 수 있습니다. 속도를 제어합니다. 얼마나 많은 세부 사항을 살펴볼지와 작업할 복잡성 수준을 제어합니다. 일반적인 구조를 이해하고 싶을 수도 있고 테스트도 실행하도록 할 수도 있습니다.

핵심 차이점은 Claude Code가 일회성 기계가 아니라 대화형 PR 검토자로 작동한다는 것입니다. 일부 AI 도구는 일회성 검토에 좋습니다(최신 GPT 모델 포함). 하지만 Claude Code로는 대화를 할 수 있습니다.

## Tip 27: Claude Code as a research tool

Claude Code는 어떤 종류의 연구에도 놀랍습니다. 본질적으로 Google 대체품 또는 심층 연구 대체품이지만 몇 가지 측면에서 더 고급스럽습니다. 특정 GitHub Actions가 실패한 이유를 조사하든(최근에 많이 하고 있습니다), Reddit에서 정서 또는 시장 분석을 하든, 코드베이스를 탐색하든, 무언가를 찾기 위해 공개 정보를 탐색하든 - 그것을 할 수 있습니다.

핵심은 올바른 정보 조각과 해당 정보 조각에 액세스하는 방법에 대한 지침을 제공하는 것입니다. `gh` 터미널 명령 액세스, 컨테이너 접근 방식(Tip 21), Gemini CLI를 통한 Reddit(Tip 11), Slack MCP와 같은 MCP를 통한 개인 정보, Cmd+A / Ctrl+A 방법(Tip 10)일 수 있습니다 - 무엇이든 상관없습니다. 또한 Claude Code가 특정 URL을 로드하는 데 문제가 있는 경우 Playwright MCP 또는 Claude의 기본 브라우저 통합을 시도할 수 있습니다(Tip 9 참조).

사실 저는 [Claude Code를 연구에 사용하여 $10,000를 절약](../content/how-i-saved-10k-with-claude-code.md)할 수 있었습니다.

## Tip 28: Mastering different ways of verifying its output

코드인 경우 출력을 검증하는 한 가지 방법은 테스트를 작성하도록 하고 테스트가 전반적으로 좋아 보이는지 확인하는 것입니다. 그것은 한 방법입니다. 물론 진행하는 동안 생성하는 코드를 Claude Code UI에서 바로 확인할 수 있습니다. 또 다른 것은 GitHub Desktop과 같은 시각적 Git 클라이언트를 사용하는 것입니다. 저는 개인적으로 그것을 사용합니다. 완벽한 제품은 아니지만 변경 사항을 빠르게 확인하기에는 충분합니다. 아마 이 게시물 앞부분에서 언급했듯이 PR을 생성하게 하는 것도 좋은 방법입니다. draft PR을 만들고 실제 PR로 만들기 전에 콘텐츠를 확인하세요.

또 다른 하나는 스스로, 자신의 작업을 확인하게 하는 것입니다. 어떤 종류의 출력을 주면 연구에서 나온 것으로 말하면 "이것에 확신이 있나요? 다시 확인할 수 있나요?"라고 말할 수 있습니다. 제가 좋아하는 프롬프트 중 하나는 "생성한 모든 것, 모든 단일 주장을 다시 확인하고 끝에 확인할 수 있었던 것의 표를 만드세요"라고 말하는 것입니다 - 그리고 그것은 정말 잘 작동하는 것 같습니다.

## Tip 29: Claude Code as a DevOps engineer

이것에 대해 별도의 팁을 만들고 싶었던 특별한 이유가 있습니다. 저에게 정말 놀랐기 때문입니다. GitHub Actions CI 실패가 있을 때마다 Claude Code에 맡기고 "이 문제를 파고들어 근본 원인을 찾으세요"라고 말합니다. 때로는 표면적인 답변을 주지만 계속 묻으면 - 특정 커밋 때문인가, 특정 PR 때문인가, 아니면 불안정한 문제인가? - 손으로 파고들기 어려운 these nasty issues를 파고드는 데 정말 도움이 됩니다. 로그를 통해 헤쳐나가야 하고 수동으로 하는 것은 super painful하지만 Claude Code는 그것의 많은 부분을 처리할 수 있습니다.

저는 이 워크플로우를 `/gha` slash command로 패키징했습니다 - GitHub Actions URL로 `/gha <url>`을 실행하기만 하면 자동으로 실패를 조사, 불안정성 확인, breaking commits 식별, 수정 제안을 합니다. [skills folder](../skills/gha/SKILL.md)에서 찾을 수 있거나 [dx plugin](#tip-44-install-the-dx-plugin)을 통해 설치할 수 있습니다.

특정 문제가 무엇이었는지 식별하면 draft PR을 만들고 앞서 언급한 일부 팁을 진행할 수 있습니다 - 출력을 확인하고 좋아 보이는지 확인하고 자체 출력을 확인한 다음 실제로 문제를 수정하기 위해 실제 PR로 만드세요. 저에게 개인적으로 정말 잘 작동하고 있습니다.

## Tip 30: Keep CLAUDE.md simple and review it periodically

CLAUDE.md를 간단하고 가능한 한 간결하게 유지하는 것이 중요합니다. CLAUDE.md가 전혀 없는 상태로 시작할 수 있습니다. 그리고 Claude Code에게 똑같은 것을 계속 말하고 있다는 것을 발견하면 CLAUDE.md에 추가할 수 있습니다. `#` 기호를 통해 그것을 할 수 있는 옵션이 있다는 것을 알지만 저는 Claude Code에게 프로젝트 수준 CLAUDE.md 또는 전역 CLAUDE.md에 추가하도록 요청하는 것을 선호하면 정확히 무엇을 편집해야 할지 알게 됩니다.

![Keep it simple meme](../assets/keep-it-simple-meme.jpg)

CLAUDE.md 파일을 주기적으로 검토하는 것도 중요합니다. 시간이 지남에 따라 outdated될 수 있기 때문입니다. 예전에는 의미가 있었던 지침이 더 이상 관련이 없을 수 있거나 문서화해야 할 새로운 패턴이 있을 수 있습니다. 저는 최근 대화를 분석하고 CLAUDE.md 파일에 대한 개선을 제안하는 [`review-claudemd`](../skills/review-claudemd/SKILL.md)라는 skill을 만들었습니다.

## Tip 31: Claude Code as the universal interface

Claude Code를 사용하면서 CLI는 새로운 IDE와 같다고 생각했습니다. 빠른 편집을 할 때마다 프로젝트를 열기에 가장 좋은 첫 번째 장소인 것은 여전히 사실입니다. 하지만 프로젝트의 심각성에 따라서는 vibe coding 수준에 머무르는 것보다 출력을 더 주의 깊게 검토해야 합니다.

또한 더 일반적인 경우로, Claude Code는 컴퓨터, 디지털 세계, 가지고 있는 모든 종류의 디지털 문제에 대한 진정한 보편 인터페이스라는 것도 사실입니다. 많은 경우 Claude Code가 해결하도록 할 수 있습니다. 예를 들어, 비디오를 빠르게 편집해야 하는 경우 요청하기만 하면 됩니다. ffmpeg나 유사한 것을 통해 방법을 찾아낼 것입니다. 로컬에 있는 오디오 파일이나 비디오 파일을 전사해야 하는 경우 요청하기만 하면 됩니다. Python을 통해 Whisper를 사용하도록 제안할 수 있습니다. CSV 파일에 있는 데이터를 분석해야 하는 경우 Python이나 JavaScript를 사용하여 시각화하도록 제안할 수 있습니다. 그리고 물론 인터넷 액세스 - Reddit, GitHub, MCP - 가능성은 무궁무진합니다.

로컬 컴퓨터에서 수행하려는 모든 작업에도 훌륭합니다. 예를 들어, 저장 공간이 부족한 경우 정리 방법에 대한 조언을 요청할 수 있습니다. 로컬 폴더와 파일을 살펴보고 공간을 많이 차지하는 것을 찾은 다음 정리 방법에 대한 조언을 줍니다. 특히 큰 파일을 삭제하는 등. 제 경우에는 정리해야 했던 정말 큰 Final Cut Pro 파일이 있었습니다. Claude Code가 알려주었습니다. 사용하지 않는 Docker 이미지와 컨테이너를 `docker system prune`을 사용하여 정리하라고 말할 수도 있습니다. 또한 여전히 존재하는지 몰랐던 캐시를 정리하라고 말할 수도 있습니다. 컴퓨터에서 무엇을 하고 싶든 Claude Code가 제가 가는 첫 번째 장소입니다.

컴퓨터는 텍스트 인터페이스로 시작했다는 것이 흥미롭다고 생각합니다. 그리고 우리는 어느 정도 이 텍스트 인터페이스로 돌아가고 있습니다. 앞서 언급했듯이 한 번에 세 네 개의 탭을 열 수 있습니다. 저에게는 정말 흥미롭습니다. 일종의 두 번째 뇌가 있는 것 같습니다. 하지만 구조화된 방식 때문에, 터미널 탭일 뿐이므로 세 번째 뇌, 네 번째 뇌, 다섯 번째 뇌, 여섯 번째 뇌를 열 수 있습니다. 그리고 모델이 더 강력해짐에 따라 이것들에 위임할 수 있는 사고의 비중 - 중요한 것들이 아니라 하고 싶지 않은 것들이나 지루하거나 너무 지루한 것들 - 그냥 그들에게 처리하도록 할 수 있습니다. 앞서 언급했듯이 이에 대한 좋은 예는 GitHub Actions를 살펴보는 것입니다. 누가 그걸 하고 싶나요? 하지만 이 agent들은 그런 지루한 작업에 정말 탁월한 것으로 밝혀졌습니다.

## Tip 32: It's all about choosing the right level of abstraction

앞서 언급했듯이 때로는 vibe coding 수준에 머무르는 것이 괜찮습니다. 일회성 프로젝트나 코드베이스의 비중요한 부분에서 작업하는 경우 모든 단일 코드 줄을 걱정할 필요는 없습니다. 하지만 다른 때는 조금 더 깊이 파고들어야 합니다. 파일 구조와 함수, 개별 코드 줄, 심지어 의존성까지 확인합니다.

![Vibe coding spectrum](../assets/vibe-coding-spectrum.png)

핵심은 이것이 이분법적이지 않다는 것입니다. 어떤 사람들은 vibe coding이 나쁘다고 하는데 무엇을 하고 있는지 모르기 때문이라고 하지만 때로는 완전히 괜찮습니다. 하지만 다른 때는 더 깊이 파고들어 소프트웨어 엔지니어링 기술을 사용하고 세부적인 수준에서 코드를 이해하거나 코드베이스의 일부나 특정 오류 로그를 복사하여 붙여넣어 Claude Code에 구체적인 질문을 하는 것이 도움이 됩니다.

거대한 빙산을 탐험하는 것과 같습니다. vibe coding 수준에 머물고 싶다면 멀리서 위를 비행하며 확인할 수 있습니다. 그런 다음 조금 더 가까이 갈 수 있습니다. 다이빙 모드로 들어갈 수 있습니다. Claude Code를 가이드로 하여 점점 더 깊이 들어갈 수 있습니다.

## Tip 33: Audit your approved commands

최근에 [이 게시물](https://www.reddit.com/r/ClaudeAI/comments/1pgxckk/claude_cli_deleted_my_entire_home_directory_wiped/)을 보았는데, 어떤 사람의 Claude Code가 `rm -rf tests/ patches/ plan/ ~/`를 실행하여 홈 디렉토리를 날려버렸습니다. vibe coder 실수로 일축하기 쉽지만 이런 종류의 실수는 누구에게나 일어날 수 있습니다. 따라서 승인된 명령을 때때로 감사하는 것이 중요합니다. 더 쉽게 하기 위해 **cc-safe**를 만들었습니다. `.claude/settings.json` 파일을 스캔하여 위험한 승인 명령을 찾는 CLI입니다.

다음과 같은 패턴을 감지합니다:
- `sudo`, `rm -rf`, `Bash`, `chmod 777`, `curl | sh`
- `git reset --hard`, `npm publish`, `docker run --privileged`
- 그리고 더 많습니다 - 컨테이너를 인식하므로 `docker exec` 명령은 건너뜁니다

모든 하위 디렉토리를 재귀적으로 스캔하므로 프로젝트 폴더를 가리키면 한 번에 모든 것을 확인할 수 있습니다. 수동으로 실행하거나 Claude Code에 실행하도록 요청할 수 있습니다:

```bash
npm install -g cc-safe
cc-safe ~/projects
```

또는 npx로 직접 실행:

```bash
npx cc-safe .
```

GitHub: [cc-safe](https://github.com/ykdojo/cc-safe)

## Tip 34: Write lots of tests (and use TDD)

Claude Code로 더 많은 코드를 작성하면 실수를 저지르기 쉬워집니다. PR 검토와 시각적 Git 클라이언트는 문제를 잡는 데 도움이 되지만(앞서 언급했듯이), 코드베이스가 커짐에 따라 테스트를 작성하는 것이 중요합니다.

Claude Code가 자신의 코드에 대한 테스트를 작성하도록 할 수 있습니다. 어떤 사람들은 AI가 자신의 작업을 테스트할 수 없다고 하지만 실제로 할 수 있습니다. 인간의 뇌가 작동하는 방식과 유사합니다. 테스트를 작성할 때 다른 방식으로 동일한 문제에 대해 생각합니다. AI에도 동일하게 적용됩니다.

Claude Code와 함께 TDD(Test-Driven Development)가 정말 잘 작동한다는 것을 알게 되었습니다:

1. 먼저 테스트 작성
2. 실패하는지 확인
3. 테스트 커밋
4. 통과하도록 코드 작성

실제로 제가 [cc-safe](https://github.com/ykdojo/cc-safe)를 만든 방식입니다. 실패하는 테스트를 먼저 작성하고 구현 전에 커밋하면 코드가 해야 할 일에 대한 명확한 계약을 만듭니다. 그런 다음 Claude Code는 구체적인 목표를 가지게 되며 테스트를 실행하여 구현이 올바른지 확인할 수 있습니다.

더 확실하게 하고 싶다면 테스트를 직접 검토하여 그냥 true를 반환하는 것 같은 바보짓을 하지 않는지 확인하세요.

## Tip 35: Be braver in the unknown; iterative problem solving

Claude Code를 더 강렬하게 사용하기 시작하면서 미지의 영역에서 점점 더 용감해진다는 것을 알게 되었습니다.

예를 들어, [Daft](https://github.com/Eventual-Inc/Daft)에서 일하기 시작했을 때 프론트엔드 코드에 문제가 있다는 것을 알게 되었습니다. 저는 React 전문가가 아니지만 그럼에도 불구하고 파고들기로 결정했습니다. 그냥 코드베이스와 문제에 대해 질문하기 시작했습니다. 결국 Claude Code로 반복적으로 문제를 해결하는 방법을 알고 있었기 때문에 해결할 수 있었습니다.

최근에도 비슷한 일이 있었습니다. Daft 사용자를 위한 가이드를 만들고 있었는데 몇 가지 매우 구체적인 문제에 직면했습니다. cloudpickle이 Google Colab에서 Pydantic과 작동하지 않는 문제, 그리고 Python과 약간의 Rust와 관련된 별도의 문제에서 JupyterLab에서 제대로 출력되지 않지만 터미널에서는 잘 작동하는 문제가 있었습니다. 저는 전에 Rust를 사용해 본 적이 없습니다.

그냥 issue를 만들고 다른 엔지니어들이 처리하도록 할 수 있었습니다. 하지만 생각했습니다. 코드베이스를 파보자. Claude Code가 초기 해결책을 내놓았지만 그렇게 좋지 않았습니다. 그래서 속도를 늦췄습니다. 동료는 그 부분을 비활성화하자고 제안했지만 저는 퇴보를 원하지 않았습니다. 더 나은 해결책을 찾을 수 있을까요?

그 후 협력적이고 반복적인 과정이 이어졌습니다. Claude Code는 잠재적인 근본 원인과 해결책을 제안했습니다. 저는 그것들을 실험했습니다. 어떤 것들은 막다른 골목으로 밝혀졌으므로 다른 방향으로 갔습니다. 전체 과정에서 저는 속도를 조절했습니다. 때로는 더 빨리 갔습니다. 예를 들어 다른 솔루션 공간이나 코드베이스의 다른 부분을 탐색할 때입니다. 때로는 더 느리게 갔습니다. "이 줄이 정확히 무엇을 의미하나요?"라고 물었습니다. 추상화 수준을 제어하고 속도를 제어했습니다.

결국 상당히 우아한 해결책을 찾았습니다. 교훈: 미지의 세계에서도 Claude Code와 함께 생각보다 훨씬 더 많은 것을 할 수 있습니다.

## Tip 36: Running bash commands and subagents in the background

Claude Code에서 오래 실행되는 bash 명령이 있는 경우 Ctrl+B를 눌러 백그라운드에서 실행되도록 이동할 수 있습니다. Claude Code는 백그라운드 프로세스를 관리하는 방법을 알고 있습니다. 나중에 BashOutput 도구를 사용하여 확인할 수 있습니다.

이것은 명령이 예상보다 오래 걸린다는 것을 알게 되고 그 동안 Claude가 다른 것을 하기를 원할 때 유용합니다. 그런 다음 Tip 17에서 언급한 exponential backoff 방법을 사용하여 진행 상황을 확인하거나 프로세스가 실행되는 동안 완전히 다른 것을 작업하도록 할 수 있습니다.

Claude Code는 또한 백그라운드에서 subagent를 실행할 수 있는 기능이 있습니다. 오래 실행되는 연구를 하거나 agent가 주기적으로 무언가를 확인해야 하는 경우 포그라운드에서 계속 실행할 필요가 없습니다. Claude Code에게 백그라운드에서 agent나 작업을 실행하도록 요청하기만 하면 다른 작업을 하는 동안 처리합니다.

### 전략적으로 subagent 사용하기

단지 백그라운드에서 실행하는 것 외에도 큰 작업을 분해해야 할 때 subagent가 유용합니다. 예를 들어, 분석해야 할 거대한 코드베이스가 있는 경우 subagent가 다른 방식으로 분석하거나 코드베이스의 다른 부분을 병렬로 볼 수 있습니다. Claude에게 여러 subagent를 생성하여 다른 조각을 처리하도록 요청하기만 하면 됩니다.

단순히 요청하여 subagent를 사용자 정의할 수 있습니다:
- **몇 개** - 원하는 수를 생성하도록 Claude에 요청
- **백그라운드 대 포그라운드** - 백그라운드에서 실행하도록 요청하거나 Ctrl+B를 누름
- **어떤 모델** - 각 작업의 복잡성에 따라 Opus, Sonnet 또는 Haiku를 요청(subagent는 기본적으로 Sonnet)

## Tip 37: The era of personalized software is here

개인화된 맞춤 소프트웨어의 시대가 도래하고 있습니다. AI가 나오면서 - 일반적으로 ChatGPT, 특히 Claude Code - 저는 훨씬 더 많은 소프트웨어를 만들 수 있다는 것을 알게 되었습니다. 때로는 나만을 위해, 때로는 작은 프로젝트를 위해.

이 문서의 앞부분에서 언급했듯이, 저는 매일 Claude Code와 대화하는 데 사용하는 사용자 정의 전사 도구를 만들었습니다. Claude Code 자체를 사용자 정의하는 방법을 만들었습니다. 또한 Python을 사용하여 데이터 시각화 및 데이터 분석 작업을 많이 수행했습니다.

또 다른 예: 거의 1,000개의 별을 가진 인기 있는 Slack MCP인 [korotovsky/slack-mcp-server](https://github.com/korotovsky/slack-mcp-server)는 Docker 컨테이너로 실행되도록 설계되었습니다. 저는 자체 Docker 컨테이너(Docker-in-Docker 복잡성) 내에서 원활하게 사용하는 데 문제가 있었습니다. 해당 설정과 싸우는 대신 Claude Code에 Slack의 Node SDK를 직접 사용하여 CLI를 작성하도록 요청했습니다. 정말 잘 작동했습니다.

이것은 흥미로운 시대입니다. 완료하고 싶은 것이 무엇이든 Claude Code에 요청할 수 있습니다. 충분히 작으면 1~2시간 안에 만들 수 있습니다. 저는 [슬라이드 덱 템플릿](https://ykdojo.github.io/claude-code-tips/content/spectrum-slides.html)도 만들었습니다. CSS와 JavaScript가 있는 단일 HTML 파일로 대화형 지속 터미널 프로세스를 포함할 수 있습니다.

## Tip 38: Navigating and editing your input box

Claude Code의 입력 상자는 일반적인 terminal/readline 단축키를 에뮬레이션하도록 설계되어 터미널에서 작업하는 데 익숙한 경우 자연스럽게 느껴집니다. 유용한 단축키는 다음과 같습니다:

**탐색:**
- `Ctrl+A` - 줄의 시작으로 이동
- `Ctrl+E` - 줄의 끝으로 이동
- `Option+Left/Right` (Mac) 또는 `Alt+Left/Right` - 단어별로 뒤로/앞으로 이동

**편집:**
- `Ctrl+W` - 이전 단어 삭제
- `Ctrl+U` - 커서에서 줄의 시작까지 삭제
- `Ctrl+K` - 커서에서 줄의 끝까지 삭제
- `Ctrl+C` / `Ctrl+L` - 현재 입력 지우기
- `Ctrl+G` - 외부 에디터에서 프롬프트 열기(긴 텍스트를 붙여넣는 데 유용하며, 터미널에 직접 붙여넣는 것이 느릴 수 있음)

bash, zsh 또는 기타 쉘에 익숙하다면 바로 편안함을 느낄 것입니다.

`Ctrl+G`의 경우 에디터는 `EDITOR` 환경 변수에 따라 결정됩니다. 셸 설정(`~/.zshrc` 또는 `~/.bashrc`)에서 설정할 수 있습니다:

```bash
export EDITOR=vim      # 또는 nano, code, nvim 등
```

또는 `~/.claude/settings.json`에서 (재시작 필요):

```json
{
  "env": {
    "EDITOR": "vim"
  }
}
```

**개행 입력(다중 줄 입력):**

어디서나 설정 없이 작동하는 가장 빠른 방법: `\`를 입력한 다음 Enter를 눌러 개행을 만듭니다. 키보드 단축키의 경우 Claude Code에서 `/terminal-setup`을 실행하세요. Mac Terminal.app에서는 Option+Enter를 사용합니다.

**이미지 붙여넣기:**
- `Ctrl+V` (Mac/Linux) 또는 `Alt+V` (Windows) - 클립보드에서 이미지 붙여넣기

참고: Mac에서는 `Cmd+V`가 아니라 `Ctrl+V`입니다.

## Tip 39: Spend some time planning, but also prototype quickly

Claude Code가 무엇을 만들고 어떻게 만들지 알 수 있도록 충분한 시간을 계획하는 것이 좋습니다. 이것은 초기에 높은 수준의 결정을 내리는 것을 의미합니다: 어떤 기술을 사용할지, 프로젝트를 어떻게 구조화할지, 각 기능이 어디에 있어야 하는지, 파일에 무엇을 넣을지. 가능한 한 빨리 좋은 결정을 내리는 것이 중요합니다.

때로는 프로토타이핑이 그것에 도움이 됩니다. 간단한 프로토타입을 빠르게 만들기만 하면 "좋아, 이 기술은 이 특정 목적에 작동한다" 또는 "다른 기술이 더 잘 작동한다"고 말할 수 있습니다.

예를 들어, 저는 최근 diff 뷰어를 만드는 것을 실험하고 있었습니다. 먼저 tmux와 lazygit으로 간단한 bash 프로토타입을 시도한 다음 Ink와 Node로 나만의 git 뷰어를 만들려고 시도했습니다. 다양한 것들에 많은 문제가 있었고 결국 이러한 결과 중 어떤 것도 게시하지 않았습니다. 하지만 이 프로젝트를 통해 상기시켜준 것은 계획과 프로토타이핑의 중요성입니다. 코드를 작성하기 전에 처음에 조금 더 잘 계획하기만 하면 더 잘 안내할 수 있다는 것을 알게 되었습니다. 코딩 과정 전체에 걸쳐 여전히 안내해야 하지만 먼저 조금 계획하게 하는 것이 정말 도움이 됩니다.

이를 위해 plan mode를 사용할 수 있습니다. Shift+Tab을 눌러 전환합니다. 또는 Claude Code에 코드를 작성하기 전에 계획을 세우도록 요청할 수 있습니다.

## Tip 40: Simplify overcomplicated code

Claude Code가 때로는 것들을 너무 복잡하게 만들고 너무 많은 코드를 작성한다는 것을 알게 되었습니다. 요청하지 않은 변경을 만듭니다. 단순히 더 많은 코드를 작성하는 편향이 있는 것 같습니다. 이 가이드의 다른 팁을 따랐다면 코드가 올바르게 작동할 수 있지만 유지 관리하고 확인하기 어려울 것입니다. 충분히 검토하지 않으면 악몽이 될 수 있습니다.

따라서 때로는 코드를 확인하고 단순화하도록 요청하고 싶을 때가 있습니다. 직접 수정할 수도 있지만 단순화하도록 요청할 수도 있습니다. "왜 이 특정 변경을 했나요?" 또는 "왜 이 줄을 추가했나요?"와 같은 질문을 할 수 있습니다.

어떤 사람들은 AI를 통해서만 코드를 작성하면 이해하지 못할 것이라고 합니다. 하지만 충분히 질문하지 않는 경우에만 해당됩니다. 모든 단일 것을 이해하도록 하면 실제로 다른 경우보다 더 빨리 코드를 이해할 수 있습니다. 특히 큰 프로젝트에서 작업할 때 물어볼 수 있기 때문입니다.

이것은 산문에도 적용됩니다. Claude Code는 종종 마지막 단락에서 이전 단락을 요약하거나 마지막 문장에서 이전 문장을 요약하려고 시도합니다. 상당히 반복적일 수 있습니다. 때로는 도움이 되지만 대부분의 경우 제거하거나 단순화하도록 요청해야 합니다.

## Tip 41: Automation of automation

하루 종일 결국 automation of automation에 관한 것입니다. 제 의미는 더 생산적일 뿐만 아니라 과정을 더 재미있게 만드는 최고의 방법이라는 것을 알게 되었습니다. 적어도 저에게는 전체 automation of automation 과정이 정말 재미있습니다.

저는 개인적으로 ChatGPT로 시작하여 ChatGPT가 터미널에서 준 복사-붙여넣기 및 명령 실행 프로세스를 자동화하고 싶었습니다. [Kaguya](https://github.com/ykdojo/kaguya)라는 ChatGPT 플러그인을 만들어 전체 프로세스를 자동화했습니다. 그 이후로 계속 더 많은 자동화를 향해 노력했습니다.

요행스럽게도 요즘은 그런 도구를 만들 필요조차 없습니다. Claude Code와 같은 도구가 있고 정말 잘 작동하기 때문입니다. 그리고 더 많이 사용할수록 생각했습니다. 타이핑 프로세스를 자동화할 수 있다면 어떨까? 그래서 앞서 언급했듯이 Claude Code 자체를 사용하여 음성 전사 앱을 만들었습니다.

그런 다음 생각하기 시작했습니다. 때로는 스스로 반복하는 경우가 있습니다. 그래서 그것들을 CLAUDE.md에 넣을 것입니다. 그런 다음 생각할 것입니다. 좋아, 때로는 같은 명령을 반복해서 실행합니다. 어떻게 자동화할 수 있을까요? Claude Code에 요청할 수 있습니다. 또는 skills에 넣을 수 있습니다. 또는 스크립트를 만들어 동일한 프로세스를 반복해서 반복하지 않도록 할 수도 있습니다.

궁극적으로 우리가 가고 있는 곳이라고 생각합니다. 동일한 작업이나 동일한 명령을 반복해서 반복할 때마다 몇 번은 괜찮지만 계속 반복하면 전체 프로세스를 자동화할 방법을 생각하세요.

## Tip 42: Share your knowledge and contribute where you can

이 팁은 다른 팁들과 조금 다릅니다. 최대한 많이 배움으로써 주변 사람들과 지식을 공유할 수 있다는 것을 알게 되었습니다. 이런 종류의 게시물을 통해, 아마도 책이나 강좌, 비디오를 통해. 최근에 [Daft의 동료들을 위한 내부 세션](https://www.daft.ai/blog/how-we-use-ai-coding-agents)도 있었습니다. 정말 보람이 있었습니다.

그리고 팁을 공유할 때마다 종종 정보를 되돌려 받습니다. 예를 들어, 시스템 프롬프트와 도구 설명을 줄이는 요령(Tip 15)을 공유했을 때 일부 사람들에게 대안으로 사용할 수 있는 `--system-prompt` 플래그에 대해 알려주었습니다. 또 다른 때, slash commands와 skills의 차이(Tip 25)에 대해 공유했을 때 Reddit 게시물의 댓글에서 새로운 것들을 배웠습니다.

따라서 지식 공유는 브랜드를 확립하거나 학습을 강화하는 것만이 아닙니다. 그 과정을 통해 새로운 것들을 배우는 것도 포함됩니다. 항상 일방 통행이 아닙니다.

기여와 관련하여 저는 Claude Code 저장소에 issue를 보내고 있습니다. 그들이 들어주면 좋다고 생각했습니다. 그렇지 않아도 완전히 괜찮습니다. 어떤 기대도하지 않았습니다. 하지만 버전 2.0.67에서 그들이 내가 만든 보고서에서 여러 제안을 채택한 것을 발견했습니다:

- `/permissions`에서 권한 규칙을 삭제한 후 스크롤 위치 재설정 수정
- `/permissions` 명령에 검색 기능 추가

팀이 기능 요청과 버그 보고에 얼마나 빨리 반응할 수 있는지는 정말 놀랍습니다. 하지만 Claude Code를 사용하여 Claude Code 자체를 구축하고 있기 때문에 당연합니다.

## Tip 43: Keep learning!

Claude Code에 대해 계속 배우는 몇 가지 효과적인 방법이 있습니다:

**Claude Code 자체에게 질문하기** - Claude Code에 대한 질문이 있으면 그냥 물어보세요. Claude Code에는 자체 기능, slash commands, 설정, hooks, MCP 서버 등에 대한 질문에 답하는 전문 subagent가 있습니다.

**릴리스 노트 확인** - `/release-notes`를 입력하여 현재 버전의 새로운 기능을 확인하세요. 이것은 최신 기능을 배우는 가장 좋은 방법입니다.

**커뮤니티에서 배우기** - [r/ClaudeAI](https://www.reddit.com/r/ClaudeAI/) 서브레딧은 다른 사용자로부터 배우고 사람들이 사용하는 워크플로우를 보는 훌륭한 장소입니다.

**Ado의 팁 팔로우** - Ado([@adocomplete](https://x.com/adocomplete))는 Anthropic의 DevRel로 2025년 12월 내내 "Advent of Claude" 시리즈에서 매일 Claude Code 팁을 게시했습니다. 이 특정 시리즈는 이미 끝났지만 그는 X에서 계속 유용한 팁을 공유합니다.

- [Twitter/X: Advent of Claude 게시물](https://x.com/search?q=from%3Aadocomplete%20advent%20of%20claude&src=typed_query&f=live)
- [LinkedIn: Advent of Claude 게시물](https://www.linkedin.com/search/results/content/?fromMember=%5B%22ACoAAAFdD3IBYHwKSh6FsyGqOh1SpbrZ9ZHTjnI%22%5D&keywords=advent%20of%20claude&origin=FACETED_SEARCH&sid=zDV&sortBy=%22date_posted%22)

## Tip 44: Install the dx plugin

이 저장소는 `dx`(developer experience)라는 Claude Code 플러그인이기도 합니다. 위 팁의 여러 도구를 단일 설치로 번들로 묶습니다:

| Skill | 설명 |
|-------|-------------|
| `/dx:gha <url>` | GitHub Actions 실패 분석 (Tip 29) |
| `/dx:handoff` | 컨텍스트 연속성을 위한 handoff 문서 생성 (Tip 8) |
| `/dx:clone` | 분기하기 위해 대화 복제 (Tip 23) |
| `/dx:half-clone` | 컨텍스트를 줄이기 위한 half-clone (Tip 23) |
| `/dx:reddit-fetch` | Gemini CLI를 통해 Reddit 콘텐츠 가져오기 (Tip 11) |
| `/dx:review-claudemd` | CLAUDE.md 파일을 개선하기 위해 대화 검토 (Tip 30) |

**두 개의 명령어로 설치:**

```bash
claude plugin marketplace add ykdojo/claude-code-tips
claude plugin install dx@ykdojo
```

설치 후 명령은 `/dx:clone`, `/dx:half-clone`, `/dx:handoff`, `/dx:gha`로 사용할 수 있습니다. `reddit-fetch` skill은 Reddit URL에 대해 물어볠 때 자동으로 호출됩니다. `review-claudemd` skill은 최근 대화를 분석하고 CLAUDE.md 파일에 대한 개선을 제안합니다. 복제 명령의 경우 [권장되는 권한](#복제-스크립트에-권장되는-권한)을 참조하세요.

**권장 동반:** [Playwright MCP](https://github.com/microsoft/playwright-mcp) 브라우저 자동화용 - `claude mcp add -s user playwright npx @playwright/mcp@latest`로 추가

## Tip 45: Quick setup script

이 저장소의 여러 권장 사항을 한 번에 설정하려면 많은 것을 처리하는 설정 스크립트가 있습니다:

```bash
bash <(curl -s https://raw.githubusercontent.com/ykdojo/claude-code-tips/main/scripts/setup.sh)
```

스크립트는 구성할 모든 것을 보여주고 항목을 건너뛸 수 있습니다:

```
INSTALLS:
  1. DX plugin - slash commands (/dx:gha, /dx:clone, /dx:handoff) 및 skills (reddit-fetch)
  2. cc-safe - 'rm -rf' 또는 'sudo'와 같은 위험한 승인 명령에 대한 설정 스캔

SETTINGS (~/.claude/settings.json):
  3. Status line - 화면 하단에 모델, git 브랜치, 커밋되지 않은 파일, 토큰 사용량 표시
  4. Disable auto-updates - Claude Code가 자동 업데이트하는 것을 방지(시스템 프롬프트 패치에 유용)
  5. Lazy-load MCP tools - MCP 도구 정의를 필요할 때만 로드, 컨텍스트 절약
  6. Read(~/.claude) permission - 복제/half-clone 명령이 대화 기록을 읽을 수 있음
  7. Read(//tmp/**) permission - 프롬프트 없이 임시 파일 읽기 허용
  8. Disable attribution - 커밋에서 Co-Authored-By 제거 및 PR에서 attribution 제거

SHELL CONFIG (~/.zshrc 또는 ~/.bashrc):
  9. Aliases: c=claude, ch=claude --chrome, cs=claude --dangerously-skip-permissions
 10. Fork shortcut: --fs가 --fork-session으로 확장(예: claude -c --fs)

Skip any? [e.g., 1 4 7 or Enter for all]:
```

---

📺 **관련 강의**: [Claude Code Masterclass](https://youtu.be/9UdZhTnMrTA) - 31개월의 agentic 코딩에서의 교훈과 프로젝트 예시

📝 **이야기**: [How I got a full-time job with Claude Code](../content/how-i-got-a-job-with-claude-code.md)

📰 **뉴스레터**: [Agentic Coding with Discipline and Skill](https://agenticcoding.substack.com/) - agentic 코딩의 실천을 다음 단계로 가져오기

# 한국어 번역 구현 계획

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** CLAUDE.md, GLOBAL-CLAUDE.md, README.md를 한국어로 번역하여 ko/ 디렉토리에 저장

**Architecture:** 각 파일을 순차적으로 번역, 원본 Markdown 구조와 코드 블록을 보존하면서 한국어 콘텐츠로 변환

**Tech Stack:** Markdown, 파일 I/O

---

### Task 1: ko/CLAUDE.md 번역

**Files:**
- Create: `ko/CLAUDE.md`
- Reference: `CLAUDE.md`

**Step 1: ko/CLAUDE.md 생성**

```markdown
# 프로젝트 지침
- 작성 스타일: 사용자의 어조 유지, 대화체, 사용자가 말한 내용에 충실하되 작은 문법 오류 수정
- Tip을 추가하거나 이름을 변경한 후 `node scripts/generate-toc.js`를 실행하여 목차 갱신
- `~/.claude/CLAUDE.md`는 이 저장소의 `GLOBAL-CLAUDE.md`에 대한 심볼릭 링크
- 플러그인 변경사항(skills, plugin.json 등)을 커밋할 때는 `.claude-plugin/plugin.json`과 `.claude-plugin/marketplace.json`의 패치 버전을 bump. 시스템 프롬프트 패치 등 비플러그인 변경에는 bump하지 않음
- Git 태그/릴리스(예: `v0.25.1`)와 플러그인 버전(예: `0.14.9`)은 별개. Git 태그는 저장소 릴리스 진행을 따르고, 플러그인 버전은 `plugin.json`과 `marketplace.json`에만 존재
```

**Step 2: 파일 생성 확인**

Run: `cat ko/CLAUDE.md`
Expected: 한국어 번역 내용 출력

**Step 3: Commit**

```bash
git add ko/CLAUDE.md
git commit -m "feat: 한국어 번역 CLAUDE.md 추가"
```

---

### Task 2: ko/GLOBAL-CLAUDE.md 번역

**Files:**
- Create: `ko/GLOBAL-CLAUDE.md`
- Reference: `GLOBAL-CLAUDE.md`

**Step 1: ko/GLOBAL-CLAUDE.md 생성**

`GLOBAL-CLAUDE.md`의 전체 내용을 한국어로 번역:

```markdown
# 작성 스타일

- 헤더에 문장 case 사용, title case 사용 금지
- em dash(—) 사용 금지. 대신 공백-하이픈-공백 ` - ` 사용
- 내가 말하지 않은 내용을 추가하거나 만들지 말 것. 말한 내용에 충실할 것. 재구성은 OK지만 과장하지 말 것.

# 나 정보

- 이름: YK
- GitHub: ykdojo
- 현재 연도: 2026 (최근 3개월 집중)

# 동작 방식

큰 내용을 지시 없이 붙여넣으면 요약만 한다.

복잡한 bash 명령어의 경우, 개별 승인이 필요 없도록 여러 개의 간단한 명령어로 분해한다. 또는 `bash /tmp/<script>.sh`로 실행하는 bash 스크립트 파일에 넣는다.

예시 - 대신에:
```bash
sleep 60 && ps aux | grep foo | wc -l && echo "---" && ls -la /some/path
```

이렇게 하세요:
```bash
sleep 60
```
```bash
ps aux | grep foo | wc -l
```
```bash
ls -la /some/path
```

또한 복잡한 파이프라인을 피하세요. 대신:
```bash
grep "file: '" patch-cli.js | sed "s/.*file: '\([^']*\)'.*/\1/" | sort > /tmp/used.txt
```

각 단계를 개별 실행하거나 스크립트 파일에 넣고 `bash /tmp/script.sh`로 실행하세요.

다른 디렉토리의 git 작업은 `git -C <path>` 대신 `cd <path> && git ...`를 사용하세요.

bash 명령에서는 절대 `2>&1`을 사용하지 말 것. stderr과 stdout을 분리 유지하세요.

# 안전성

**호스트 머신에서는 절대 `--dangerously-skip-permissions`를 사용하지 말 것.**

위험한 작업은 Docker 컨테이너 사용. 컨테이너 내부에서는 YOLO 모드와 `--dangerously-skip-permissions`는 OK.

`npx cc-safe <directory>`를 실행하여 Claude Code 설정의 보안 이슈를 스캔하세요.

## 컨테이너

[safeclaw](https://github.com/ykdojo/safeclaw) 컨테이너 사용 (local: `/Users/yk/Desktop/projects/safeclaw`). 컨테이너 이름은 `safeclaw-<session-name>` (예: `safeclaw-work`, `safeclaw-research`).

실행 중인 safeclaw 컨테이너 목록: `docker ps --filter "name=safeclaw-"`

새 컨테이너 생성: `cd /Users/yk/Desktop/projects/safeclaw && ./scripts/run.sh -s <name> -n`

공용 repo의 읽기 전용 `gh` API 호출의 경우, 실행 중인 safeclaw 컨테이너 사용: `docker exec safeclaw-<name> bash -c 'gh api <endpoint>'`. 컨테이너 `gh`에 권한이 없으면 호스트 `gh`로 대체.

## URL 가져오기

URL은 safeclaw 컨테이너를 통해 가져오기:
`docker exec safeclaw-<name> curl -sL <url>`

페이지가 JavaScript-heavy하면(curl이 최소 또는 빈 내용을 반환하면) Playwright 사용 (safeclaw 컨테이너에는 Playwright가 설치되어 있음).

## Tmux

대화형 Claude Code 세션의 경우:

```bash
tmux new-session -d -s <name> '<command>'
tmux send-keys -t <name> '<input>' Enter  # Enter를 잊지 말 것!
tmux capture-pane -t <name> -p
```

참고: Claude Code 세션의 경우 프롬프트 제출을 확인하기 위해 짧은 지연 후 다시 Enter를 보내야 할 수 있음.

## 장기 실행 작업

장기 실행 작업을 기다려야 하는 경우 수동 지수 백오프로 sleep 명령 사용: 1분 대기, 그 다음 2분, 그 다음 4분 등.

# Claude for Chrome

- `read_page`로 접근성 트리에서 element refs 가져오기
- `find`로 description으로 element 찾기
- 클릭/상호작용은 `ref`로, 좌표로 하지 말 것
- 명시적으로 요청하지 않는 한 절대 스크린샷 찍지 말 것
```

**Step 2: 파일 생성 확인**

Run: `wc -l ko/GLOBAL-CLAUDE.md`
Expected: 원본과 유사한 줄 수 (약 90줄)

**Step 3: Commit**

```bash
git add ko/GLOBAL-CLAUDE.md
git commit -m "feat: 한국어 번역 GLOBAL-CLAUDE.md 추가"
```

---

### Task 3: ko/README.md 번역 (Part 1 - 헤더 섹션)

**Files:**
- Create: `ko/README.md`
- Reference: `README.md`

**Step 1: README.md 구조 파악**

Run: `head -100 README.md | grep '^##'`
Expected: 주요 섹션 헤더 목록

**Step 2: ko/README.md 헤더 섹션 번역**

README.md 상단부터 Table of Code까지 번역:

```markdown
# Claude Code 45가지 팁: 기초부터 고급까지

Claude Code를 최대한 활용하기 위한 팁입니다. 커스텀 status line 스크립트, 시스템 프롬프트 절반으로 줄이기, Gemini CLI를 Claude Code의 minion으로 사용하기, 컨테이너에서 Claude Code 자체 실행하기 등. 또한 [dx plugin](#tip-44-install-the-dx-plugin) 포함.

📺 [빠른 데모](https://www.youtube.com/watch?v=hiISl558JGE) - 다중 Claude 워크플로우와 음성 입력으로 일부 팁 시연:

[![데모 비디오 썸네일](../assets/demo-thumbnail.png)](https://www.youtube.com/watch?v=hiISl558JGE)

<!-- TOC -->
## 목차

- [Tip 0: status line 커스터마이징](#tip-0-customize-your-status-line)
- [Tip 1: 필수 slash commands 몇 가지 배우기](#tip-1-learn-a-few-essential-slash-commands)
...
```

**Step 3: Commit**

```bash
git add ko/README.md
git commit -m "feat: 한국어 번역 README.md 헤더 섹션 추가"
```

---

### Task 4: ko/README.md 번역 (Part 2 - Tips 1-15)

**Step 1: Tip 0-15 번역**

각 Tip 섹션을 한국어로 번역. 예시:

```markdown
## Tip 0: Customize your status line

[영어 내용을 한국어로 번역]
```

**Step 2: 커밋**

```bash
git add ko/README.md
git commit -m "feat: 한국어 번역 README.md Tips 0-15 추가"
```

---

### Task 5: ko/README.md 번역 (Part 3 - Tips 16-30)

**Step 1: Tip 16-30 번역**

동일한 방식으로 번역

**Step 2: 커밋**

```bash
git add ko/README.md
git commit -m "feat: 한국어 번역 README.md Tips 16-30 추가"
```

---

### Task 6: ko/README.md 번역 (Part 4 - Tips 31-45)

**Step 1: Tip 31-45 번역**

동일한 방식으로 번역

**Step 2: 커밋**

```bash
git add ko/README.md
git commit -m "feat: 한국어 번역 README.md Tips 31-45 추가"
```

---

### Task 7: TOC 갱신

**Files:**
- Run: `scripts/generate-toc.js`

**Step 1: TOC 스크립트 실행**

```bash
node scripts/generate-toc.js
```

**Step 2: ko/README.md에 한국어 TOC 추가**

스크립트가 원본 README.md의 TOC를 갱신하면, ko/README.md에도 한국어 목차를 추가

**Step 3: 최종 커밋**

```bash
git add ko/README.md
git commit -m "feat: 한국어 번역 README.md 완료 및 TOC 갱신"
```

---

### Task 8: 검증 및 README 링크 추가

**Step 1: 번역 검증**

```bash
# Markdown 렌더링 테스트
head -50 ko/CLAUDE.md
head -50 ko/GLOBAL-CLAUDE.md
head -100 ko/README.md
```

**Step 2: 원본 README.md에 언어 링크 추가 (선택사항)**

`README.md` 상단에:

```markdown
[English](README.md) | [한국어](ko/README.md)
```

**Step 3: 최종 커밋**

```bash
git add README.md
git commit -m "feat: README.md에 한국어 링크 추가"
```

# 작성 스타일

- 헤더는 문장 형식으로 작성 (영어의 sentence case와 유사한 원칙)
- em dash 사용 금지. 대신 공백-하이픈-공백 ` - ` 사용. 예: `이것 - 저것`
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

페이지가 JavaScript가 많이 사용된 경우(curl이 최소 또는 빈 내용을 반환하면) Playwright 사용 (safeclaw 컨테이너에는 Playwright가 설치되어 있음).

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

- `` `read_page` ``로 접근성 트리에서 element refs 가져오기
- `` `find` ``로 description으로 element 찾기
- 클릭/상호작용은 `` `ref` ``로, 좌표로 하지 말 것
- 명시적으로 요청하지 않는 한 절대 스크린샷 찍지 말 것

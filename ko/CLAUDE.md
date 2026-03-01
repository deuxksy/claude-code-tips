# 프로젝트 지침
- 작성 시: 사용자의 어조 유지, 대화체, 사용자가 말한 내용에 충실하되 작은 문법 오류 수정
- tip을 추가하거나 이름을 변경한 후 `node scripts/generate-toc.js`를 실행하여 목차 갱신
- `~/.claude/CLAUDE.md`는 이 저장소의 `GLOBAL-CLAUDE.md`에 대한 symlink
- 플러그인 변경사항(skills, plugin.json 등)을 커밋할 때는 `.claude-plugin/plugin.json`과 `.claude-plugin/marketplace.json`의 패치 버전을 bump하기. 시스템 프롬프트 패치 등 플러그인 외 변경사항에는 bump하지 않음
- Git 태그/릴리스(예: `v0.25.1`)와 플러그인 버전(예: `0.14.9`)은 별개. Git 태그는 저장소 릴리스 진행을 따르고, 플러그인 버전은 `plugin.json`과 `marketplace.json`에만 존재

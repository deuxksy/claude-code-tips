# 한국어 번역 설계 문서

## 개요

CLAUDE Code Tips 프로젝트의 핵심 문서들을 한국어로 번역하여 한국어 사용자의 접근성을 향상시킵니다.

## 대상 파일

| 원본 | 번역본 |
|------|--------|
| `CLAUDE.md` | `ko/CLAUDE.md` |
| `GLOBAL-CLAUDE.md` | `ko/GLOBAL-CLAUDE.md` |
| `README.md` | `ko/README.md` |

## 번역 원칙

### 1. 언어 스타일
- 간결하고(Concise), 전문적이며(Professional), 드라이(Dry)한 어조
- 과도한 공감이나 미사여구 생략
- 명확성을 위한 기술 용어 영어 병기 또는 유지

### 2. 기술 용어 처리
- 중요한 기술 용어는 영어 유지
- 예: `slash commands`, `system prompt`, `worktree`, `container`
- 필요시 한국어 설명 병기: "슬래시 명령어(slash commands)"

### 3. 코드 블록
- 코드 내 주석도 한국어로 번역
- 명령어, 경로, 코드 자체는 수정하지 않음

### 4. Markdown 구조 보존
- 헤더 레벨, 리스트, 테이블, 링크 등 원본 구조 유지
- 코드 블록 fencing (```) 보존

## 번역 순서

1. **ko/CLAUDE.md** - 프로젝트 지침 (7줄, 간단)
2. **ko/GLOBAL-CLAUDE.md** - 전역 설정 (92줄, 중간)
3. **ko/README.md** - 메인 문서 (45개 Tips, 대형)

## 파일 구조

```
ClaudeCode/
├── CLAUDE.md              # 원본 (영어)
├── GLOBAL-CLAUDE.md       # 원본 (영어)
├── README.md              # 원본 (영어)
└── ko/                    # 한국어 번역
    ├── CLAUDE.md
    ├── GLOBAL-CLAUDE.md
    └── README.md
```

## 검증 항목

- [ ] Markdown 렌더링 정상 동작
- [ ] 코드 블록 구조 유지
- [ ] 링크가 올바르게 작동
- [ ] 용어 일관성 유지

## 배포 고려사항

번역 완료 후 README.md 상단에 한국어 링크 추가 가능:

```markdown
[English](README.md) | [한국어](ko/README.md)
```

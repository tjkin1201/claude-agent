# Claude Code + GitHub 통합 활용 가이드

## 🎯 연동 방식별 활용 시나리오

### 1. 로컬 전용 사용 (GitHub 연동 없음)
**적합한 경우:**
- 개인 프로젝트 개발
- 로컬 스크립트 작성
- 학습 및 실험
- 민감한 코드 작업

```bash
# 로컬에서만 작업
claude --allowedTools "Read" "Write" "Edit" "/implement 새 기능"
```

### 2. Git 로컬 연동 (원격 저장소 수동 관리)
**적합한 경우:**
- 개인 개발 워크플로우
- 선택적 커밋/푸시
- 코드 리뷰 전 검증

```bash
# Git 명령어만 자동화
claude --allowedTools "Bash(git add)" "Bash(git commit)" \
  "/implement 기능 && /commit"

# 수동으로 푸시
git push origin main
```

### 3. GitHub 완전 통합 (CI/CD 포함)
**적합한 경우:**
- 팀 협업 프로젝트
- 자동화된 배포
- 코드 품질 관리
- PR 자동 처리

## 🚀 GitHub Actions와 Claude Code 통합

### 기본 설정 (.github/workflows/claude-automation.yml)
```yaml
name: Claude Code Automation

on:
  pull_request:
    types: [opened, synchronize]
  push:
    branches: [main]
  workflow_dispatch:
    inputs:
      task:
        description: 'Claude task to execute'
        required: true
        default: '/analyze'

jobs:
  claude-review:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup Claude Code
        run: |
          # Claude Code CLI 설치 (가정)
          npm install -g @anthropic/claude-code
          
      - name: Run Claude Analysis
        env:
          CLAUDE_API_KEY: ${{ secrets.CLAUDE_API_KEY }}
        run: |
          claude \
            --allowedTools "Read" \
            --allowedTools "Write(reports/**)" \
            --persona-architect \
            "/analyze --focus quality" \
            > analysis-report.md
            
      - name: Post Review Comment
        if: github.event_name == 'pull_request'
        uses: actions/github-script@v6
        with:
          script: |
            const fs = require('fs');
            const report = fs.readFileSync('analysis-report.md', 'utf8');
            github.rest.issues.createComment({
              issue_number: context.issue.number,
              owner: context.repo.owner,
              repo: context.repo.repo,
              body: report
            });
```

## 💻 실제 활용 예제

### 예제 1: PR 자동 생성 및 리뷰
```bash
#!/bin/bash
# auto-pr.sh

# 1. 새 기능 구현
claude --allowedTools "Write" "Edit" "Bash(git *)" <<EOF
/create-branch "feature/auto-login"
/implement "자동 로그인 기능"
/test
/commit "feat: Add auto-login functionality"
EOF

# 2. PR 생성 (GitHub CLI 사용)
gh pr create \
  --title "자동 로그인 기능 추가" \
  --body "Claude Code로 구현된 자동 로그인 기능입니다." \
  --label "enhancement"

# 3. 자동 리뷰
claude --allowedTools "Read" "Bash(gh pr view)" \
  "/review-pr --current"
```

### 예제 2: Issue 기반 자동 개발
```bash
#!/bin/bash
# issue-to-code.sh

# GitHub Issue 읽기
ISSUE_BODY=$(gh issue view $1 --json body -q .body)

# Claude가 이슈 분석하고 구현
claude --dangerously-skip-permissions <<EOF
이슈 내용: $ISSUE_BODY

/analyze 이슈 요구사항
/implement 해결책
/test
/commit "fix: Resolve issue #$1"
EOF

# PR 생성 및 이슈 연결
gh pr create --title "Fix #$1" --body "Closes #$1"
```

### 예제 3: 일일 코드 품질 체크 (GitHub Actions)
```yaml
# .github/workflows/daily-quality.yml
name: Daily Code Quality Check

on:
  schedule:
    - cron: '0 9 * * *'  # 매일 오전 9시

jobs:
  quality-check:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Claude Quality Analysis
        run: |
          claude \
            --allowedTools "Read" \
            --allowedTools "Write(reports/**)" \
            --persona-refactorer \
            "/analyze --comprehensive" \
            > daily-report.md
            
      - name: Create Issue if Problems Found
        run: |
          if grep -q "WARNING\|ERROR" daily-report.md; then
            gh issue create \
              --title "코드 품질 이슈 발견 $(date +%Y-%m-%d)" \
              --body-file daily-report.md \
              --label "quality"
          fi
```

## 🔧 로컬 vs GitHub 연동 비교

| 기능 | 로컬 전용 | GitHub 연동 |
|------|----------|------------|
| **개인 작업** | ✅ 완벽 지원 | ✅ 완벽 지원 |
| **팀 협업** | ❌ 제한적 | ✅ 완벽 지원 |
| **자동 PR** | ❌ 불가능 | ✅ 가능 |
| **CI/CD** | ❌ 불가능 | ✅ 가능 |
| **이슈 추적** | ❌ 수동 | ✅ 자동 |
| **코드 리뷰** | ⚠️ 로컬만 | ✅ PR 댓글 |
| **배포 자동화** | ❌ 수동 | ✅ 자동 |
| **보안** | ✅ 높음 | ⚠️ API 키 관리 필요 |

## 🎯 추천 사용 패턴

### 1. 개인 개발자
```bash
# 로컬 작업 + 선택적 푸시
claude --allowedTools "Bash(git add .)" "Bash(git commit)" \
  "Write" "Edit" "/develop"
  
# 완료 후 수동 푸시
git push origin main
```

### 2. 스타트업 팀
```bash
# GitHub 통합 스크립트
./scripts/claude-develop.sh \
  --issue 123 \
  --auto-pr \
  --request-review @teammate
```

### 3. 엔터프라이즈
```yaml
# 완전 자동화 파이프라인
on:
  issues:
    types: [labeled]
    
jobs:
  auto-develop:
    if: contains(github.event.label.name, 'auto-develop')
    runs-on: self-hosted
    steps:
      - name: Claude Implementation
        run: |
          claude --dangerously-skip-permissions \
            --validate \
            "/implement-issue ${{ github.event.issue.number }}"
```

## 🔑 GitHub 설정 방법

### 1. GitHub CLI 설치
```bash
# Windows
winget install GitHub.cli

# Mac
brew install gh

# Linux
sudo apt install gh
```

### 2. 인증 설정
```bash
# GitHub 로그인
gh auth login

# 상태 확인
gh auth status
```

### 3. Claude + GitHub 별칭 설정
```bash
# ~/.bashrc 또는 ~/.zshrc에 추가
alias claude-gh="claude --allowedTools 'Bash(gh *)' 'Bash(git *)'"
alias claude-pr="claude-gh '/create-pr'"
alias claude-issue="claude-gh '/fix-issue'"
```

## 💡 베스트 프랙티스

### DO's ✅
- 로컬에서 먼저 테스트
- API 키는 환경 변수로 관리
- 단계적으로 자동화 확대
- 팀과 규칙 합의

### DON'Ts ❌
- main 브랜치 직접 푸시 자동화
- 리뷰 없는 자동 머지
- 민감한 정보 하드코딩
- 무제한 권한 부여

## 🚦 시작하기

### Step 1: 로컬 테스트
```bash
claude --allowedTools "Read" "Write" "/implement 테스트 기능"
```

### Step 2: Git 연동
```bash
claude --allowedTools "Bash(git *)" "/commit"
```

### Step 3: GitHub 통합
```bash
claude --allowedTools "Bash(gh *)" "/create-pr"
```

### Step 4: 자동화 확대
```yaml
# GitHub Actions에 추가
- uses: claude-code-action@v1
```

---

*GitHub 연동은 선택사항이지만, 팀 협업과 자동화를 원한다면 강력히 추천합니다!*
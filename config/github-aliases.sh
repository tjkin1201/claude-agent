#!/bin/bash
# Claude Code + GitHub 편의 별칭 설정
# ~/.bashrc 또는 ~/.zshrc에 추가할 수 있는 별칭들

# 기본 Claude + GitHub 조합
alias claude-gh='claude --allowedTools "Bash(gh *)" "Bash(git *)" "Read" "Write"'
alias claude-safe='claude --allowedTools "Read" "Bash(git status)" "Bash(gh issue list)"'
alias claude-dev='claude --allowedTools "Write" "Edit" "Read" "Bash(git *)" "Bash(npm test)"'
alias claude-auto='claude --dangerously-skip-permissions --uc'

# GitHub 작업 별칭
alias gh-issue-to-code='function _gh_issue() { gh issue view $1 --json title,body -q ".title,.body" | claude-gh "/implement issue #$1"; }; _gh_issue'
alias gh-auto-pr='git push && gh pr create --fill'
alias gh-review-pr='function _review() { gh pr diff ${1:-$(gh pr view --json number -q .number)} | claude-gh "/review"; }; _review'

# 프로젝트 상태 별칭
alias project-status='gh issue list --limit 5 && echo && gh pr list --limit 5 && echo && git status --short'
alias daily-standup='claude-safe "/report daily-standup"'

# 릴리스 별칭
alias auto-release='function _release() { 
    local last_tag=$(git describe --tags --abbrev=0 2>/dev/null || echo "v0.0.0")
    git log $last_tag..HEAD --pretty=format:"- %s" | claude-gh "/generate-release-notes" > RELEASE_NOTES.md
    echo "New version tag: "
    read new_tag
    git tag -a "$new_tag" -m "Release $new_tag"
    git push origin "$new_tag"
    gh release create "$new_tag" --notes-file RELEASE_NOTES.md
    rm RELEASE_NOTES.md
}; _release'

# 팀 워크플로우 별칭
alias team-review='function _team() {
    claude-gh "/analyze --team-review" 
    gh pr create --title "Team Review: $(date +%Y-%m-%d)" --draft
}; _team'

alias fix-issue='function _fix() {
    local issue=$1
    git checkout -b "fix-issue-$issue"
    gh issue view $issue --json title,body -q ".title,.body" | claude-dev "/fix issue #$issue"
    git add .
    git commit -m "fix: Resolve issue #$issue"
    gh pr create --title "Fix #$issue" --body "Closes #$issue"
}; _fix'

# 코드 품질 별칭
alias quality-check='claude-safe "/analyze --comprehensive" > quality-report.md && echo "Report saved to quality-report.md"'
alias security-audit='claude-safe "/analyze --focus security" > security-report.md'

# 문서화 별칭
alias update-docs='claude-gh "/document --update-all"'
alias api-docs='claude-gh "/document --api-docs"'

# CI/CD 별칭
alias check-ci='gh run list --limit 5'
alias restart-ci='gh run rerun --failed'

# 환경 설정 함수
setup_claude_github() {
    echo "🔧 Claude Code + GitHub 환경 설정"
    
    # GitHub CLI 인증 확인
    if ! gh auth status >/dev/null 2>&1; then
        echo "GitHub CLI 인증이 필요합니다."
        gh auth login
    fi
    
    # 디렉토리 생성
    mkdir -p ~/.claude/github
    mkdir -p reports
    mkdir -p .github/workflows
    
    # 기본 설정 파일 생성
    cat > ~/.claude/github/config <<EOF
# Claude Code + GitHub 통합 설정
DEFAULT_REVIEWER=@me
AUTO_MERGE=false
NOTIFICATION_WEBHOOK=
SLACK_CHANNEL=#dev
EOF
    
    echo "✅ 설정 완료!"
    echo ""
    echo "사용 가능한 별칭:"
    echo "  claude-gh          - GitHub 통합 Claude"
    echo "  gh-issue-to-code   - Issue를 코드로"
    echo "  gh-auto-pr         - 자동 PR 생성"
    echo "  gh-review-pr       - PR 리뷰"
    echo "  fix-issue          - Issue 수정"
    echo "  project-status     - 프로젝트 상태"
    echo "  quality-check      - 품질 검사"
    echo "  auto-release       - 자동 릴리스"
}

# 도움말 함수
claude_github_help() {
    echo "Claude Code + GitHub 통합 도움말"
    echo "=================================="
    echo ""
    echo "기본 워크플로우:"
    echo "1. 이슈 구현:     gh-issue-to-code 123"
    echo "2. PR 생성:       gh-auto-pr"
    echo "3. PR 리뷰:       gh-review-pr"
    echo "4. 릴리스:        auto-release"
    echo ""
    echo "일일 작업:"
    echo "- 상태 확인:      project-status"
    echo "- 품질 검사:      quality-check"
    echo "- 문서 업데이트:  update-docs"
    echo ""
    echo "응급 상황:"
    echo "- 핫픽스:         fix-issue 456"
    echo "- CI 재시작:      restart-ci"
    echo "- 보안 감사:      security-audit"
    echo ""
    echo "더 많은 정보: https://github.com/anthropic/claude-code"
}

# 별칭 등록 함수
alias claude-help='claude_github_help'
alias setup-github='setup_claude_github'

echo "🤖 Claude Code + GitHub 별칭이 로드되었습니다!"
echo "시작하려면 'setup-github'를 실행하고 'claude-help'로 도움말을 확인하세요."
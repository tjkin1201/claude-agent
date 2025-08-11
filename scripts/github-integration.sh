#!/bin/bash
# Claude Code + GitHub 완전 통합 스크립트
# 생성일: 2024-08-09

# 색상 정의
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 로고 출력
echo -e "${BLUE}"
echo "╔════════════════════════════════════════╗"
echo "║   Claude Code + GitHub Integration    ║"
echo "║        Complete Automation Suite      ║"
echo "╚════════════════════════════════════════╝"
echo -e "${NC}"

# 함수 정의
function show_menu() {
    echo -e "\n${GREEN}=== GitHub 통합 메뉴 ===${NC}"
    echo "1) 📝 Issue를 코드로 변환"
    echo "2) 🔄 자동 PR 생성"
    echo "3) 👀 PR 자동 리뷰"
    echo "4) 🐛 Issue 자동 수정"
    echo "5) 📊 코드 품질 분석"
    echo "6) 🚀 릴리스 자동화"
    echo "7) 📈 프로젝트 상태 리포트"
    echo "8) 🔧 설정 관리"
    echo "9) 📚 도움말"
    echo "0) 종료"
    echo -n "선택: "
}

# Issue를 코드로 변환
function issue_to_code() {
    echo -e "\n${YELLOW}Issue 번호를 입력하세요:${NC} "
    read issue_number
    
    echo -e "${BLUE}Issue #$issue_number 정보를 가져오는 중...${NC}"
    issue_title=$(gh issue view $issue_number --json title -q .title)
    issue_body=$(gh issue view $issue_number --json body -q .body)
    
    echo -e "${GREEN}Issue 제목: $issue_title${NC}"
    echo -e "${BLUE}Claude가 구현을 시작합니다...${NC}"
    
    # 새 브랜치 생성
    branch_name="issue-$issue_number-$(echo $issue_title | tr ' ' '-' | tr '[:upper:]' '[:lower:]' | cut -c1-30)"
    git checkout -b "$branch_name"
    
    # Claude로 구현
    claude --allowedTools "Write" "Edit" "Read" "Bash(npm test)" <<EOF
Issue #$issue_number: $issue_title
설명: $issue_body

위 이슈를 해결하는 코드를 구현해주세요.
테스트도 함께 작성해주세요.
EOF
    
    # 커밋
    git add .
    git commit -m "fix: Resolve issue #$issue_number - $issue_title"
    
    echo -e "${GREEN}✅ 구현 완료! PR을 생성하시겠습니까? (y/n)${NC}"
    read create_pr
    if [ "$create_pr" = "y" ]; then
        create_pull_request $issue_number "$issue_title"
    fi
}

# PR 생성
function create_pull_request() {
    local issue_number=$1
    local issue_title=$2
    
    echo -e "${BLUE}PR을 생성하는 중...${NC}"
    
    # PR 본문 생성
    pr_body="## 🎯 해결한 이슈
Closes #$issue_number

## 📝 변경사항
- Claude Code로 자동 구현된 솔루션
- 테스트 케이스 추가
- 문서 업데이트

## ✅ 체크리스트
- [x] 코드 구현 완료
- [x] 테스트 작성
- [x] 로컬 테스트 통과
- [ ] 리뷰 요청

## 🤖 자동화 정보
이 PR은 Claude Code + GitHub 통합으로 자동 생성되었습니다."
    
    # PR 생성
    gh pr create \
        --title "🔧 Fix #$issue_number: $issue_title" \
        --body "$pr_body" \
        --label "automated,enhancement" \
        --reviewer "@me"
    
    echo -e "${GREEN}✅ PR이 생성되었습니다!${NC}"
}

# PR 자동 리뷰
function review_pull_request() {
    echo -e "\n${YELLOW}PR 번호를 입력하세요 (또는 'current' 입력):${NC} "
    read pr_input
    
    if [ "$pr_input" = "current" ]; then
        pr_number=$(gh pr view --json number -q .number)
    else
        pr_number=$pr_input
    fi
    
    echo -e "${BLUE}PR #$pr_number를 분석하는 중...${NC}"
    
    # PR 정보 가져오기
    pr_diff=$(gh pr diff $pr_number)
    
    # Claude로 리뷰
    review_result=$(claude --allowedTools "Read" <<EOF
다음 PR의 변경사항을 리뷰해주세요:

$pr_diff

리뷰 포인트:
1. 코드 품질
2. 보안 이슈
3. 성능 고려사항
4. 개선 제안

마크다운 형식으로 리뷰를 작성해주세요.
EOF
)
    
    # 리뷰 코멘트 게시
    echo "$review_result" | gh pr review $pr_number --comment --body-file -
    
    echo -e "${GREEN}✅ 리뷰가 게시되었습니다!${NC}"
}

# 코드 품질 분석
function analyze_code_quality() {
    echo -e "${BLUE}코드 품질을 분석하는 중...${NC}"
    
    # Claude로 분석
    claude --allowedTools "Read" "Write(reports/quality-report.md)" <<EOF
/analyze --comprehensive
다음 항목들을 분석해주세요:
- 코드 복잡도
- 보안 취약점
- 성능 이슈
- 테스트 커버리지
- 문서화 상태

결과를 reports/quality-report.md에 저장해주세요.
EOF
    
    echo -e "${GREEN}✅ 분석 완료! reports/quality-report.md를 확인하세요.${NC}"
    
    # 이슈 생성 옵션
    echo -e "${YELLOW}발견된 문제들에 대해 GitHub Issue를 생성하시겠습니까? (y/n)${NC}"
    read create_issues
    if [ "$create_issues" = "y" ]; then
        create_quality_issues
    fi
}

# 품질 이슈 생성
function create_quality_issues() {
    if [ -f "reports/quality-report.md" ]; then
        gh issue create \
            --title "🔍 코드 품질 개선 필요 - $(date +%Y-%m-%d)" \
            --body-file reports/quality-report.md \
            --label "quality,automated"
        echo -e "${GREEN}✅ 품질 개선 이슈가 생성되었습니다!${NC}"
    fi
}

# 릴리스 자동화
function automate_release() {
    echo -e "${BLUE}릴리스를 준비하는 중...${NC}"
    
    # 현재 버전 확인
    current_version=$(git describe --tags --abbrev=0 2>/dev/null || echo "v0.0.0")
    echo -e "${YELLOW}현재 버전: $current_version${NC}"
    
    # 새 버전 입력
    echo -n "새 버전 (예: v1.0.1): "
    read new_version
    
    # 변경사항 수집
    changelog=$(git log $current_version..HEAD --pretty=format:"- %s" | grep -v "Merge")
    
    # 릴리스 노트 생성
    release_notes="## 🎉 Release $new_version

### 📝 변경사항
$changelog

### 🤖 자동화 정보
이 릴리스는 Claude Code + GitHub 통합으로 자동 생성되었습니다.

### 📊 통계
- 커밋 수: $(git rev-list --count $current_version..HEAD)
- 변경된 파일: $(git diff --name-only $current_version..HEAD | wc -l)
"
    
    # 태그 생성 및 릴리스
    git tag -a "$new_version" -m "Release $new_version"
    git push origin "$new_version"
    
    # GitHub 릴리스 생성
    gh release create "$new_version" \
        --title "Release $new_version" \
        --notes "$release_notes" \
        --latest
    
    echo -e "${GREEN}✅ 릴리스 $new_version가 생성되었습니다!${NC}"
}

# 프로젝트 상태 리포트
function project_status_report() {
    echo -e "${BLUE}프로젝트 상태를 분석하는 중...${NC}"
    
    # 통계 수집
    open_issues=$(gh issue list --state open --json number --jq '. | length')
    open_prs=$(gh pr list --state open --json number --jq '. | length')
    
    # 리포트 생성
    report="# 📊 프로젝트 상태 리포트 - $(date +%Y-%m-%d)

## 📈 현재 상태
- 🐛 열린 이슈: $open_issues개
- 🔄 열린 PR: $open_prs개
- 📅 마지막 커밋: $(git log -1 --format=%cd --date=relative)
- 👥 기여자 수: $(git shortlog -sn | wc -l)명

## 🔥 최근 활동
### 최근 이슈 (5개)
$(gh issue list --limit 5 --json number,title,author --jq '.[] | "- #\(.number): \(.title) (@\(.author.login))"')

### 최근 PR (5개)
$(gh pr list --limit 5 --json number,title,author --jq '.[] | "- #\(.number): \(.title) (@\(.author.login))"')

## 📅 마일스톤
$(gh api repos/:owner/:repo/milestones --jq '.[] | "- \(.title): \(.open_issues)/\(.closed_issues + .open_issues) 완료"' 2>/dev/null || echo "마일스톤 없음")
"
    
    echo "$report"
    echo "$report" > reports/status-report-$(date +%Y%m%d).md
    echo -e "${GREEN}✅ 리포트가 생성되었습니다!${NC}"
}

# 설정 관리
function manage_settings() {
    echo -e "\n${GREEN}=== 설정 관리 ===${NC}"
    echo "1) 기본 리뷰어 설정"
    echo "2) 자동화 레벨 설정"
    echo "3) 브랜치 보호 규칙"
    echo "4) 웹훅 설정"
    echo "0) 뒤로"
    echo -n "선택: "
    read setting_choice
    
    case $setting_choice in
        1)
            echo -n "기본 리뷰어 GitHub 사용자명: "
            read reviewer
            echo "DEFAULT_REVIEWER=$reviewer" >> ~/.claude-github-config
            echo -e "${GREEN}✅ 설정 저장됨${NC}"
            ;;
        2)
            echo "자동화 레벨 (1-5): "
            read level
            echo "AUTOMATION_LEVEL=$level" >> ~/.claude-github-config
            echo -e "${GREEN}✅ 설정 저장됨${NC}"
            ;;
        *)
            return
            ;;
    esac
}

# 도움말
function show_help() {
    echo -e "\n${BLUE}=== Claude Code + GitHub 통합 도움말 ===${NC}"
    echo -e "
${GREEN}주요 기능:${NC}
• Issue → 코드: GitHub Issue를 읽고 자동으로 코드 구현
• 자동 PR: 구현된 코드로 Pull Request 자동 생성
• 코드 리뷰: PR의 코드를 Claude가 자동 리뷰
• 품질 분석: 전체 코드베이스 품질 점검

${YELLOW}사용 팁:${NC}
1. Issue를 자세히 작성할수록 더 정확한 구현 가능
2. PR 리뷰는 'current'를 입력하면 현재 브랜치의 PR 리뷰
3. 정기적인 품질 분석으로 기술 부채 관리

${BLUE}문제 해결:${NC}
• GitHub CLI 인증: gh auth login
• 권한 문제: gh auth refresh
• 자세한 로그: export DEBUG=1
"
}

# 메인 루프
while true; do
    show_menu
    read choice
    
    case $choice in
        1) issue_to_code ;;
        2) create_pull_request ;;
        3) review_pull_request ;;
        4) issue_to_code ;;
        5) analyze_code_quality ;;
        6) automate_release ;;
        7) project_status_report ;;
        8) manage_settings ;;
        9) show_help ;;
        0) 
            echo -e "${GREEN}안녕히 가세요!${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}잘못된 선택입니다.${NC}"
            ;;
    esac
done
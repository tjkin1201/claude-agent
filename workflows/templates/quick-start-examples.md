# 빠른 시작 예제 모음

## 🚀 실용적 워크플로우 예제

### 1. 스타트업 웹앱 개발 (8주 프로젝트)
```bash
# 프로젝트 초기화
/workflow start --template "startup-webapp" \
  --name "TaskFlow" \
  --description "팀 협업 도구" \
  --target-users "소규모팀" \
  --timeline "8weeks"

# Week 1-2: 기획 및 검증
/workflow execute --phase "validation" \
  --agents "market-researcher,user-interviewer,competitor-analyst" \
  --deliverables "user-personas,market-analysis,mvp-scope"

# Week 3-4: 설계
/workflow execute --phase "design" \
  --agents "ux-researcher,ui-designer,system-architect" \
  --parallel --deliverables "wireframes,mockups,tech-stack"

# Week 5-7: 개발
/workflow execute --phase "development" \
  --agents "frontend-developer,backend-developer,devops-engineer" \
  --parallel --sprint-length "1week"

# Week 8: 런칭
/workflow execute --phase "launch" \
  --agents "qa-tester,performance-tester,marketing-specialist" \
  --deliverables "tested-app,launch-plan"
```

### 2. 브랜드 리뉴얼 프로젝트 (6주)
```bash
# 브랜드 리뉴얼 시작
/workflow start --template "brand-renewal" \
  --client "테크스타트업" \
  --industry "SaaS" \
  --budget "50K" \
  --timeline "6weeks"

# Week 1: 브랜드 진단
/workflow execute --phase "audit" \
  --agents "brand-analyst,market-researcher" \
  --analysis-depth "comprehensive"

# Week 2-3: 컨셉 개발
/workflow execute --phase "concept" \
  --agents "brand-strategist,creative-director" \
  --concepts-count 3 \
  --stakeholder-review

# Week 4-5: 디자인 실행
/workflow execute --phase "execution" \
  --agents "logo-designer,visual-designer,brand-guideline-creator" \
  --parallel

# Week 6: 런칭 준비
/workflow execute --phase "rollout" \
  --agents "brand-implementation-specialist,digital-asset-manager" \
  --deliverables "brand-kit,guidelines,launch-materials"
```

### 3. 데이터 분석 프로젝트 (4주)
```bash
# 매출 분석 프로젝트
/workflow start --template "business-analytics" \
  --objective "매출증대전략" \
  --data-sources "sales-db,crm,marketing-tools" \
  --stakeholders "CEO,마케팅팀,영업팀"

# Week 1: 데이터 수집 및 탐색
/workflow execute --phase "data-discovery" \
  --agents "data-engineer,exploratory-analyst" \
  --data-quality-check

# Week 2: 분석 및 모델링
/workflow execute --phase "analysis" \
  --agents "statistical-analyst,predictive-modeler" \
  --methods "regression,clustering,forecasting"

# Week 3: 인사이트 도출
/workflow execute --phase "insights" \
  --agents "business-analyst,data-storyteller" \
  --visualization-focus

# Week 4: 실행 계획
/workflow execute --phase "recommendations" \
  --agents "strategy-consultant,implementation-planner" \
  --deliverables "action-plan,dashboard,presentation"
```

## 🎯 산업별 맞춤 예제

### 핀테크 앱 개발
```bash
/workflow start --template "fintech-app" \
  --compliance "PCI-DSS,SOX" \
  --features "payments,budgeting,investments" \
  --security-level "maximum"

# 추가 단계들
--add-phase "regulatory-review" \
--add-phase "security-penetration-test" \
--add-phase "compliance-audit"
```

### 의료 시스템 구축
```bash
/workflow start --template "healthcare-system" \
  --compliance "HIPAA,FDA" \
  --user-types "doctors,patients,administrators" \
  --data-sensitivity "maximum"

# 의료 특화 에이전트들
--specialized-agents "medical-domain-expert,hipaa-compliance-officer,clinical-workflow-analyst"
```

### 이커머스 플랫폼
```bash
/workflow start --template "ecommerce-platform" \
  --scale "mid-market" \
  --features "catalog,payments,inventory,analytics" \
  --integrations "erp,crm,marketing-automation"

# 이커머스 특화
--add-phase "payment-integration-testing" \
--add-phase "inventory-system-setup" \
--add-phase "customer-analytics-implementation"
```

## ⚡ 긴급 프로젝트 템플릿

### 1주일 MVP
```bash
/workflow start --template "1week-mvp" \
  --scope "minimal-viable" \
  --team "solo" \
  --tech-stack "nocode-lowcode"

# 하루별 계획
--day1 "research-and-wireframes" \
--day2-3 "core-feature-development" \
--day4 "basic-testing" \
--day5 "deployment-and-feedback"
```

### 24시간 해커톤
```bash
/workflow start --template "hackathon-24h" \
  --team-size "4" \
  --theme "AI-productivity" \
  --judging-criteria "innovation,technical-skill,presentation"

# 시간별 계획
--hour0-2 "brainstorm-and-plan" \
--hour2-16 "development-sprint" \
--hour16-20 "polish-and-test" \
--hour20-24 "presentation-prep"
```

## 🔄 반복적 개선 템플릿

### 지속적 개선 사이클
```bash
/workflow start --template "continuous-improvement" \
  --cycle-length "2weeks" \
  --improvement-focus "user-experience" \
  --metrics "engagement,satisfaction,retention"

# 2주 사이클 자동화
/workflow automate --trigger "bi-weekly" \
  --phases "analyze,hypothesize,experiment,measure" \
  --auto-report
```

### 계절별 마케팅 캠페인
```bash
/workflow start --template "seasonal-marketing" \
  --season "holiday" \
  --campaigns-count "4" \
  --channels "social,email,paid-ads"

# 4분기 자동 스케줄링
/workflow schedule --q1 "new-year-campaign" \
  --q2 "spring-promotion" \
  --q3 "summer-sale" \
  --q4 "holiday-special"
```

## 📊 성공 지표 및 최적화

### KPI 설정 예제
```yaml
project_kpis:
  development_project:
    - time_to_market: "계획 대비 일정 준수율"
    - quality_score: "버그 없는 배포율" 
    - team_satisfaction: "팀 만족도 점수"
    
  marketing_campaign:
    - conversion_rate: "목표 전환율 달성"
    - roi: "투자 대비 수익률"
    - brand_awareness: "브랜드 인지도 증가"
    
  analytics_project:
    - insight_quality: "실행 가능한 인사이트 개수"
    - decision_impact: "의사결정 개선 효과"
    - adoption_rate: "대시보드 사용률"
```

### 자동 최적화 설정
```bash
# 성과 기반 자동 조정
/workflow optimize --based-on "historical-performance" \
  --adjust "timeline,resource-allocation,agent-selection"

# A/B 테스트 워크플로우
/workflow ab-test --variant-a "current-process" \
  --variant-b "optimized-process" \
  --metric "efficiency" \
  --duration "1month"
```
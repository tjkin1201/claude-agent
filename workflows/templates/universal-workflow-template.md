# 범용 워크플로우 템플릿

## 🎯 템플릿 구조

### 기본 워크플로우 패턴
```yaml
workflow_template:
  name: "{WORKFLOW_NAME}"
  category: "{CATEGORY}"
  industry: "{INDUSTRY}"
  complexity: "{LOW|MEDIUM|HIGH}"
  duration: "{ESTIMATED_TIME}"
  team_size: "{TEAM_SIZE}"
  
phases:
  1_discovery:
    description: "문제 정의 및 요구사항 분석"
    agents: ["{DOMAIN}_analyst", "stakeholder_interviewer"]
    outputs: ["requirements_doc", "success_criteria"]
    
  2_planning:
    description: "전략 수립 및 계획"
    agents: ["{DOMAIN}_strategist", "project_planner"]
    outputs: ["strategy_doc", "project_plan"]
    
  3_design:
    description: "솔루션 설계"
    agents: ["{DOMAIN}_designer", "architect"]
    outputs: ["design_spec", "wireframes"]
    
  4_implementation:
    description: "실제 구현 및 개발"
    agents: ["{DOMAIN}_developer", "specialist"]
    outputs: ["working_prototype", "documentation"]
    
  5_validation:
    description: "테스트 및 검증"
    agents: ["qa_tester", "validator"]
    outputs: ["test_results", "quality_report"]
    
  6_deployment:
    description: "배포 및 런칭"
    agents: ["deployment_specialist", "launch_coordinator"]
    outputs: ["live_system", "launch_report"]
```

## 🔧 커스터마이징 가이드

### 1. 도메인별 치환 변수
```yaml
software_development:
  WORKFLOW_NAME: "Software Development Lifecycle"
  CATEGORY: "technology"
  DOMAIN: "software"
  
branding_design:
  WORKFLOW_NAME: "Brand Identity Creation"
  CATEGORY: "creative"
  DOMAIN: "brand"
  
marketing_campaign:
  WORKFLOW_NAME: "Marketing Campaign Execution"
  CATEGORY: "marketing"  
  DOMAIN: "marketing"
```

### 2. 산업별 특화 설정
```yaml
fintech_additions:
  compliance_phase:
    agents: ["compliance_officer", "security_auditor"]
    requirements: ["financial_regulations", "security_standards"]
    
healthcare_additions:
  regulatory_phase:
    agents: ["hipaa_specialist", "medical_validator"]
    requirements: ["patient_privacy", "medical_accuracy"]
    
ecommerce_additions:
  commerce_phase:
    agents: ["payment_specialist", "inventory_manager"]
    requirements: ["payment_security", "inventory_accuracy"]
```

## 📋 실행 템플릿

### 빠른 시작 템플릿
```bash
# 템플릿 기반 워크플로우 생성
/workflow create-from-template \
  --template "universal" \
  --domain "software" \
  --industry "fintech" \
  --complexity "high" \
  --team-size "8-12"

# 맞춤형 설정
/workflow customize \
  --add-phase "security_audit" \
  --remove-phase "deployment" \
  --modify-agent "developer" "senior_developer"
```

### 단계별 실행 템플릿
```bash
# Phase 1: 발견 및 분석
/workflow execute --phase "discovery" \
  --agents "business_analyst,stakeholder_interviewer" \
  --output-format "comprehensive" \
  --timeline "1week"

# Phase 2: 계획 및 전략
/workflow execute --phase "planning" \
  --input-from "discovery" \
  --agents "strategic_planner,technical_architect" \
  --parallel-execution \
  --timeline "1week"

# Phase 3-6: 나머지 단계들 순차 실행
/workflow execute --phases "design,implementation,validation,deployment" \
  --sequential \
  --quality-gates-enabled \
  --timeline "8weeks"
```

## 🎨 템플릿 라이브러리

### 1. 미니 프로젝트 템플릿 (1-2주)
```yaml
mini_project:
  phases: ["quick_analysis", "rapid_design", "implementation", "basic_test"]
  duration: "1-2weeks"
  team_size: "1-3"
  quality_level: "standard"
  
suitable_for:
  - MVP 개발
  - 프로토타입 제작
  - 컨셉 검증
  - 실험적 프로젝트
```

### 2. 표준 프로젝트 템플릿 (1-3개월)
```yaml
standard_project:
  phases: ["discovery", "planning", "design", "implementation", "validation", "deployment"]
  duration: "1-3months"
  team_size: "4-8"
  quality_level: "professional"
  
suitable_for:
  - 일반적인 비즈니스 프로젝트
  - 중간 규모 애플리케이션
  - 브랜딩 프로젝트
  - 마케팅 캠페인
```

### 3. 엔터프라이즈 템플릿 (3-12개월)
```yaml
enterprise_project:
  phases: ["strategic_analysis", "architectural_design", "phased_implementation", "comprehensive_testing", "staged_deployment", "change_management"]
  duration: "3-12months"
  team_size: "10-50"
  quality_level: "enterprise"
  
suitable_for:
  - 대기업 시스템
  - 레거시 현대화
  - 조직 전반 변화
  - 규제 대응 프로젝트
```

## 🔄 적응형 템플릿 시스템

### 자동 최적화 기능
```yaml
adaptive_features:
  team_size_optimization:
    - small_team: "역할 통합, 순차 실행 중심"
    - medium_team: "전문화, 일부 병렬 실행"
    - large_team: "세분화, 최대 병렬 실행"
    
  timeline_optimization:
    - urgent: "핵심 기능만, 빠른 검증"
    - standard: "전체 프로세스, 균형적 접근"
    - thorough: "모든 단계, 완벽한 검증"
    
  budget_optimization:
    - limited: "자동화 도구 활용, 효율성 중심"
    - moderate: "표준 도구, 균형적 접근"
    - unlimited: "프리미엄 도구, 품질 중심"
```

### 학습 및 개선 시스템
```bash
# 성공 패턴 학습
/workflow learn --from-project "successful_projects" --extract-patterns

# 실패 사례 분석
/workflow analyze-failures --identify-bottlenecks --suggest-improvements

# 템플릿 자동 업데이트
/workflow update-templates --based-on "recent_successes" --confidence-level "high"
```
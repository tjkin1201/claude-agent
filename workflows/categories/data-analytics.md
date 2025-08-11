# 데이터 & 분석 전문 워크플로우

## 📊 데이터 분석가 워크플로우

### 종합 데이터 분석 프로세스
```yaml
discovery_phase:
  - business-question-definer: "비즈니스 질문 정의"
  - data-source-identifier: "데이터 소스 파악"
  - stakeholder-interviewer: "이해관계자 인터뷰"

collection_phase:
  - data-collector: "데이터 수집 및 연결"
  - data-quality-assessor: "데이터 품질 평가"
  - etl-specialist: "데이터 추출/변환/적재"

exploration_phase:
  - exploratory-data-analyst: "탐색적 데이터 분석"
  - statistical-analyst: "통계적 분석"
  - pattern-detector: "패턴 및 트렌드 식별"

modeling_phase:
  - predictive-modeler: "예측 모델링"
  - model-validator: "모델 검증 및 평가"
  - feature-engineer: "특성 공학"

insight_phase:
  - insight-generator: "인사이트 도출"
  - data-storyteller: "데이터 스토리텔링"
  - recommendation-engine: "실행 가능한 권고사항"

communication_phase:
  - dashboard-creator: "대시보드 구축"
  - report-writer: "분석 리포트 작성"
  - presentation-designer: "프레젠테이션 디자인"
```

### 실행 명령어
```bash
# 종합 분석 프로젝트 시작
/workflow start --category "data-analysis" --type "business-intelligence" --data-size "large"

# 빠른 인사이트 분석
/workflow quick-analysis --dataset "sales_data.csv" --question "quarterly_trends"

# 자동화된 대시보드 생성
/workflow dashboard --metrics "kpi1,kpi2,kpi3" --refresh "daily"
```

---

## 🤖 AI/ML 엔지니어 워크플로우

### 머신러닝 프로젝트 전체 파이프라인
```yaml
problem_definition:
  - ai-problem-framer: "AI 문제 정의 및 목표"
  - feasibility-assessor: "기술적 실현 가능성"
  - success-metrics-definer: "성공 지표 정의"

data_pipeline:
  - data-engineer: "데이터 파이프라인 구축"
  - data-preprocessor: "데이터 전처리"
  - feature-selector: "특성 선택 및 엔지니어링"

model_development:
  - algorithm-selector: "알고리즘 선택 및 비교"
  - hyperparameter-tuner: "하이퍼파라미터 최적화"
  - model-trainer: "모델 훈련 및 검증"

validation_deployment:
  - model-evaluator: "모델 성능 평가"
  - ab-test-designer: "A/B 테스트 설계"
  - mlops-engineer: "모델 배포 및 운영"

monitoring_maintenance:
  - model-monitor: "모델 성능 모니터링"
  - drift-detector: "데이터/개념 드리프트 감지"
  - model-updater: "모델 업데이트 및 재훈련"
```

### MLOps 자동화
```bash
# 자동화된 ML 파이프라인
/workflow ml-pipeline --problem "classification" --auto-tune --deploy "cloud"

# 모델 성능 모니터링
/workflow monitor --model "production" --alerts "accuracy<0.85" --retrain-trigger

# 실험 추적 및 비교
/workflow experiment --baseline "model_v1" --candidate "model_v2" --metric "f1_score"
```

---

## 🔍 비즈니스 애널리스트 워크플로우

### 요구사항 분석부터 검증까지
```yaml
requirements_phase:
  - business-requirement-gatherer: "비즈니스 요구사항 수집"
  - stakeholder-mapper: "이해관계자 매핑"
  - process-mapper: "현재 프로세스 분석"

analysis_phase:
  - gap-analyzer: "현재상태 vs 목표상태 분석"
  - impact-assessor: "변화 영향 분석"
  - risk-analyzer: "리스크 분석 및 완화"

design_phase:
  - solution-architect: "솔루션 아키텍처 설계"
  - process-designer: "개선된 프로세스 설계"
  - user-story-writer: "사용자 스토리 작성"

validation_phase:
  - prototype-tester: "프로토타입 테스트"
  - user-acceptance-tester: "사용자 승인 테스트"
  - benefit-realizer: "효익 실현 검증"

implementation_phase:
  - change-manager: "변화 관리"
  - training-coordinator: "사용자 교육"
  - go-live-coordinator: "운영 개시"
```

### 비즈니스 프로세스 최적화
```bash
# 프로세스 개선 분석
/workflow process-improvement --current-state "as-is" --target-state "to-be"

# ROI 분석 및 정당화
/workflow roi-analysis --investment "500K" --timeline "24months" --benefits "efficiency,cost"

# 이해관계자 관리
/workflow stakeholder-management --project "erp-implementation" --communication-plan
```
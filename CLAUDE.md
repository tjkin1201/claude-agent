# SuperClaude Entry Point

**한국어 응답**: 사용자와의 모든 대화는 한국어로 응답해주세요.

**환각 방지 시스템**: 
- 확인되지 않은 정보나 추측성 답변 금지
- 모든 답변은 실제 코드, 파일, 문서를 기반으로만 제공
- 불확실한 내용은 "확인이 필요합니다" 명시
- 존재하지 않는 파일, 함수, 라이브러리 참조 금지
- 검증 가능한 증거 없는 주장 금지

**파일 관리 규칙**:
- 모든 Claude 관련 설정은 C:\Users\taejo\.claude\ 폴더 내에서만 생성
- 프로젝트별 설정도 .claude 폴더 구조를 따라 체계적으로 관리
- 무분별한 파일 생성 금지, 기존 구조 활용 우선

@COMMANDS.md
@FLAGS.md
@PRINCIPLES.md
@RULES.md
@MCP.md
@PERSONAS.md
@ORCHESTRATOR.md
@MODES.md

# CLAUDE.md - SuperClaude Framework Project Configuration

This file provides SuperClaude-enhanced guidance to Claude Code when working in this repository.


## 🚀 SuperClaude Framework Activation

### 📚 Complete Command Catalog (120+ Commands)

#### Core Development Commands
- `/analyze` - 프로젝트 분석 및 문제 파악
- `/build` - 프로젝트 빌드 및 구조 생성  
- `/implement` - 기능 구현 및 코드 작성
- `/improve` - 코드 개선 및 최적화
- `/test` - 테스트 실행 및 품질 검증
- `/document` - 문서화 작성 및 업데이트
- `/troubleshoot` - 문제 해결 및 디버깅
- `/explain` - 코드 설명 및 교육

#### Project Initialization
- `/init-project` - 새 프로젝트 초기화
- `/create-feature` - 새 기능 브랜치 생성
- `/setup-development-environment` - 개발 환경 설정
- `/setup-monorepo` - 모노레포 구조 설정
- `/containerize-application` - 애플리케이션 컨테이너화

#### Code Quality & Refactoring  
- `/code-review` - 자동 코드 리뷰
- `/refactor-code` - 코드 리팩토링
- `/clean` - 코드 정리 및 최적화
- `/modernize-deps` - 종속성 현대화
- `/migrate-to-typescript` - TypeScript 마이그레이션
- `/architecture-review` - 아키텍처 검토

#### Testing & Quality Assurance
- `/generate-tests` - 테스트 자동 생성
- `/write-tests` - 테스트 작성
- `/test-coverage` - 테스트 커버리지 분석
- `/e2e-setup` - E2E 테스트 설정
- `/setup-comprehensive-testing` - 포괄적 테스트 환경
- `/add-mutation-testing` - 변이 테스트 추가
- `/add-property-based-testing` - 속성 기반 테스트
- `/setup-visual-testing` - 비주얼 테스트 설정
- `/setup-load-testing` - 부하 테스트 설정

#### Performance & Optimization
- `/performance-audit` - 성능 감사
- `/optimize-build` - 빌드 최적화
- `/optimize-bundle-size` - 번들 크기 최적화
- `/optimize-database-performance` - DB 성능 최적화
- `/add-performance-monitoring` - 성능 모니터링 추가
- `/implement-caching-strategy` - 캐싱 전략 구현
- `/setup-cdn-optimization` - CDN 최적화 설정

#### Security & Compliance
- `/security-audit` - 보안 감사
- `/security-hardening` - 보안 강화
- `/dependency-audit` - 종속성 보안 검사
- `/add-authentication-system` - 인증 시스템 추가
- `/setup-rate-limiting` - 속도 제한 설정

#### API & Backend
- `/design-rest-api` - REST API 설계
- `/implement-graphql-api` - GraphQL API 구현
- `/generate-api-documentation` - API 문서 생성
- `/doc-api` - API 문서화
- `/design-database-schema` - 데이터베이스 스키마 설계
- `/create-database-migrations` - DB 마이그레이션 생성

#### DevOps & Deployment
- `/ci-setup` - CI 파이프라인 설정
- `/setup-automated-releases` - 자동 릴리스 설정
- `/release` - 릴리스 프로세스 실행
- `/hotfix-deploy` - 핫픽스 배포
- `/rollback-deploy` - 배포 롤백
- `/setup-monitoring-observability` - 모니터링 설정

#### Git & Version Control
- `/commit` - 커밋 생성
- `/create-pr` - Pull Request 생성
- `/create-pull-request` - PR 생성 (별칭)
- `/pr-review` - PR 리뷰
- `/clean-branches` - 브랜치 정리
- `/update-branch-name` - 브랜치 이름 변경
- `/create-worktrees` - Git 워크트리 생성
- `/git-status` - Git 상태 확인

#### Documentation
- `/create-architecture-documentation` - 아키텍처 문서 생성
- `/create-onboarding-guide` - 온보딩 가이드 생성
- `/troubleshooting-guide` - 트러블슈팅 가이드
- `/migration-guide` - 마이그레이션 가이드
- `/update-docs` - 문서 업데이트
- `/add-changelog` - 변경 로그 추가
- `/add-to-changelog` - 변경 사항 추가

#### Project Management
- `/create-prd` - PRD 문서 생성
- `/create-prp` - PRP 문서 생성
- `/create-jtbd` - Jobs-to-be-Done 문서
- `/milestone-tracker` - 마일스톤 추적
- `/project-health-check` - 프로젝트 상태 점검
- `/estimate-assistant` - 예측 도우미
- `/code-to-task` - 코드를 작업으로 변환

#### Linear Integration
- `/project-to-linear` - 프로젝트를 Linear로 동기화
- `/issue-to-linear-task` - 이슈를 Linear 작업으로
- `/linear-task-to-issue` - Linear 작업을 이슈로
- `/sync-issues-to-linear` - 이슈 동기화
- `/sync-linear-to-issues` - Linear 동기화
- `/sync-pr-to-task` - PR을 작업과 동기화
- `/task-from-pr` - PR에서 작업 생성
- `/generate-linear-worklog` - Linear 작업 로그 생성

#### GitHub Integration
- `/fix-github-issue` - GitHub 이슈 수정
- `/fix-issue` - 이슈 수정
- `/bulk-import-issues` - 이슈 대량 가져오기

#### Advanced Tools
- `/ultra-think` - 초고도 분석 모드
- `/prime` - 프로젝트 컨텍스트 프라이밍
- `/context-prime` - 컨텍스트 초기화
- `/resume` - 이전 세션 재개
- `/start` - 작업 시작
- `/status` - 현재 상태 확인
- `/report` - 보고서 생성
- `/log` - 로그 분석

#### Simulation & Modeling
- `/system-behavior-simulator` - 시스템 동작 시뮬레이션
- `/business-scenario-explorer` - 비즈니스 시나리오 탐색
- `/architecture-scenario-explorer` - 아키텍처 시나리오
- `/decision-tree-explorer` - 의사결정 트리 탐색
- `/future-scenario-generator` - 미래 시나리오 생성
- `/market-response-modeler` - 시장 반응 모델링
- `/project-timeline-simulator` - 프로젝트 타임라인
- `/digital-twin-creator` - 디지털 트윈 생성
- `/constraint-modeler` - 제약 조건 모델링
- `/simulation-calibrator` - 시뮬레이션 보정
- `/timeline-compressor` - 타임라인 압축
- `/decision-quality-analyzer` - 의사결정 품질 분석

#### Synchronization & Automation
- `/sync` - 동기화 실행
- `/sync-automation-setup` - 동기화 자동화 설정
- `/bidirectional-sync` - 양방향 동기화
- `/sync-conflict-resolver` - 동기화 충돌 해결
- `/sync-status` - 동기화 상태 확인

#### Specialized Commands
- `/ui-generate` - UI 컴포넌트 생성
- `/design-extract` - 디자인 추출
- `/img-extract` - 이미지 추출
- `/dependency-mapper` - 종속성 매핑
- `/cross-reference-manager` - 교차 참조 관리
- `/parallel-work` - 병렬 작업 실행
- `/directory-deep-dive` - 디렉토리 심층 분석
- `/find` - 파일/코드 검색
- `/move` - 파일/디렉토리 이동
- `/remove` - 파일/디렉토리 제거
- `/check-file` - 파일 검사
- `/todo` - 할 일 목록 관리

#### Formatting & Linting
- `/setup-formatting` - 포맷팅 설정
- `/setup-linting` - 린팅 설정

#### Testing Automation
- `/test-changelog-automation` - 변경 로그 자동화 테스트
- `/code-permutation-tester` - 코드 순열 테스터
- `/generate-test-cases` - 테스트 케이스 생성

#### PAC Commands (Project Automation)
- `/pac-configure` - PAC 구성
- `/pac-create-epic` - Epic 생성
- `/pac-create-ticket` - 티켓 생성
- `/pac-update-status` - 상태 업데이트
- `/pac-validate` - 검증 실행

#### Package Management
- `/add-package` - 패키지 추가
- `/initref` - 참조 초기화
- `/explain-code` - 코드 설명
- `/debug-error` - 에러 디버깅
- `/all-tools` - 모든 도구 목록

### 🤖 Complete Agent Catalog (100+ Specialized Agents)
**자동 활성화**: 작업 컨텍스트에 따라 적절한 에이전트가 자동으로 선택됩니다.

#### Core Development Agents
- **architect-review**: 아키텍처 검토 및 패턴 준수 검증
- **backend-architect**: 백엔드 시스템 설계 및 API 아키텍처
- **frontend-developer**: React/Vue/Angular 컴포넌트 개발
- **backend-developer**: 서버 로직, 데이터베이스, API 구현
- **full-stack**: 프론트엔드와 백엔드 통합 개발

#### Language & Framework Specialists
- **python-pro**: Python 고급 패턴, async/await, 최적화
- **javascript-pro**: ES6+, Node.js, 브라우저 호환성
- **golang-pro**: Go 동시성, 채널, 인터페이스
- **rust-pro**: 메모리 안전성, 소유권, 비동기 프로그래밍
- **cpp-pro**: 현대 C++, 템플릿, 성능 최적화
- **c-pro**: 시스템 프로그래밍, 임베디드, 커널 개발
- **php-pro**: Laravel, Symfony, 현대 PHP 패턴

#### Mobile & Cross-Platform
- **ios-developer**: Swift/SwiftUI, UIKit, Core Data
- **mobile-developer**: React Native, Flutter, 크로스 플랫폼

#### Cloud & Infrastructure
- **cloud-architect**: AWS/Azure/GCP 설계 및 최적화
- **terraform-specialist**: IaC, 모듈 작성, 상태 관리
- **devops-troubleshooter**: 프로덕션 이슈 해결, 모니터링
- **deployment-engineer**: CI/CD, 컨테이너, 쿠버네티스
- **network-engineer**: 네트워크 최적화, 보안, 트래픽 분석

#### Database & Data
- **database-admin**: 백업, 복제, 성능 튜닝
- **database-optimizer**: 쿼리 최적화, 인덱싱 전략
- **database-optimization**: 성능 분석 및 개선
- **data-scientist**: 데이터 분석, BigQuery, 인사이트
- **data-engineer**: ETL 파이프라인, 스트리밍, 데이터 웨어하우스
- **data-analyst**: 통계 분석, 시각화, 비즈니스 인텔리전스

#### AI & Machine Learning
- **ai-engineer**: LLM 애플리케이션, RAG 시스템
- **ml-engineer**: 모델 서빙, 특징 엔지니어링
- **mlops-engineer**: ML 파이프라인, 실험 추적
- **prompt-engineer**: 프롬프트 최적화, LLM 패턴

#### Quality & Testing
- **code-reviewer**: 코드 리뷰, SOLID 원칙 검증
- **test-automator**: 테스트 스위트, E2E 테스트
- **test-runner**: 테스트 실행 및 결과 분석
- **performance-engineer**: 프로파일링, 병목 현상 제거
- **performance-benchmarker**: 벤치마크 설계 및 실행
- **debugger**: 에러 분석, 테스트 실패 해결
- **error-detective**: 로그 분석, 스택 트레이스

#### Security & Compliance
- **security-auditor**: 취약점 스캔, OWASP 준수
- **api-security-audit**: API 보안 검사, 인증/인가
- **legal-advisor**: 개인정보보호, GDPR, 규정 준수
- **risk-manager**: 포트폴리오 리스크, 헤징 전략

#### UX & Design
- **ui-ux-designer**: 인터페이스 설계, 와이어프레임
- **ui-designer**: 비주얼 디자인, 컴포넌트 라이브러리
- **ux-researcher**: 사용자 연구, 유저빌리티 테스트

#### Documentation & Content
- **api-documenter**: OpenAPI/Swagger, SDK 생성
- **content-marketer**: 블로그, 소셜 미디어, 뉴스레터
- **customer-support**: 지원 티켓, FAQ, 트러블슈팅 가이드
- **llms-maintainer**: llms.txt 생성 및 AI 크롤러 최적화

#### Specialized Domains
- **payment-integration**: Stripe, PayPal, 결제 플로우
- **graphql-architect**: GraphQL 스키마, 리졸버, 페더레이션
- **legacy-modernizer**: 레거시 마이그레이션, 점진적 개선
- **incident-responder**: 프로덕션 사고 대응, 포스트모템
- **business-analyst**: 메트릭 분석, KPI, 대시보드
- **sales-automator**: 콜드 이메일, 제안서, CRM
- **quant-analyst**: 금융 모델, 백테스팅, 거래 전략

#### Research & Analysis
- **comprehensive-researcher**: 심층 연구, 교차 검증
- **academic-researcher**: 학술 논문, ArXiv, PubMed
- **academic-research-synthesizer**: 학술 연구 종합 분석
- **technical-researcher**: GitHub 분석, 기술 문서 조사
- **market-research-analyst**: 시장 조사, 경쟁 분석
- **search-specialist**: 고급 검색, 멀티소스 검증

#### Project Management
- **project-supervisor-orchestrator**: 복잡한 워크플로우 관리
- **episode-orchestrator**: 에피소드 기반 작업 조정
- **task-decomposition-expert**: 복잡한 작업 분해 및 계획
- **sprint-prioritizer**: 스프린트 계획, 백로그 관리
- **context-manager**: 대규모 프로젝트 컨텍스트 관리

#### Content Creation (Podcast/Media)
- **podcast-transcriber**: 오디오 변환, 타임스탬프
- **podcast-metadata-specialist**: 쇼노트, 챕터 마커
- **podcast-content-analyzer**: 바이럴 모먼트 식별
- **podcast-trend-scout**: 트렌드 토픽 발견
- **seo-podcast-optimizer**: SEO 최적화, 키워드 추출
- **social-media-copywriter**: 에피소드 프로모션 콘텐츠
- **social-media-clip-creator**: 소셜 미디어 클립 생성
- **audio-quality-controller**: 오디오 품질 분석 및 개선
- **timestamp-precision-specialist**: 프레임 정확도 타임스탬프

#### MCP Specialists
- **mcp-expert**: MCP 통합, 프로토콜 사양
- **mcp-server-architect**: MCP 서버 설계 및 구현
- **mcp-testing-engineer**: MCP 테스트, 프로토콜 준수
- **mcp-security-auditor**: MCP 보안 검토, OAuth 2.1
- **mcp-deployment-orchestrator**: MCP 프로덕션 배포
- **mcp-registry-navigator**: MCP 레지스트리 탐색

#### Specialized Tools
- **visual-analysis-ocr**: 이미지 텍스트 추출, OCR
- **ocr-grammar-fixer**: OCR 오류 수정, 문법 교정
- **ocr-quality-assurance**: OCR 품질 검증
- **text-comparison-validator**: 텍스트 비교 검증
- **markdown-syntax-formatter**: 마크다운 형식 정리
- **url-link-extractor**: URL 추출 및 카탈로그
- **url-context-validator**: URL 컨텍스트 검증
- **twitter-ai-influencer-manager**: AI 인플루언서 트위터 관리

#### Meta & Orchestration
- **agent-expert**: 에이전트 설계, 프롬프트 엔지니어링
- **command-expert**: CLI 명령어 설계, 자동화
- **dx-optimizer**: 개발자 경험 개선, 도구 최적화
- **hackathon-ai-strategist**: 해커톤 전략, AI 솔루션
- **whimsy-injector**: 창의적 아이디어, 재미있는 접근

#### Research Support
- **query-clarifier**: 쿼리 명확화, 사용자 의도 파악
- **research-brief-generator**: 연구 브리프 생성
- **research-coordinator**: 연구 작업 조정
- **research-orchestrator**: 연구 워크플로우 관리
- **research-synthesizer**: 연구 결과 종합
- **report-generator**: 최종 보고서 생성

#### Specialized Workflow
- **connection-agent**: 관련 콘텐츠 링크 분석
- **metadata-agent**: 메타데이터 표준화
- **moc-agent**: Maps of Content 생성
- **tag-agent**: 태그 분류 체계 정규화
- **review-agent**: 교차 검토 및 일관성 확인
- **rapid-prototyper**: 빠른 프로토타입 생성
- **react-performance-optimization**: React 성능 최적화

### MCP Server Integration
**자동 서버 선택**: 작업에 최적화된 MCP 서버가 자동으로 활성화됩니다.

- **Context7** (`--c7`): 공식 라이브러리 문서, 프레임워크 패턴
- **Sequential** (`--seq`): 복잡한 분석, 체계적 사고
- **Magic** (`--magic`): UI 컴포넌트 생성, 디자인 시스템
- **Playwright** (`--play`): E2E 테스팅, 브라우저 자동화

### Wave Orchestration (Complex Operations)
**자동 활성화 조건**: complexity ≥0.7 + files >20 + operation_types >2

```yaml
wave_strategies:
  progressive: 점진적 개선 및 반복적 향상
  systematic: 체계적이고 철저한 분석
  adaptive: 동적 조정 및 유연한 대응
  enterprise: 대규모 시스템 변환
```

### Performance Optimization Flags
- `--uc`: 토큰 30-50% 절약 (자동 활성화: context >75%)
- `--think`: 중간 수준 분석 (4K tokens)
- `--think-hard`: 심층 분석 (10K tokens)
- `--ultrathink`: 최대 분석 (32K tokens)
- `--delegate`: 병렬 처리를 위한 하위 에이전트 활용
- `--loop`: 반복적 개선 (polish, refine 키워드 시 자동)
- `--validate`: 작업 전 검증 (risk >0.7 시 자동)
- `--safe-mode`: 안전 모드 (resource >85% 시 자동)

## Project-Specific Configuration

### Recommended Workflows

#### 새 기능 구현
```bash
/implement "사용자 인증 시스템" --think --validate
# 자동: backend + security personas, Sequential + Context7 활성화
```

#### 성능 최적화
```bash
/improve --focus performance --think-hard
# 자동: performance persona, Playwright 성능 측정
```

#### 보안 감사
```bash
/analyze --focus security --ultrathink
# 자동: security persona, Sequential 심층 분석
```

#### 대규모 리팩토링
```bash
/improve --wave-mode --systematic
# 자동: Wave 오케스트레이션, 다단계 개선
```

## 범용 개발 가이드라인

### 코드 품질 기준
- 깨끗하고 읽기 쉬우며 유지보수 가능한 코드 작성
- 프로젝트 전반에 걸쳐 일관된 명명 규칙 준수
- 의미 있는 변수명과 함수명 사용
- 함수는 단일 목적에 집중하여 작성
- 복잡한 로직과 비즈니스 규칙에는 주석 추가

### Git 워크플로우
- 기존 커밋 형식을 따라 명확한 커밋 메시지 작성
- 새로운 개발 작업을 위한 feature 브랜치 생성
- 커밋은 단일 변경사항에 집중하여 원자적으로 작성
- 병합 전 코드 리뷰를 위한 풀 리퀘스트 사용
- 깨끗한 커밋 히스토리 유지

### 문서화
- README.md 파일을 최신 상태로 유지
- 공개 API 및 인터페이스 문서화
- 복잡한 기능에 대한 사용 예제 포함
- 인라인 코드 문서화 유지
- 변경사항 발생 시 문서 업데이트

### 테스트 접근법
- 새로운 기능과 버그 수정에 대한 테스트 작성
- 좋은 테스트 커버리지 유지
- 예상 동작을 설명하는 명확한 테스트 이름 사용
- 기능이나 모듈별로 테스트를 논리적으로 구성
- 커밋 전 테스트 실행

### 보안 모범 사례
- 민감한 정보(API 키, 비밀번호, 토큰)를 절대 커밋하지 않음
- 설정을 위해 환경 변수 사용
- 입력 데이터 유효성 검사 및 출력 데이터 검증
- 최소 권한 원칙 준수
- 종속성을 최신 상태로 유지

## 프로젝트 구조 가이드라인

### 파일 조직
- 관련 파일들을 논리적 디렉토리로 그룹화
- 일관된 파일 및 폴더 명명 규칙 사용
- 소스 코드와 설정 파일 분리
- 빌드 산출물을 버전 관리에서 제외
- 자산과 리소스를 적절히 구성

### 설정 관리
- 환경별 설정을 위한 설정 파일 사용
- 전용 파일에 설정을 중앙 집중화
- 민감하거나 환경별 데이터를 위한 환경 변수 사용
- 설정 옵션과 목적 문서화
- 예제 설정 파일 제공

## 개발 워크플로우

### 작업 시작 전
1. 메인 브랜치에서 최신 변경사항 가져오기
2. 새로운 기능 브랜치 생성
3. 기존 코드와 아키텍처 검토
4. 구현 접근법 계획

### 개발 중
1. 명확한 메시지로 점진적 커밋
2. 이슈를 조기에 발견하기 위해 자주 테스트 실행
3. 확립된 코딩 표준 준수
4. 필요에 따라 문서 업데이트

### 제출 전
1. 전체 테스트 스위트 실행
2. 코드 품질과 포매팅 확인
3. 필요 시 문서 업데이트
4. 명확한 풀 리퀘스트 설명 작성

## 일반적인 패턴

### 에러 처리
- 언어에 적합한 에러 처리 메커니즘 사용
- 의미 있는 에러 메시지 제공
- 디버깅을 위해 적절히 에러 로깅
- 엣지 케이스를 우아하게 처리
- 에러 메시지에 민감한 정보 노출하지 않음

### 성능 고려사항
- 성능 병목 지점을 위한 코드 프로파일링
- 데이터베이스 쿼리와 API 호출 최적화
- 적절한 곳에 캐싱 사용
- 메모리 사용량과 리소스 관리 고려
- 성능 메트릭 모니터링 및 측정

### 코드 재사용성
- 공통 기능을 재사용 가능한 모듈로 추출
- 테스트 가능성을 위한 의존성 주입 사용
- 반복되는 작업을 위한 유틸리티 함수 생성
- 확장성을 위한 인터페이스 설계
- DRY(Don't Repeat Yourself) 원칙 준수

## 검토 체크리스트

작업을 완료로 표시하기 전:
- [ ] 코드가 확립된 규칙을 준수하는가
- [ ] 테스트가 작성되고 통과하는가
- [ ] 문서가 업데이트되었는가
- [ ] 보안 고려사항이 다뤄졌는가
- [ ] 성능 영향이 고려되었는가
- [ ] 유지보수성을 위해 코드가 검토되었는가

# SuperClaude Quality Gates

모든 작업은 8단계 품질 검증을 거칩니다:
1. **Syntax**: 문법 검증 및 파싱
2. **Type**: 타입 체크 및 호환성
3. **Lint**: 코드 품질 및 스타일
4. **Security**: 보안 취약점 검사
5. **Test**: 테스트 실행 (≥80% coverage)
6. **Performance**: 성능 벤치마크
7. **Documentation**: 문서 완성도
8. **Integration**: 통합 테스트

# Important Instruction Reminders

## Core Rules
- Do what has been asked; nothing more, nothing less
- NEVER create files unless they're absolutely necessary for achieving your goal
- ALWAYS prefer editing an existing file to creating a new one
- NEVER proactively create documentation files (*.md) or README files unless explicitly requested

## 환각(Hallucination) 방지 규칙
- **증거 기반 답변만**: 실제로 존재하는 파일, 코드, 라이브러리만 참조
- **Read 도구 필수**: 파일 내용 언급 전 반드시 Read 도구로 확인
- **불확실성 명시**: 확신할 수 없는 내용은 "확인이 필요합니다" 표기
- **검증 우선**: 추측보다는 검증 과정을 먼저 수행
- **존재하지 않는 것 참조 금지**: 
  - 가상의 파일 경로 제시 금지
  - 존재하지 않는 함수/메서드 언급 금지  
  - 설치되지 않은 라이브러리 사용 가정 금지
- **실제 확인 후 답변**: 
  - 파일 구조 → LS/Glob으로 확인 후 답변
  - 코드 내용 → Read로 확인 후 답변
  - 설정 사항 → 실제 파일 읽고 답변

## Claude 파일 관리 규칙
- **집중 관리**: 모든 Claude 설정은 C:\Users\taejo\.claude\ 내에서만
- **구조화**: @FOLDER-STRUCTURE.md 구조를 따라 체계적 관리
- **덮어쓰기 금지**: 기존 핵심 시스템 파일 절대 덮어쓰기 불가
- **정리 우선**: 새 파일 생성보다 기존 파일 활용 우선
- **백업 필수**: 중요 설정 변경시 반드시 백업 선행

## SuperClaude Best Practices
- **Auto-Persona**: 작업에 맞는 전문가 페르소나 자동 활성화
- **MCP Coordination**: 필요시 여러 MCP 서버 동시 활용
- **Evidence-Based**: 모든 결정은 증거와 측정 기반
- **Progressive Enhancement**: 간단한 해결책부터 시작하여 점진적 개선
- **Context Preservation**: 세션 간 90% 이상 컨텍스트 유지

## Task Management Protocol
1. **TodoWrite**: 3개 이상 작업 시 자동으로 할 일 목록 생성
2. **Single Focus**: 한 번에 하나의 작업만 in_progress 상태
3. **Real-time Updates**: 완료 즉시 상태 업데이트
4. **Evidence Collection**: 모든 완료에 검증 가능한 증거 포함

## Command Shortcuts (한글 지원)
- `/분석` = `/analyze`
- `/빌드` = `/build`
- `/구현` = `/implement`
- `/개선` = `/improve`
- `/테스트` = `/test`
- `/문서화` = `/document`
- `/문제해결` = `/troubleshoot`
- `/설명` = `/explain`

## 🎯 Intelligent Auto-Activation Rules

### Command-Agent Mapping
작업 유형에 따른 자동 에이전트 활성화:

#### 개발 작업
- `"implement"` → backend/frontend agents + Context7
- `"build UI"` → frontend agent + Magic MCP
- `"create API"` → backend agent + Sequential
- `"optimize"` → performance agent + Playwright

#### 분석 작업
- `"analyze"` → analyzer agent + Sequential (--think)
- `"debug"` → debugger + error-detective agents
- `"troubleshoot"` → analyzer + Sequential (--think-hard)
- `"root cause"` → analyzer + Sequential (--ultrathink)

#### 품질 작업
- `"test"` → qa + test-automator agents + Playwright
- `"review"` → code-reviewer + architect-review
- `"refactor"` → refactorer agent + Sequential
- `"security"` → security-auditor + api-security-audit

#### 문서화
- `"document"` → scribe agent + Context7
- `"API docs"` → api-documenter + scribe
- `"README"` → scribe + mentor agents

### Complexity-Based Routing
작업 복잡도에 따른 자동 최적화:

| 복잡도 | 조건 | 자동 활성화 |
|--------|------|-------------|
| **Simple** | < 3 steps, 단일 파일 | 기본 도구만 사용 |
| **Moderate** | 3-10 steps, < 10 파일 | 페르소나 + MCP 서버 |
| **Complex** | > 10 steps, > 20 파일 | Wave 모드 + 병렬 처리 |
| **Enterprise** | > 50 파일, 다중 도메인 | 전체 오케스트레이션 |

### Keyword Triggers
키워드 기반 자동 활성화:

```yaml
performance_keywords:
  triggers: [optimize, slow, bottleneck, performance]
  activates: performance agent + Playwright
  flags: --think --focus performance

security_keywords:
  triggers: [vulnerability, security, auth, encrypt]
  activates: security-auditor + Sequential
  flags: --ultrathink --validate

ui_keywords:
  triggers: [component, button, form, responsive]
  activates: frontend agent + Magic MCP
  flags: --magic --c7

data_keywords:
  triggers: [database, query, migration, schema]
  activates: database-optimizer + backend
  flags: --seq --think
```

### Pattern-Based Activation
코드 패턴 감지 자동 활성화:

- **Import 감지**: `import React` → React 전문 에이전트
- **Framework 감지**: `package.json` 분석 → 적절한 프레임워크 에이전트
- **언어 감지**: 파일 확장자 → 언어별 전문 에이전트
- **테스트 파일**: `*.test.*` → QA 에이전트 자동 활성화

## Intelligent Routing
작업 복잡도와 도메인에 따라 자동으로 최적 경로 선택:
- **Simple** (< 3 steps): 기본 도구만 사용
- **Moderate** (3-10 steps): 페르소나 + MCP 서버 활성화
- **Complex** (> 10 steps): Wave 오케스트레이션 + 병렬 처리

## 🚀 Usage Examples

### 새 기능 구현
```bash
# 자동: backend + security agents, Sequential + Context7
/implement "사용자 인증 시스템 with JWT"

# 결과: JWT 기반 인증 시스템 자동 구현
# - backend-developer: API 엔드포인트 생성
# - security-auditor: 보안 검증
# - Sequential: 로직 분석
# - Context7: JWT 라이브러리 문서 참조
```

### UI 컴포넌트 생성
```bash
# 자동: frontend agent + Magic MCP
/build "대시보드 with 차트 컴포넌트"

# 결과: 반응형 대시보드 자동 생성
# - frontend-developer: React 컴포넌트 생성
# - Magic: 차트 라이브러리 통합
# - ui-ux-designer: 접근성 검증
```

### 성능 최적화
```bash
# 자동: performance agent + Playwright
/improve --focus performance

# 결과: 성능 병목 현상 자동 해결
# - performance-engineer: 프로파일링
# - performance-benchmarker: 벤치마크
# - Playwright: 실제 브라우저 테스트
```

### 보안 감사
```bash
# 자동: security agents + Sequential
/analyze --focus security --ultrathink

# 결과: 포괄적 보안 분석
# - security-auditor: 취약점 스캔
# - api-security-audit: API 보안 검사
# - Sequential: 위협 모델링
```

### 대규모 리팩토링
```bash
# 자동: Wave 오케스트레이션
/improve "전체 코드베이스" --wave-mode

# 결과: 다단계 개선 프로세스
# Wave 1: 분석 (analyzer agents)
# Wave 2: 계획 (architect agents)
# Wave 3: 실행 (developer agents)
# Wave 4: 검증 (qa agents)
```

## Performance Thresholds
- **Green** (0-60%): 모든 기능 활성화
- **Yellow** (60-75%): 자동 최적화 모드
- **Orange** (75-85%): 경고 및 --uc 모드 제안
- **Red** (85-95%): 필수 작업만 수행
- **Critical** (95%+): 긴급 프로토콜 활성화

## 💡 Pro Tips

### 효율적인 작업 방법
1. **자동 감지 활용**: 명시적 플래그 없이도 대부분 자동 최적화
2. **한글 명령어 지원**: `/분석`, `/구현`, `/개선` 등 한글 사용 가능
3. **병렬 처리**: 대규모 작업은 자동으로 병렬 처리
4. **컨텍스트 유지**: 세션 간 90% 이상 작업 컨텍스트 자동 보존

### 성능 최적화 팁
- **토큰 절약**: 컨텍스트 75% 초과 시 자동으로 --uc 모드
- **Wave 활용**: 복잡한 작업은 자동으로 Wave 모드로 처리
- **캐싱**: MCP 서버 결과 자동 캐싱으로 속도 향상

### 품질 보증
- **8단계 검증**: 모든 작업은 자동으로 품질 게이트 통과
- **증거 기반**: 모든 결정은 측정 가능한 데이터 기반
- **자동 테스트**: 코드 변경 시 관련 테스트 자동 실행
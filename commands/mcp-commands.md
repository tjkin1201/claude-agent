# MCP 기반 슬래시 명령어 가이드

## 🎯 새로 추가된 MCP 연동 명령어들

### `/img-extract` - 이미지 분석 및 메타데이터 추출
```bash
# 기본 사용법
/img-extract photo.jpg

# 상세 분석 with JSON 출력  
/img-extract photo.jpg --format json --detailed

# 결과를 파일로 저장
/img-extract *.png --save analysis.txt
```

**연동 MCP 서버**: `image-extractor`

### `/parallel-work` - 병렬 작업 및 협업 코딩
```bash
# 여러 파일 동시 편집
/parallel-work edit src/*.js --workers 3

# 병렬 프로세스 모니터링
/parallel-work monitor --mode async

# 협업 세션 시작
/parallel-work collaborate project/ --monitor
```

**연동 MCP 서버**: `desktop-commander`

## 🔗 MCP 서버 연동 정보

### 자동 활성화되는 MCP 서버들
1. **image-extractor**: `/img-extract` 명령어 사용 시 자동 활성화
2. **desktop-commander**: `/parallel-work` 명령어 사용 시 자동 활성화
3. **filesystem**: 파일 작업 시 자동 활용
4. **memory-claude**: 세션 정보 관리
5. **sequential-thinking**: 복잡한 분석 작업 시 활용
6. **text-editor**: 텍스트 편집 작업 지원
7. **playwright**: 웹 작업 시 활용

## 🚀 사용법

### 직접 명령어 실행
```bash
# Claude Code에서 직접 사용
/img-extract my-image.jpg --detailed
/parallel-work edit src/ --workers 4
```

### SuperClaude 프레임워크와 함께
```bash
# 플래그와 함께 사용
/img-extract photo.jpg --seq --detailed
/parallel-work collaborate . --play --monitor
```

## 📊 성능 및 기능

### `/img-extract` 기능
- 🖼️ 이미지 메타데이터 추출
- 📊 EXIF 데이터 분석  
- 📏 크기 및 해상도 정보
- 🎨 색상 프로필 분석

### `/parallel-work` 기능
- 🔄 병렬 파일 처리
- 👥 협업 코딩 지원
- 📊 실시간 모니터링
- 🖥️ 다중 터미널 세션
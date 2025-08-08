---
allowed-tools: [Read, Write, Edit, Bash, Glob]
description: "이미지 메타데이터 추출 및 분석 도구"
---

# /img-extract - 이미지 추출 및 분석

## Purpose
이미지 파일에서 메타데이터를 추출하고 분석하는 명령어입니다. image-extractor MCP 서버를 활용합니다.

## Usage
```
/img-extract [image-path|image-url] [--ui-analysis] [--generate-code] [--format json|yaml|text] [--detailed] [--save output.txt] [--download]
```

## Arguments
- `image-path` - 분석할 로컬 이미지 파일 경로
- `image-url` - 분석할 웹 이미지 URL (http/https)
- `--ui-analysis` - UI/UX 디자인 분석 모드 🎨
- `--generate-code` - 분석 결과로 UI 컴포넌트 코드 생성 ⚡
- `--format` - 출력 형식 (json, yaml, text)
- `--detailed` - 상세 분석 모드
- `--save` - 결과를 파일로 저장
- `--download` - URL 이미지를 로컬에 저장

## Execution
1. **입력 타입 감지** (로컬 파일 vs URL)
2. **URL인 경우**: Playwright MCP로 이미지 다운로드
3. **로컬 파일 확인** 및 접근 권한 검증
4. **image-extractor MCP**를 통한 메타데이터 추출
5. **EXIF 데이터** 및 기술적 정보 분석
6. **Sequential thinking**으로 종합 분석 (--seq 플래그 시)
7. **지정된 형식**으로 결과 출력
8. **선택적 저장** (--save, --download 플래그)

## MCP Integration
- **Primary Server**: image-extractor (메타데이터 추출)
- **UI Server**: magic (UI 컴포넌트 생성) 🎨
- **Web Server**: playwright (URL 이미지 다운로드, 스크린샷)
- **Analysis Server**: sequential-thinking (--seq 플래그 시)
- **Storage Server**: filesystem (파일 접근 및 저장)
- **Tools**: Read, Write, Bash (다운로드), WebFetch (URL 처리)

## Examples

### 🎨 UI/UX 디자인 분석
```bash
# UI 디자인 분석
/img-extract design-mockup.png --ui-analysis

# 웹사이트 스크린샷 → UI 분석 → 컴포넌트 생성
/img-extract https://dribbble.com/shots/example.jpg --ui-analysis --generate-code

# 모바일 UI 분석
/img-extract mobile-design.jpg --ui-analysis --seq --detailed

# 디자인 시스템 추출
/img-extract design-system.png --ui-analysis --format json --save design-tokens.json
```

### 📱 실용적 UI/UX 워크플로우
```bash
# Figma/Sketch 이미지 → React 컴포넌트
/img-extract figma-component.png --ui-analysis --generate-code --save Component.jsx

# 웹사이트 분석 → 디자인 시스템 추출
/img-extract https://apple.com --ui-analysis --detailed --save apple-design-analysis.json

# UI 컴포넌트 리버스 엔지니어링
/img-extract button-design.png --ui-analysis --generate-code --format tsx
```

### 🔄 기존 기능들
```bash
# 기본 메타데이터 분석
/img-extract photo.jpg --detailed --seq

# 웹 이미지 종합 분석
/img-extract https://example.com/image.jpg --download --save analysis.json
```

## Features

### 🎨 UI/UX 디자인 특화 기능
- **디자인 시스템 추출**: 색상, 타이포그래피, 간격 분석
- **UI 컴포넌트 인식**: 버튼, 카드, 폼 등 UI 요소 식별
- **레이아웃 분석**: 그리드, 플렉스, 반응형 구조 파악
- **Magic MCP 연동**: 실제 React/Vue 컴포넌트 코드 생성
- **접근성 분석**: 색상 대비, 텍스트 크기 등 접근성 요소 검토

### 🔧 기본 이미지 분석 기능
- 🖼️ **로컬 & 웹 이미지** 분석 지원
- 🌐 **URL 이미지 다운로드** 및 처리
- 📊 **EXIF 데이터** 추출 및 분석
- 📏 **이미지 크기 및 해상도** 정보
- 🎨 **색상 프로필** 분석
- 🧠 **Sequential thinking** 종합 분석
- 💾 **결과 저장** 및 다운로드 기능
- ⚡ **Playwright MCP** 웹 처리

## UI/UX 분석 결과 예시
```json
{
  "design_system": {
    "colors": {
      "primary": "#007AFF",
      "secondary": "#FF3B30", 
      "background": "#F2F2F7",
      "text": "#1C1C1E"
    },
    "typography": {
      "heading": "SF Pro Display, Bold, 24px",
      "body": "SF Pro Text, Regular, 16px",
      "caption": "SF Pro Text, Regular, 12px"
    },
    "spacing": {
      "xs": "4px", "sm": "8px", "md": "16px", "lg": "24px"
    }
  },
  "components": [
    {
      "type": "button",
      "style": "primary",
      "dimensions": "120x44px",
      "border_radius": "8px"
    }
  ],
  "layout": {
    "type": "flex",
    "direction": "column",
    "gap": "16px",
    "responsive": true
  }
}
```
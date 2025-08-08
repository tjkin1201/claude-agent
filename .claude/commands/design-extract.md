---
allowed-tools: [Read, Write, Edit, Bash, Glob, WebFetch]
description: "이미지에서 디자인 시스템 및 디자인 토큰 추출"
---

# /design-extract - 디자인 시스템 추출

## Purpose
디자인 이미지에서 색상, 타이포그래피, 간격 등 디자인 시스템 요소를 추출하여 디자인 토큰을 생성합니다.

## Usage
```
/design-extract [image-path|image-url] [--format css|json|scss|figma] [--tokens design-tokens.json] [--theme light|dark|auto]
```

## Arguments
- `image-path|image-url` - 분석할 디자인 이미지
- `--format` - 출력 형식 (css-variables, json, scss, figma-tokens)
- `--tokens` - 디자인 토큰 파일 생성
- `--theme` - 테마 모드 (light, dark, auto-detect)
- `--palette` - 색상 팔레트만 추출
- `--typography` - 타이포그래피만 추출
- `--spacing` - 간격 시스템만 추출

## Execution
1. **이미지 색상 분석**: 주요 색상 팔레트 추출
2. **타이포그래피 감지**: 폰트 크기, 굵기, 행간 분석
3. **간격 시스템 추출**: 마진, 패딩, 그리드 간격 분석
4. **그림자 & 테두리**: 시각적 효과 패턴 추출
5. **토큰 생성**: 디자인 시스템 포맷으로 변환

## Examples

### 🎨 전체 디자인 시스템 추출
```bash
# 전체 디자인 시스템 추출
/design-extract app-design.png --format json --tokens design-system.json

# CSS 변수로 추출
/design-extract ui-components.jpg --format css --tokens variables.css

# SCSS 변수로 추출
/design-extract design-system.png --format scss --tokens _variables.scss
```

### 🔍 특정 요소만 추출
```bash
# 색상 팔레트만 추출
/design-extract branding.png --palette --format json

# 타이포그래피 시스템만 추출
/design-extract typography.png --typography --format css

# 간격 시스템만 추출
/design-extract layout.png --spacing --format scss
```

### 🌙 테마별 추출
```bash
# 다크 테마 디자인 분석
/design-extract dark-mode.png --theme dark --format json

# 라이트/다크 자동 감지
/design-extract app-ui.png --theme auto --format css
```

## Generated Output Examples

### CSS Variables
```css
:root {
  /* Colors */
  --color-primary: #007AFF;
  --color-secondary: #FF3B30;
  --color-background: #F2F2F7;
  --color-surface: #FFFFFF;
  --color-text-primary: #1C1C1E;
  --color-text-secondary: #8E8E93;
  
  /* Typography */
  --font-family-heading: 'SF Pro Display', system-ui, sans-serif;
  --font-family-body: 'SF Pro Text', system-ui, sans-serif;
  --font-size-xs: 0.75rem;  /* 12px */
  --font-size-sm: 0.875rem; /* 14px */
  --font-size-base: 1rem;   /* 16px */
  --font-size-lg: 1.125rem; /* 18px */
  --font-size-xl: 1.25rem;  /* 20px */
  
  /* Spacing */
  --spacing-xs: 0.25rem;  /* 4px */
  --spacing-sm: 0.5rem;   /* 8px */
  --spacing-md: 1rem;     /* 16px */
  --spacing-lg: 1.5rem;   /* 24px */
  --spacing-xl: 2rem;     /* 32px */
  
  /* Border Radius */
  --radius-sm: 0.25rem;   /* 4px */
  --radius-md: 0.5rem;    /* 8px */
  --radius-lg: 1rem;      /* 16px */
  
  /* Shadows */
  --shadow-sm: 0 1px 2px 0 rgb(0 0 0 / 0.05);
  --shadow-md: 0 4px 6px -1px rgb(0 0 0 / 0.1);
  --shadow-lg: 0 10px 15px -3px rgb(0 0 0 / 0.1);
}
```

### JSON Design Tokens
```json
{
  "color": {
    "primary": {
      "50": "#EBF8FF",
      "500": "#007AFF", 
      "900": "#003D80"
    },
    "gray": {
      "50": "#F9FAFB",
      "500": "#8E8E93",
      "900": "#1C1C1E"
    }
  },
  "typography": {
    "fontFamily": {
      "heading": ["SF Pro Display", "system-ui", "sans-serif"],
      "body": ["SF Pro Text", "system-ui", "sans-serif"]
    },
    "fontSize": {
      "xs": "0.75rem",
      "sm": "0.875rem", 
      "base": "1rem",
      "lg": "1.125rem"
    },
    "fontWeight": {
      "normal": "400",
      "medium": "500",
      "semibold": "600",
      "bold": "700"
    }
  },
  "spacing": {
    "xs": "0.25rem",
    "sm": "0.5rem",
    "md": "1rem", 
    "lg": "1.5rem",
    "xl": "2rem"
  }
}
```

## Features
- 🎨 **지능형 색상 추출**: AI 기반 색상 팔레트 생성
- 📝 **타이포그래피 분석**: 폰트 계층 구조 파악
- 📏 **간격 시스템**: 일관된 spacing scale 추출
- 🌙 **테마 지원**: 라이트/다크 모드 자동 감지
- 📦 **다양한 형식**: CSS, JSON, SCSS, Figma 토큰 지원
- ♿ **접근성 검증**: 색상 대비 비율 검사
- 🔄 **업데이트 지원**: 기존 토큰 파일 업데이트

## Integration Benefits
- **Figma → Code**: 디자인 파일을 개발용 토큰으로 변환
- **브랜드 일관성**: 브랜딩 가이드라인을 코드로 자동 변환
- **디자인 시스템**: 체계적인 디자인 시스템 구축
- **개발 효율성**: 디자이너-개발자 간 원활한 협업
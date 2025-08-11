---
allowed-tools: [Read, Write, Edit, Bash, Glob, WebFetch]
description: "이미지 분석을 통한 UI/UX 컴포넌트 자동 생성"
---

# /ui-generate - 이미지 → UI 컴포넌트 생성

## Purpose
디자인 이미지를 분석하여 실제 사용 가능한 UI 컴포넌트 코드를 자동 생성하는 명령어입니다.

## Usage
```
/ui-generate [image-path|image-url] [--framework react|vue|angular] [--style tailwind|css|styled] [--output component.jsx]
```

## Arguments
- `image-path|image-url` - 분석할 디자인 이미지 (로컬 파일 또는 URL)
- `--framework` - 타겟 프레임워크 (react, vue, angular, html)
- `--style` - 스타일링 방식 (tailwind, css-modules, styled-components, vanilla-css)
- `--output` - 생성될 컴포넌트 파일명
- `--responsive` - 반응형 디자인 적용
- `--accessibility` - 접근성 기능 추가

## Execution Workflow
1. **이미지 분석**: image-extractor MCP로 기본 정보 추출
2. **UI 요소 인식**: Sequential thinking으로 UI 컴포넌트 식별
3. **디자인 시스템 추출**: 색상, 타이포그래피, 간격 분석
4. **컴포넌트 생성**: Magic MCP로 실제 코드 생성
5. **파일 저장**: filesystem MCP로 컴포넌트 파일 생성

## MCP Integration
- **Analysis**: image-extractor + sequential-thinking
- **UI Generation**: magic (UI 컴포넌트 생성)
- **Web Processing**: playwright (URL 이미지 처리)
- **File Management**: filesystem (코드 파일 저장)

## Examples

### 🎨 디자인 → 컴포넌트 생성
```bash
# Figma 디자인 → React 컴포넌트
/ui-generate button-design.png --framework react --style tailwind --output Button.jsx

# 웹사이트 스크린샷 → Vue 컴포넌트
/ui-generate https://dribbble.com/card-design.jpg --framework vue --style css --responsive

# 모바일 UI → React Native 컴포넌트
/ui-generate mobile-card.png --framework react --style styled --accessibility
```

### 📱 실용적 워크플로우
```bash
# 전체 페이지 분석 및 컴포넌트 생성
/ui-generate landing-page.png --framework react --style tailwind --output src/components/

# 디자인 시스템 기반 컴포넌트 라이브러리 생성
/ui-generate design-system.png --framework react --style css --output components/

# 반응형 카드 컴포넌트 생성
/ui-generate card-design.jpg --framework vue --responsive --accessibility --output Card.vue
```

## Generated Code Example
```jsx
// 생성된 React 컴포넌트 예시
import React from 'react';

const Button = ({ children, variant = 'primary', size = 'md', ...props }) => {
  const baseClasses = 'inline-flex items-center justify-center font-medium rounded-lg transition-colors';
  
  const variants = {
    primary: 'bg-blue-600 text-white hover:bg-blue-700',
    secondary: 'bg-gray-200 text-gray-900 hover:bg-gray-300'
  };
  
  const sizes = {
    sm: 'px-3 py-2 text-sm',
    md: 'px-4 py-2.5 text-base',
    lg: 'px-6 py-3 text-lg'
  };

  return (
    <button 
      className={`${baseClasses} ${variants[variant]} ${sizes[size]}`}
      {...props}
    >
      {children}
    </button>
  );
};

export default Button;
```

## Features
- 🎨 **디자인 이미지 인식**: UI 요소 자동 감지
- ⚡ **실시간 코드 생성**: Magic MCP 활용
- 🎯 **프레임워크 지원**: React, Vue, Angular 등
- 📱 **반응형 디자인**: 모바일 최적화
- ♿ **접근성 기능**: WCAG 가이드라인 준수
- 🎨 **스타일링 옵션**: Tailwind, CSS Modules, Styled Components
- 💾 **파일 자동 생성**: 컴포넌트 파일 즉시 생성

## Design Analysis Capabilities
- **색상 팔레트** 추출 및 CSS 변수 생성
- **타이포그래피** 스타일 분석 및 적용
- **간격/여백** 시스템 추출
- **그림자/테두리** 효과 재현
- **애니메이션** 힌트 감지
- **상호작용** 요소 식별
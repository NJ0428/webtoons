# 웹툰 애플리케이션

Ruby on Rails로 구축된 웹툰 플랫폼입니다. 요일별 웹툰 목록과 상세 정보를 제공합니다.

## 🚀 주요 기능

- 웹툰 목록 조회
- 요일별 웹툰 분류
- 웹툰 상세 정보 보기
- 반응형 웹 디자인 (Tailwind CSS)
- 모던 JavaScript (Hotwire Turbo & Stimulus)

## 📋 시스템 요구사항

- **Ruby**: 3.3.0
- **Rails**: 8.0.2
- **Node.js**: 18.0+ (Tailwind CSS 빌드용)
- **SQLite3**: 2.1+

## 🛠️ 설치 및 설정

### 1. 저장소 클론

```bash
git clone <repository-url>
cd webtoon
```

### 2. Ruby 의존성 설치

```bash
bundle install
```

### 3. Node.js 의존성 설치

```bash
npm install
```

### 4. 데이터베이스 설정

```bash
# 데이터베이스 생성
rails db:create

# 마이그레이션 실행
rails db:migrate

# 시드 데이터 로드 (선택사항)
rails db:seed
```

### 5. Tailwind CSS 빌드

```bash
# 한 번만 빌드
npm run build:css

# 개발 중 자동 빌드 (별도 터미널에서 실행)
npm run watch:css
```

## 🚀 애플리케이션 실행

### 개발 서버 시작

```bash
rails server
```

애플리케이션이 `http://localhost:3000`에서 실행됩니다.

### 개발 환경에서 CSS 자동 빌드

별도 터미널에서 실행:

```bash
npm run watch:css
```

## 📁 프로젝트 구조

```
webtoon/
├── app/
│   ├── controllers/     # 컨트롤러
│   ├── models/         # 모델
│   ├── views/          # 뷰 템플릿
│   └── assets/         # CSS, JavaScript 파일
├── config/             # 설정 파일
├── db/                 # 데이터베이스 관련
└── public/             # 정적 파일
```

## 🛣️ 주요 라우트

- `/` - 메인 페이지 (웹툰 목록)
- `/webtoon` - 웹툰 페이지
- `/webtoon/list` - 웹툰 목록
- `/webtoon/detail` - 웹툰 상세
- `/api/webtoons/by_day/:day` - 요일별 웹툰 API

## 🧪 테스트 실행

```bash
# 전체 테스트 실행
rails test

# 시스템 테스트 실행
rails test:system
```

## 🔧 개발 도구

- **Rubocop**: 코드 스타일 검사

  ```bash
  bundle exec rubocop
  ```

- **Brakeman**: 보안 취약점 검사
  ```bash
  bundle exec brakeman
  ```

## 🚢 배포

이 애플리케이션은 Kamal을 사용한 Docker 배포를 지원합니다.

```bash
# 배포 설정 확인
kamal config

# 배포 실행
kamal deploy
```

## 🛠️ 사용된 주요 기술

- **Backend**: Ruby on Rails 8.0.2
- **Database**: SQLite3
- **Frontend**: Hotwire (Turbo + Stimulus)
- **Styling**: Tailwind CSS 4.1.11
- **Build Tools**: PostCSS, Autoprefixer
- **Deployment**: Kamal, Docker
- **Cache**: Solid Cache
- **Job Queue**: Solid Queue
- **WebSocket**: Solid Cable

## 📝 개발 참고사항

1. CSS 변경 시 `npm run watch:css`가 실행 중인지 확인하세요
2. 새로운 마이그레이션 후에는 `rails db:migrate`를 실행하세요
3. 시드 데이터 변경 후에는 `rails db:seed`를 실행하세요

## 🤝 기여하기

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 라이선스

이 프로젝트는 MIT 라이선스 하에 배포됩니다.

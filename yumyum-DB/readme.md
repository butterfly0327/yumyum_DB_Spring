# 냠냠코치

YumYumCoach는 건강한 식습관과 운동 루틴을 유지할 수 있도록 돕는 통합 헬스케어 웹 애플리케이션입니다. 기존 Node.js + Express 기반 프로젝트를 **Spring MVC (Jakarta Servlet + JSP)** 구조로 이관하여 Java 17과 Maven을 사용하는 서버 사이드 렌더링 애플리케이션으로 재구성했습니다. 클라이언트 UI는 기존 디자인을 유지하면서도, 백엔드는 **관계형 데이터베이스와 연동된 DAO 계층**과 REST API를 통해 데이터를 안전하게 관리합니다.

## 📋 목차
1. [프로젝트 소개](#-프로젝트-소개)
2. [핵심 기능](#-핵심-기능)
3. [시스템 구성](#-시스템-구성)
4. [기술 스택](#-기술-스택)
5. [시작하기](#-시작하기)
6. [환경 설정](#-환경-설정)
7. [프로젝트 구조](#-프로젝트-구조)
8. [주요 라우팅](#-주요-라우팅)
9. [API 개요](#-api-개요)
10. [데이터 저장소](#-데이터-저장소)
11. [화면 구성](#-화면-구성)
12. [라이선스 및 문의](#-라이선스-및-문의)

## 🎯 프로젝트 소개
* 건강 목표 달성을 위한 식단, 운동, 커뮤니티 기능을 하나의 애플리케이션에서 제공
* AI 코치를 통해 Gemini 모델과의 대화를 기반으로 개인화된 조언을 제공
* 챌린지, 팔로우 등 소셜 기능으로 지속적인 동기 부여와 사용자 간 상호 작용 지원

## ✨ 핵심 기능
- **식단 관리**: 식단 유형(아침/점심/저녁/간식)별 기록, 칼로리 자동 합산, 일간 통계 제공
- **운동 기록**: 운동별 소모 칼로리를 저장하고 AI 예측과 연동하여 관리
- **AI 코치**: Gemini API를 활용한 자연어 상담, 추천 질문, 기록 반영 기능 지원
- **챌린지**: 진행 중/추천/완료 챌린지 구분과 진행률 추적으로 목표 달성 관리
- **커뮤니티**: 게시글, 댓글, 좋아요, 팔로우 기능을 포함한 소셜 네트워킹 공간
- **분석 대시보드**: 영양소 섭취 비율, 추세 그래프 등을 통해 종합적인 건강 지표 제공

## 🧱 시스템 구성
- **Presentation Layer**: Jakarta Servlet과 JSP를 활용한 서버 사이드 렌더링, JSTL을 통한 템플릿 구성
- **Service Layer**: `model.service` 패키지에서 비즈니스 로직 처리, 의존성 주입을 통한 계층 간 결합도 최소화
- **Data Layer**: JDBC 기반 DAO(`model.dao`)가 데이터베이스와 직접 통신하며 커넥션 풀을 통해 효율적으로 CRUD를 수행
- **REST API**: `controller/api` 서블릿에서 인증, 식단, 운동 등 도메인별 RESTful 엔드포인트 제공
- **Front-end Assets**: `resources/js`와 `resources/css`에 페이지별 스크립트와 스타일 정의

## 🛠 기술 스택
| 구분 | 기술 |
| --- | --- |
| Language | Java 17, JavaScript (ES6) |
| Framework & Library | Jakarta Servlet 5, JSP/JSTL, Bootstrap 5 |
| Build & Deployment | Maven, WAR 패키징, Tomcat 10+ / Jakarta EE 10 컨테이너 |
| AI Integration | Google Generative AI (Gemini) |
| Data Storage | 관계형 데이터베이스(MySQL, MariaDB 등) + 세션 기반 인증 |

## 🚀 시작하기
### 1. 저장소 클론
```bash
git clone https://github.com/your-username/yumyum-DB.git
cd yumyum-DB
```

### 2. 의존성 설치 및 빌드
Java 17과 Maven이 설치되어 있어야 합니다.
```bash
mvn clean package
```
빌드가 완료되면 `target/yumyumcoach.war` 산출물이 생성됩니다.

### 3. 데이터베이스 준비
프로덕션과 개발 환경 모두에서 데이터베이스 스키마를 먼저 구성해야 합니다. 저장소에 포함된 `sql.txt`를 참고하여 DB를 생성하고 초기 데이터를 삽입합니다.

```sql
-- 예시: MySQL/MariaDB
CREATE DATABASE yumyumcoach CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE yumyumcoach;
-- 이하 테이블 및 시드 데이터는 sql.txt 참고
```

### 4. 애플리케이션 배포
1. Tomcat 10.1+ 또는 Jakarta EE 10 호환 서블릿 컨테이너에 WAR 파일을 배포합니다.
2. 컨텍스트 루트를 `/`로 설정하면 [http://localhost:8080](http://localhost:8080)에서 서비스를 확인할 수 있습니다.

> 개발 단계에서는 IDE의 Tomcat 런 구성을 활용하거나 `cargo run`과 같은 플러그인을 사용할 수 있습니다.

## ⚙️ 환경 설정
- **Gemini API 키**: 클라이언트 측에서 호출하는 AI 기능을 위해 아래 파일의 `GEMINI_API_KEY`를 발급받은 키로 변경합니다.
  - `src/main/webapp/resources/js/ai-coach.js`
  - `src/main/webapp/resources/js/exercise.js`
- **데이터베이스 연결**: `src/main/webapp/WEB-INF/web.xml` 또는 컨테이너의 JNDI 리소스 설정에서 DB URL, 사용자, 비밀번호를 환경에 맞게 수정합니다. 개발 환경에서는 `.env`나 시스템 속성으로 드라이버 클래스를 주입할 수 있습니다.
- **세션 설정**: 로그인 기반 API는 `HttpSession` 인증을 사용하므로, 컨테이너 세션 타임아웃 정책을 프로젝트 요구사항에 맞게 조정할 수 있습니다.

## 📁 프로젝트 구조
```text
yumyum-DB/
├── pom.xml                         # Maven 설정 및 의존성 관리
├── sql.txt                         # 데이터베이스 전환 시 참고용 SQL 스크립트
├── src/
│   └── main/
│       ├── java/com/yumyumcoach/
│       │   ├── config/             # DataSource 및 공용 설정 클래스
│       │   ├── listener/           # 컨텍스트 초기화 리스너
│       │   ├── controller/
│       │   │   ├── MainController.java  # JSP 라우팅 서블릿
│       │   │   └── api/                 # REST API 서블릿 모음
│       │   └── model/
│       │       ├── dao/            # DAO 인터페이스 및 RDBMS 구현체
│       │       ├── dto/            # 도메인 DTO 클래스
│       │       └── service/        # 서비스 계층 및 비즈니스 로직
│       └── webapp/
│           ├── index.jsp           # 엔트리 포인트 (Landing 리다이렉션)
│           ├── WEB-INF/
│           │   ├── web.xml         # 서블릿 배포 서술자
│           │   ├── views/          # JSP 뷰 (landing, diet, challenge, ...)
│           │   └── data/           # (선택) 마이그레이션 시 참고용 JSON/SQL 자료
│           └── resources/
│               ├── css/            # 공통 스타일 시트
│               └── js/             # 페이지별 프론트엔드 스크립트
└── start_page/                     # 정적 소개 페이지 (빌드 대상 아님)
    ├── README.md
    └── index.html
```

## 📡 주요 라우팅
| 메뉴 | 경로 | 설명 |
| --- | --- | --- |
| 홈 | `/main?action=landing` | 랜딩 페이지 |
| 식단 | `/main?action=diet` | 식단 관리 뷰 |
| 챌린지 | `/main?action=challenge` | 챌린지 현황 |
| 게시판 | `/main?action=community` | 커뮤니티 게시판 |
| AI 코치 | `/main?action=aiCoach` | AI 코치 대화 |
| 분석 | `/main?action=analysis` | 식단/운동 분석 |
| 운동 | `/main?action=exercise` | 운동 기록 관리 |

## 🧾 API 개요
| 엔드포인트 | 메서드 | 기능 |
| --- | --- | --- |
| `/api/auth/login` | POST | 로그인 및 세션 발급 |
| `/api/auth/logout` | POST | 로그아웃 |
| `/api/account` | PUT / DELETE | 계정 정보 수정 및 탈퇴 |
| `/api/profile` | GET / PUT | 프로필 조회 및 수정 |
| `/api/diet` | GET / POST / PUT / DELETE | 식단 CRUD |
| `/api/exercise` | GET / POST / PUT / DELETE | 운동 기록 CRUD |
| `/api/challenge` | GET / POST | 챌린지 참여/갱신 |
| `/api/community` | GET / POST / PUT / DELETE | 게시글 및 댓글 관리 |
| `/api/follow` | POST / DELETE | 팔로우/언팔로우 |

모든 API는 `application/json` 형식을 사용하며, 인증이 필요한 요청은 세션 기반 인증을 통과해야 합니다.

## 💾 데이터 저장소
- MySQL 또는 MariaDB와 같은 관계형 데이터베이스를 단일 진실 소스로 사용하여 다중 사용자 환경에서도 일관성과 동시성을 확보
- DAO 계층이 커넥션 풀을 통해 트랜잭션을 관리하고, 서비스 레이어는 필요한 비즈니스 로직만 처리하여 책임을 분리
- `sql.txt` 파일에 스키마 정의 및 초기 데이터 스크립트가 제공되며, 운영 환경에서는 Flyway/Liquibase와 같은 마이그레이션 도구로 대체할 수 있습니다.

## 화면 구성

### 공통 레이아웃
- 상단 네비게이션: 로고, 주요 메뉴(식단/운동/챌린지/커뮤니티/AI 코치), 프로필/로그인 영역
- 메인 컨테이너: 페이지별 콘텐츠 영역
- 하단 푸터: 저작권 및 관련 링크

### 0) 시작페이지 (`start.jsp`)
-웹페이지 진입 시 가장 처음 보게 될 페이지
-웹의 소개를 해줌
![start1](https://lab.ssafy.com/-/project/1139190/uploads/a8ffcc4215f976049595c5424b8ef26b/%EC%8B%9C%EC%9E%91-1.jpg)
![start2](https://lab.ssafy.com/-/project/1139190/uploads/b07264b522a87818c633b8eaa89299c1/%EC%8B%9C%EC%9E%91-2.jpg)
![start3](https://lab.ssafy.com/-/project/1139190/uploads/d45fc1a576817f12d6b1a444d90a23ee/%EC%8B%9C%EC%9E%91-3.jpg)
![start4](https://lab.ssafy.com/-/project/1139190/uploads/2c224ccaabd8af55040574a6ffa2e31d/%EC%8B%9C%EC%9E%91-4.jpg)

### 1) 로그인 (`login.jsp`)
-로그인 페이지
![login](https://lab.ssafy.com/-/project/1139190/uploads/868333d9868bc610f258f06136f36555/%EB%A1%9C%EA%B7%B8%EC%9D%B8.jpg)


### 1) 회원가입 (`register.jsp`)
-회원가입 페이지
![regi](https://lab.ssafy.com/-/project/1139190/uploads/ac8450e6bffca2f651b557c54a5b83c7/%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85.jpg)


### 2) 홈 (`landing.jsp`)
- 오늘의 요약 (칼로리, 최근 운동/식단 스냅샷)
- 빠른 진입 카드 (식단/운동/챌린지)
![home](https://lab.ssafy.com/-/project/1139190/uploads/feca689aa82536818f2db760c1acf8a8/%ED%99%88.jpg)

### 2) 식단 관리 (`diet.jsp`)
- 날짜 선택 + 식단 유형 탭(아침/점심/저녁/간식)
- 기록 리스트 + 합계 패널
- 입력 폼 (음식명, 양, kcal)
![diet](https://lab.ssafy.com/-/project/1139190/uploads/c628ae6983eafdf394f379df9c48bff2/%EC%8B%9D%EB%8B%A8%EA%B4%80%E3%84%B9.jpg)

### 3) 챌린지 (`challenge.jsp`)
- 진행중/추천/완료 탭
- 챌린지 카드 (목표, 기간, 참여)
- 진행률 바 + 내 현황 위젯
![challenge](https://lab.ssafy.com/-/project/1139190/uploads/37c5cf9e5a837d41623569965405e80c/%EC%B2%BC%EB%A6%B0%EC%A7%80.jpg)

### 4) 게시판 (`community.jsp`)
- 게시글 목록 (제목, 작성자, 댓글/좋아요 수)
- 상세 보기 (본문, 댓글, 좋아요)
![community](https://lab.ssafy.com/-/project/1139190/uploads/85bf696ba1c40f2fb9261972e7157a06/%EA%B2%8C%EC%8B%9C%ED%8C%90.jpg)

### 5) AI 코치 (`ai-coach.jsp`)
- 대화 뷰 (사용자/AI 버블)
- 입력 영역 + 추천 질문 버튼
- 답변 → 기록 반영 / 복사 기능
![ai-coach](https://lab.ssafy.com/-/project/1139190/uploads/c87f777343f342efaad622c5db6f6dc3/AI%EC%BD%94%EC%B9%98.jpg)

### 6) 분석(`analysis.jsp`)
- 영양소 섭취 비율
- 일일 영양소 섭취 추이
- 섭취 비율 및 섭취 추이를 통한 식단 분석 결과 제공
![analysis](https://lab.ssafy.com/-/project/1139190/uploads/b6f5858d9279ac2ed8b26cba79dd8112/%EB%B6%84%EC%84%9D1.jpg)
![analysis2](https://lab.ssafy.com/-/project/1139190/uploads/6002b7e8696b0c43099979bec3e48c20/%EB%B6%84%EC%84%9D-2.jpg)

### 7) 운동 기록 (`exercise.jsp`)
- 날짜 선택 + 운동 카테고리 필터
- 운동 기록 카드 + 소모 칼로리
- AI 계산 버튼, 일/주간 차트
![exercise](https://lab.ssafy.com/-/project/1139190/uploads/2ff5658a4e05444898125fc2f9716824/%EC%9A%B4%EB%8F%99_%EC%A7%88%EB%AC%B8.jpg)

## 📄 라이선스 및 문의
- 본 프로젝트의 소스 코드는 학습 및 포트폴리오 목적의 사용을 권장합니다.
- 기능 확장 또는 배포와 관련한 문의는 팀원에게 직접 연락해 주세요.

함께 건강한 생활을 만들어 가요! 🥗💪

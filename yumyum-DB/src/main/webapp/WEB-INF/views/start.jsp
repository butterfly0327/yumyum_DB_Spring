<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>냠냠코치 | 스마트 식단 관리</title>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.css"
    />
    <link rel="stylesheet" href="${root}/resources/start-page/style.css" />
  </head>
  <body>
    <svg xmlns="http://www.w3.org/2000/svg" style="display: none">
      <symbol id="icon-bot" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
        <path d="M12 2v3" />
        <rect x="5" y="7" width="14" height="12" rx="3" />
        <path d="M9 11h.01M15 11h.01" />
        <path d="M9 16h6" />
      </symbol>
      <symbol id="icon-arrow" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
        <path d="M5 12h14" />
        <path d="m13 6 6 6-6 6" />
      </symbol>
      <symbol id="icon-close" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
        <path d="m6 6 12 12" />
        <path d="M18 6 6 18" />
      </symbol>
      <symbol id="icon-star" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
        <path d="m12 3 2.6 5.6 6.2.9-4.5 4.4 1.1 6.3L12 17.7 6.6 20.2 7.7 13.9 3.2 9.5l6.2-.9Z" />
      </symbol>
      <symbol id="icon-sparkles" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
        <path d="M5 3v4M3 5h4M6.5 14l2.5-6 2.5 6 6 2.5-6 2.5-2.5 6-2.5-6L1 16.5Z" />
      </symbol>
      <symbol id="icon-zap" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
        <path d="M13 2 3 14h7l-1 8 10-12h-7Z" />
      </symbol>
      <symbol id="icon-pie" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
        <path d="M21 12a9 9 0 1 1-9-9v9Z" />
        <path d="M12 3a9 9 0 0 1 9 9h-9Z" />
      </symbol>
      <symbol id="icon-bars" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
        <path d="M4 19V9" />
        <path d="M9 19V5" />
        <path d="M14 19v-8" />
        <path d="M19 19V7" />
      </symbol>
      <symbol id="icon-trophy" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
        <path d="M8 21h8" />
        <path d="M12 17v4" />
        <path d="M8 4v3a4 4 0 0 0 4 4 4 4 0 0 0 4-4V4" />
        <path d="M5 4h14v2a4 4 0 0 1-4 4H9a4 4 0 0 1-4-4Z" />
        <path d="M18 9a4 4 0 0 0 4-4V3h-4" />
        <path d="M6 3H2v2a4 4 0 0 0 4 4" />
      </symbol>
      <symbol id="icon-users" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
        <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2" />
        <circle cx="9" cy="7" r="4" />
        <path d="M23 21v-2a4 4 0 0 0-3-3.9" />
        <path d="M16 3.1a4 4 0 0 1 0 7.8" />
      </symbol>
      <symbol id="icon-message" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
        <path d="M21 11.5a8.4 8.4 0 0 1-9 8.5 8.4 8.4 0 0 1-3.1-.6L3 21l1.6-4.4A8.5 8.5 0 1 1 21 11.5Z" />
        <path d="M8 11h8" />
        <path d="M8 15h5" />
      </symbol>
      <symbol id="icon-trending" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
        <path d="m3 17 6-6 4 4 7-7" />
        <path d="M14 5h6v6" />
      </symbol>
    </svg>

    <div class="page">
      <header class="nav">
        <div class="inner nav__content">
          <div class="brand">
            <span class="brand__icon">
              <img src="${root}/resources/images/logo.png" alt="냠냠코치 로고" />
            </span>
            <span>냠냠코치</span>
          </div>
          <a class="btn btn--outline" href="${root}/main?action=login">로그인</a>
        </div>
      </header>

      <section class="hero">
        <div class="inner hero__content">
          <span class="badge">AI 기반 개인 맞춤 서비스</span>
          <h1>
            냠냠코치와 함께하는<br />
            <span>스마트 식단관리</span>
          </h1>
          <p>
            AI 코치가 분석하는 영양 데이터, 함께하는 챌린지, 똑똑한 운동 칼로리 계산까지.<br />
            건강한 라이프스타일의 모든 것을 한 번에 경험하세요.
          </p>
          <a class="btn btn--primary" href="${root}/main?action=login">
            냠냠코치 시작하기
            <svg aria-hidden="true"><use href="#icon-arrow"></use></svg>
          </a>
          <div class="hero__meta" role="list">
            <div role="listitem">
              <svg aria-hidden="true"><use href="#icon-star"></use></svg>
              <span>무료 서비스</span>
            </div>
            <div role="listitem">
              <svg aria-hidden="true"><use href="#icon-bot"></use></svg>
              <span>AI 코치 포함</span>
            </div>
          </div>
        </div>
      </section>

      <section class="section">
        <div class="inner">
          <div class="section__header">
            <span class="badge" style="margin-bottom: 18px">핵심 기능</span>
            <h2>냠냠코치만의 특별한 기능들</h2>
            <p>AI 기술과 커뮤니티의 힘을 결합하여 당신의 건강한 변화를 완벽하게 지원합니다.</p>
          </div>

          <div class="feature-grid">
            <article class="feature-card">
              <div class="feature-card__icon" style="background: rgba(16, 185, 129, 0.16); color: var(--color-emerald-400)">
                <svg aria-hidden="true"><use href="#icon-bot"></use></svg>
              </div>
              <div>
                <span class="badge" style="margin-bottom: 16px">핵심 기능</span>
                <h3>AI 냠냠코치</h3>
              </div>
              <p>개인 맞춤형 식단 조언과 영양 분석을 실시간으로 제공하는 똑똑한 AI 코치가 24시간 당신을 도와드립니다.</p>
              <div class="feature-card__tags">
                <span class="tag">실시간 상담</span>
                <span class="tag">개인 맞춤</span>
                <span class="tag">24/7 서비스</span>
              </div>
            </article>

            <article class="feature-card">
              <div class="feature-card__icon" style="background: rgba(59, 130, 246, 0.16); color: var(--color-blue-500)">
                <svg aria-hidden="true"><use href="#icon-zap"></use></svg>
              </div>
              <div>
                <span class="badge" style="margin-bottom: 16px; color: rgba(125, 211, 252, 0.9); border-color: rgba(59, 130, 246, 0.35); background: rgba(59, 130, 246, 0.12)">핵심 기능</span>
                <h3>스마트 칼로리 계산</h3>
              </div>
              <p>"30분 러닝했어"라고 말하면 AI가 자동으로 소모 칼로리를 계산하고 주간 운동량을 체계적으로 관리해드립니다.</p>
              <div class="feature-card__tags">
                <span class="tag tag--blue">자연어 입력</span>
                <span class="tag tag--blue">주간 통계</span>
                <span class="tag tag--blue">정확한 계산</span>
              </div>
            </article>
          </div>

          <div class="feature-grid">
            <article class="feature-card feature-card--subtle">
              <div class="feature-card__icon" style="color: var(--color-violet-400)">
                <svg aria-hidden="true"><use href="#icon-pie"></use></svg>
              </div>
              <div>
                <h3>정밀 식단 분석</h3>
                <p>식단을 입력하면 칼로리, 탄수화물, 단백질, 지방의 주간 추이를 상세하게 분석해드립니다.</p>
              </div>
              <div class="feature-card__tags">
                <span class="tag" style="color: rgba(192, 132, 252, 0.9); border-color: rgba(168, 85, 247, 0.35); background: rgba(168, 85, 247, 0.12)">
                  <svg aria-hidden="true" style="width: 16px; height: 16px"><use href="#icon-bars"></use></svg>
                  주간 영양소 트렌드
                </span>
              </div>
            </article>

            <article class="feature-card feature-card--subtle">
              <div class="feature-card__icon" style="color: var(--color-amber-400)">
                <svg aria-hidden="true"><use href="#icon-trophy"></use></svg>
              </div>
              <div>
                <h3>함께하는 챌린지</h3>
                <p>다른 사용자들과 함께 건강한 목표에 도전하고 동기부여를 받아보세요.</p>
              </div>
              <div class="feature-card__tags">
                <span class="tag" style="color: rgba(250, 204, 21, 0.9); border-color: rgba(251, 191, 36, 0.35); background: rgba(251, 191, 36, 0.12)">
                  <svg aria-hidden="true" style="width: 16px; height: 16px"><use href="#icon-users"></use></svg>
                  커뮤니티 참여
                </span>
              </div>
            </article>

            <article class="feature-card feature-card--subtle">
              <div class="feature-card__icon" style="color: var(--color-teal-400)">
                <svg aria-hidden="true"><use href="#icon-message"></use></svg>
              </div>
              <div>
                <h3>소통 게시판</h3>
                <p>건강한 생활 팁을 공유하고 서로의 경험을 나누는 커뮤니티 공간을 만나보세요.</p>
              </div>
              <div class="feature-card__tags">
                <span class="tag" style="color: rgba(45, 212, 191, 0.9); border-color: rgba(45, 212, 191, 0.35); background: rgba(45, 212, 191, 0.12)">
                  <svg aria-hidden="true" style="width: 16px; height: 16px"><use href="#icon-trending"></use></svg>
                  경험 공유
                </span>
              </div>
            </article>
          </div>
        </div>
      </section>

      <section class="section section--muted">
        <div class="inner">
          <div class="section__header">
            <h2>냠냠코치와 함께하는 하루</h2>
            <p>AI 기술로 더욱 스마트해진 건강 관리 경험을 확인해보세요.</p>
          </div>

          <div class="showcase-grid">
            <article class="showcase-card">
              <img src="https://images.unsplash.com/photo-1641301547846-2cf73f58fdca?auto=format&fit=crop&w=1080&q=80" alt="AI 식단 분석" loading="lazy" />
              <div class="showcase-card__overlay">
                <div class="showcase-card__content">
                  <h3>
                    <svg aria-hidden="true" style="width: 18px; height: 18px"><use href="#icon-pie"></use></svg>
                    식단 분석
                  </h3>
                  <p>영양소별 상세 분석과 개선 제안을 확인하세요.</p>
                </div>
              </div>
            </article>

            <article class="showcase-card">
              <img src="https://images.unsplash.com/photo-1687041568037-dab13851ea14?auto=format&fit=crop&w=1080&q=80" alt="AI 코치" loading="lazy" />
              <div class="showcase-card__overlay">
                <div class="showcase-card__content">
                  <h3>
                    <svg aria-hidden="true" style="width: 18px; height: 18px"><use href="#icon-bot"></use></svg>
                    AI 코치
                  </h3>
                  <p>24시간 개인 맞춤 건강 컨설팅을 제공합니다.</p>
                </div>
              </div>
            </article>

            <article class="showcase-card">
              <img src="https://images.unsplash.com/photo-1650559105934-a152367d6fe1?auto=format&fit=crop&w=1080&q=80" alt="함께하는 챌린지" loading="lazy" />
              <div class="showcase-card__overlay">
                <div class="showcase-card__content">
                  <h3>
                    <svg aria-hidden="true" style="width: 18px; height: 18px"><use href="#icon-trophy"></use></svg>
                    함께 챌린지
                  </h3>
                  <p>커뮤니티와 함께 건강 목표를 달성해보세요.</p>
                </div>
              </div>
            </article>
          </div>
        </div>
      </section>

      <section class="section">
        <div class="inner">
          <div class="stats">
            <div>
              <div class="stats__value">10,000+</div>
              <p>행복한 사용자들</p>
            </div>
            <div>
              <div class="stats__value">95%</div>
              <p>목표 달성률</p>
            </div>
            <div>
              <div class="stats__value">24/7</div>
              <p>AI 코치 서비스</p>
            </div>
          </div>
        </div>
      </section>

      <footer class="footer">
        <div class="inner" style="text-align: center">
          <div class="brand" style="justify-content: center">
            <span class="brand__icon">
              <img src="${root}/resources/images/logo.png" alt="냠냠코치 로고" />
            </span>
            <span>냠냠코치</span>
          </div>
          <p style="margin-top: 18px; color: rgba(148, 163, 184, 0.75); font-size: 16px">
            AI와 함께하는 스마트한 건강 관리 파트너
          </p>
          <div class="footer__links">
            <span>개인정보처리방침</span>
            <span>•</span>
            <span>이용약관</span>
            <span>•</span>
            <span>고객센터</span>
          </div>
        </div>
      </footer>
    </div>

    <div class="modal" role="dialog" aria-modal="true" aria-hidden="true" data-modal>
      <div class="modal__panel">
        <button class="modal__close" type="button" aria-label="닫기" data-modal-close>
          <svg aria-hidden="true" style="width: 18px; height: 18px"><use href="#icon-close"></use></svg>
        </button>
        <h2 class="modal__title">
          <svg aria-hidden="true"><use href="#icon-sparkles"></use></svg>
          냠냠코치에 오신 것을 환영합니다!
        </h2>
        <div class="tabs" role="tablist">
          <button class="tab-button" type="button" role="tab" aria-selected="true" data-tab-target="tab-login">로그인</button>
          <button class="tab-button" type="button" role="tab" aria-selected="false" data-tab-target="tab-signup">회원가입</button>
        </div>
        <div class="tab-panel" id="tab-login" role="tabpanel" data-tab-panel aria-hidden="false">
          <div class="field">
            <label for="login-email">이메일</label>
            <input id="login-email" type="email" placeholder="이메일을 입력하세요" />
          </div>
          <div class="field">
            <label for="login-password">비밀번호</label>
            <input id="login-password" type="password" placeholder="비밀번호를 입력하세요" />
          </div>
          <a class="btn btn--primary" href="${root}/main?action=login" style="width: 100%">로그인</a>
        </div>
        <div class="tab-panel" id="tab-signup" role="tabpanel" data-tab-panel aria-hidden="true">
          <div class="field">
            <label for="signup-name">이름</label>
            <input id="signup-name" type="text" placeholder="이름을 입력하세요" />
          </div>
          <div class="field">
            <label for="signup-email">이메일</label>
            <input id="signup-email" type="email" placeholder="이메일을 입력하세요" />
          </div>
          <div class="field">
            <label for="signup-password">비밀번호</label>
            <input id="signup-password" type="password" placeholder="비밀번호를 입력하세요" />
          </div>
          <a class="btn btn--primary" href="${root}/main?action=register" style="width: 100%">회원가입</a>
        </div>
      </div>
    </div>

    <script src="${root}/resources/start-page/script.js" defer></script>
  </body>
</html>

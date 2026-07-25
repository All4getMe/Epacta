<!doctype html>
<html lang="ru">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>epacta.net — Скоро релиз</title>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght@9..144,500;9..144,600&family=Inter:wght@400;500&family=IBM+Plex+Mono:wght@400;500&display=swap');

  :root{
    --ink-950:#080c16;
    --ink-900:#0b1120;
    --parchment-100:#f3efe4;
    --muted-500:#8b93ac;
    --gold-400:#e8b75e;
    --gold-600:#c98f32;
    --silver-300:#c9d3ea;
  }

  *{ margin:0; padding:0; box-sizing:border-box; }
  html,body{ height:100%; }
  body{
    background:var(--ink-950);
    color:var(--parchment-100);
    font-family:'Inter',sans-serif;
    overflow-x:hidden;
    -webkit-font-smoothing:antialiased;
  }

  .page{ position:relative; min-height:100vh; overflow:hidden; }

  /* ---------- animated sky ---------- */
  .sky{ position:fixed; inset:0; z-index:0; overflow:hidden; background:var(--ink-950); }
  .sky-day, .sky-night{
    position:absolute; inset:-15%;
    filter: blur(70px);
    animation-duration:24s;
    animation-timing-function:ease-in-out;
    animation-iteration-count:infinite;
  }
  .sky-day{
    background:
      radial-gradient(60% 45% at 50% 100%, rgba(232,183,94,0.55), transparent 70%),
      linear-gradient(180deg,#1b2a4a 0%, #3a4e7a 40%, #a9714a 75%, #e8b75e 100%);
    animation-name: cycle-day;
  }
  .sky-night{
    background:
      radial-gradient(50% 35% at 50% 10%, rgba(120,140,210,0.25), transparent 70%),
      linear-gradient(180deg,#050710 0%, #0b1330 45%, #16204a 80%, #0b1120 100%);
    animation-name: cycle-night;
  }
  @keyframes cycle-day{
    0%,45%{ opacity:1; } 50%,95%{ opacity:0; } 100%{ opacity:1; }
  }
  @keyframes cycle-night{
    0%,45%{ opacity:0; } 50%,95%{ opacity:1; } 100%{ opacity:0; }
  }

  .stars{
    position:absolute; inset:0;
    background-image:
      radial-gradient(1.5px 1.5px at 10% 20%, #fff, transparent),
      radial-gradient(1.5px 1.5px at 25% 65%, #fff, transparent),
      radial-gradient(1px 1px at 40% 15%, #fff, transparent),
      radial-gradient(1.5px 1.5px at 60% 40%, #fff, transparent),
      radial-gradient(1px 1px at 75% 25%, #fff, transparent),
      radial-gradient(1.5px 1.5px at 85% 60%, #fff, transparent),
      radial-gradient(1px 1px at 92% 10%, #fff, transparent),
      radial-gradient(1.5px 1.5px at 15% 45%, #fff, transparent),
      radial-gradient(1px 1px at 50% 8%, #fff, transparent),
      radial-gradient(1.5px 1.5px at 70% 75%, #fff, transparent);
    opacity:0;
    animation: cycle-night 24s ease-in-out infinite, twinkle 3.4s ease-in-out infinite;
    mix-blend-mode:screen;
  }
  @keyframes twinkle{ 0%,100%{ opacity:.55; } 50%{ opacity:1; } }

  .orbit{ position:absolute; inset:0; z-index:1; filter: blur(0.3px); }
  .sun, .moon{
    position:absolute;
    width:56px; height:56px;
    border-radius:50%;
    transform:translate(-50%,-50%);
    animation-name: orbit-body;
    animation-duration:24s;
    animation-timing-function:ease-in-out;
    animation-iteration-count:infinite;
  }
  .sun{
    background: radial-gradient(circle at 35% 30%, #fff4d6, var(--gold-400) 55%, var(--gold-600) 100%);
    box-shadow: 0 0 60px 16px rgba(232,183,94,0.55), 0 0 140px 60px rgba(232,183,94,0.18);
  }
  .moon{
    width:44px; height:44px;
    background: radial-gradient(circle at 38% 32%, #ffffff, var(--silver-300) 55%, #93a0c2 100%);
    box-shadow: 0 0 40px 10px rgba(199,211,234,0.4), 0 0 110px 46px rgba(199,211,234,0.14);
    animation-delay:-12s;
  }
  @keyframes orbit-body{
    0%    { left:-8%;  top:64%; opacity:0; transform:translate(-50%,-50%) scale(.7); }
    8%    { opacity:1; }
    30%   { left:22%;  top:16%; transform:translate(-50%,-50%) scale(1); }
    50%   { left:50%;  top:4%;  opacity:1; transform:translate(-50%,-50%) scale(1.08); }
    58%   { opacity:0; }
    75%   { left:76%;  top:18%; }
    100%  { left:108%; top:64%; opacity:0; transform:translate(-50%,-50%) scale(.7); }
  }

  .grain{
    position:absolute; inset:0; z-index:2;
    opacity:.05; pointer-events:none;
    background-image:url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='120' height='120'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='2' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)'/%3E%3C/svg%3E");
  }

  /* ---------- header ---------- */
  .topbar{
    position:fixed; top:0; left:0; right:0; z-index:10;
    height:150px;
    background:linear-gradient(to bottom, rgba(8,12,22,0.7) 0%, rgba(8,12,22,0.38) 42%, rgba(8,12,22,0) 100%);
    -webkit-backdrop-filter:blur(18px);
    backdrop-filter:blur(18px);
    -webkit-mask-image:linear-gradient(to bottom, black 0%, black 38%, transparent 100%);
    mask-image:linear-gradient(to bottom, black 0%, black 38%, transparent 100%);
    pointer-events:none;
  }
  .topbar__inner{
    max-width:1200px; margin:0 auto; padding:28px 32px 0;
    display:flex; align-items:center; justify-content:space-between;
    pointer-events:auto;
  }
  .wordmark{
    font-family:'IBM Plex Mono',monospace; font-size:15px;
    letter-spacing:.14em; color:var(--parchment-100);
  }
  .wordmark b{ color:var(--gold-400); font-weight:500; }
  .tag{
    font-family:'IBM Plex Mono',monospace; font-size:11px;
    letter-spacing:.18em; text-transform:uppercase; color:var(--muted-500);
    border:1px solid rgba(232,183,94,.35); border-radius:999px; padding:6px 12px;
  }

  /* ---------- hero ---------- */
  .hero{
    position:relative; z-index:3;
    min-height:100vh; padding:150px 24px 90px;
    display:flex; flex-direction:column; align-items:center; justify-content:center;
    text-align:center;
  }
  .seal{
    position:absolute;
    width:min(72vw,600px); height:min(72vw,600px);
    border:1px solid rgba(232,183,94,.18); border-radius:50%;
    animation: spin 90s linear infinite;
  }
  .seal::before, .seal::after{
    content:''; position:absolute; border-radius:50%;
  }
  .seal::before{ inset:16px; border:1px solid rgba(199,211,234,.12); }
  .seal::after{ inset:34px; border:1px dashed rgba(232,183,94,.1); }
  @keyframes spin{ to{ transform:rotate(360deg); } }

  .eyebrow{
    position:relative;
    font-family:'IBM Plex Mono',monospace; font-size:12px;
    letter-spacing:.4em; text-transform:uppercase; color:var(--gold-400);
    margin-bottom:20px;
  }
  .headline{
    position:relative;
    font-family:'Fraunces',serif; font-weight:600;
    font-size:clamp(38px, 8vw, 96px); line-height:1.04;
    color:var(--parchment-100);
    text-shadow:0 0 70px rgba(232,183,94,.22);
  }
  .dots span{ display:inline-block; animation:blink 1.6s infinite; }
  .dots span:nth-child(2){ animation-delay:.2s; }
  .dots span:nth-child(3){ animation-delay:.4s; }
  @keyframes blink{ 0%,100%{ opacity:.15; } 50%{ opacity:1; } }

  .subline{
    position:relative; margin-top:20px; max-width:440px;
    font-family:'Inter',sans-serif; font-size:16px; color:var(--muted-500);
  }

  .motes span{
    position:absolute; width:3px; height:3px; border-radius:50%;
    background:var(--gold-400); opacity:.5;
    animation:float 7s ease-in-out infinite;
  }
  .motes span:nth-child(1){ top:22%; left:14%; animation-delay:0s; }
  .motes span:nth-child(2){ top:64%; left:20%; animation-delay:1.4s; background:var(--silver-300); }
  .motes span:nth-child(3){ top:30%; left:82%; animation-delay:2.6s; }
  .motes span:nth-child(4){ top:72%; left:78%; animation-delay:3.8s; background:var(--silver-300); }
  .motes span:nth-child(5){ top:50%; left:8%; animation-delay:5s; }
  @keyframes float{
    0%,100%{ transform:translateY(0); opacity:.35; }
    50%{ transform:translateY(-18px); opacity:.9; }
  }

  .stamp{
    position:absolute; font-family:'IBM Plex Mono',monospace;
    font-size:11px; letter-spacing:.15em; text-transform:uppercase;
    color:var(--muted-500); opacity:.55;
  }
  .stamp--left{ left:26px; bottom:26px; }
  .stamp--right{ right:26px; bottom:26px; }

  .corner{
    position:absolute; font-family:'Fraunces',serif; user-select:none;
  }
  .corner--tl{ top:170px; left:26px; font-size:26px; color:rgba(232,183,94,.28); }
  .corner--br{ bottom:24px; right:26px; font-size:18px; color:rgba(199,211,234,.32); letter-spacing:.1em; }

  @media (max-width:640px){
    .topbar__inner{ padding:20px 18px 0; }
    .hero{ padding-top:130px; }
    .corner--tl{ top:120px; left:16px; font-size:20px; }
    .stamp--left, .stamp--right{ font-size:9px; }
  }

  @media (prefers-reduced-motion: reduce){
    .sky-day, .sky-night, .stars, .sun, .moon, .seal, .dots span, .motes span{
      animation:none !important;
    }
    .sky-day{ opacity:1; }
    .sky-night{ opacity:0; }
  }
</style>
</head>
<body>
  <div class="page">
    <div class="sky" aria-hidden="true">
      <div class="sky-day"></div>
      <div class="sky-night"></div>
      <div class="stars"></div>
      <div class="orbit">
        <div class="sun"></div>
        <div class="moon"></div>
      </div>
      <div class="grain"></div>
    </div>

    <header class="topbar">
      <div class="topbar__inner">
        <span class="wordmark">e<b>·</b>pacta</span>
        <span class="tag">coming soon</span>
      </div>
    </header>

    <main class="hero">
      <div class="seal" aria-hidden="true"></div>

      <p class="eyebrow">E · PACTA</p>
      <h1 class="headline">Скоро релиз<span class="dots"><span>.</span><span>.</span><span>.</span></span></h1>
      <p class="subline">Черновик подписан. Осталось запечатать.</p>

      <div class="motes" aria-hidden="true">
        <span></span><span></span><span></span><span></span><span></span>
      </div>

      <div class="stamp stamp--left">№ 001</div>
      <div class="stamp stamp--right">epacta.net</div>
      <div class="corner corner--tl">§</div>
      <div class="corner corner--br">✦ sealed soon</div>
    </main>
  </div>
</body>
</html>

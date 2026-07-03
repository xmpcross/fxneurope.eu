(function () {
  var artworkPath = "/img/hero-commerce-studio.svg";

  function isHomeHero(section) {
    if (!section) return false;
    var cls = section.className || "";
    return cls.indexOf("bg-ink") !== -1 && cls.indexOf("border-b") === -1;
  }

  function getHomeHero() {
    var section = document.querySelector("main > section:first-child");
    return isHomeHero(section) ? section : null;
  }

  function ensureHeroArtwork() {
    var hero = getHomeHero();
    if (!hero) return;

    var slot = hero.querySelector(".fxn-hero-lottie-slot");
    if (!slot) {
      slot = document.createElement("div");
      slot.className = "fxn-hero-lottie-slot";
      slot.setAttribute("aria-hidden", "true");
      hero.appendChild(slot);
    }

    hero.classList.remove("fxn-hero-lottie-ready");
    hero.classList.add("fxn-hero-svg-ready");

    if (!slot.querySelector("img")) {
      slot.innerHTML =
        '<img src="' +
        artworkPath +
        '" alt="" loading="eager" decoding="async" fetchpriority="high">';
      slot.dataset.fxnArtwork = "studio-svg";
    }
  }

  function scheduleHero() {
    ensureHeroArtwork();
    setTimeout(ensureHeroArtwork, 0);
    setTimeout(ensureHeroArtwork, 350);
    setTimeout(ensureHeroArtwork, 1200);
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", scheduleHero);
  } else {
    scheduleHero();
  }

  window.addEventListener("load", scheduleHero);

  var main = document.querySelector("main");
  if (main && typeof MutationObserver !== "undefined") {
    var timer;
    new MutationObserver(function () {
      clearTimeout(timer);
      timer = setTimeout(ensureHeroArtwork, 50);
    }).observe(main, { childList: true, subtree: true });
  }
})();

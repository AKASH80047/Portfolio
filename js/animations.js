/**
 * Akash Pandey — Animations, Scroll Reveals & Navigation Scrollspy
 */

class AnimationsManager {
  constructor() {
    this.init();
  }

  init() {
    this.setupScrollReveals();
    this.setupStatCounters();
    this.setupNavbarScrollSpy();
  }

  setupScrollReveals() {
    const observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.classList.add('active');
        }
      });
    }, { threshold: 0.1 });

    document.querySelectorAll('.reveal').forEach(el => observer.observe(el));
  }

  setupStatCounters() {
    const statElements = document.querySelectorAll('.stat-number');
    if (statElements.length === 0) return;

    const observer = new IntersectionObserver((entries, obs) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          const target = entry.target;
          const finalVal = parseInt(target.dataset.target || target.textContent, 10);
          if (!isNaN(finalVal)) {
            this.animateCounter(target, finalVal);
          }
          obs.unobserve(target);
        }
      });
    }, { threshold: 0.5 });

    statElements.forEach(el => observer.observe(el));
  }

  animateCounter(element, targetValue) {
    let start = 0;
    const duration = 1500;
    const stepTime = 30;
    const steps = duration / stepTime;
    const increment = targetValue / steps;

    const timer = setInterval(() => {
      start += increment;
      if (start >= targetValue) {
        element.textContent = `${targetValue}+`;
        clearInterval(timer);
      } else {
        element.textContent = `${Math.floor(start)}+`;
      }
    }, stepTime);
  }

  setupNavbarScrollSpy() {
    const sections = document.querySelectorAll('section[id]');
    const navLinks = document.querySelectorAll('.nav-link');
    const navbar = document.querySelector('.navbar');

    window.addEventListener('scroll', () => {
      // Navbar backdrop effect
      if (window.scrollY > 50) {
        navbar?.classList.add('scrolled');
      } else {
        navbar?.classList.remove('scrolled');
      }

      // Scrollspy active highlight
      let currentSectionId = '';
      sections.forEach(section => {
        const sectionTop = section.offsetTop - 100;
        const sectionHeight = section.offsetHeight;
        if (window.scrollY >= sectionTop && window.scrollY < sectionTop + sectionHeight) {
          currentSectionId = section.getAttribute('id');
        }
      });

      navLinks.forEach(link => {
        link.classList.remove('active');
        if (link.getAttribute('href') === `#${currentSectionId}`) {
          link.classList.add('active');
        }
      });
    });
  }
}

window.AnimationsManager = AnimationsManager;

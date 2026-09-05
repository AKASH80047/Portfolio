/**
 * Akash Pandey — Main Application Entry Point
 * Initializes all controllers and populates dynamic components from config.js
 */

document.addEventListener("DOMContentLoaded", () => {
  // 1. Initialize Theme System
  window.themeEngine = new window.ThemeEngine();

  // 2. Populate Static Content from Configuration
  populateHeaderAndHero();
  populateAboutSection();
  populateSkillsSection();
  populateExperienceSection();
  populateEducationSection();
  populateServicesSection();
  populateStatsSection();
  populateResumeSection();
  populateContactInfo();
  populateFooter();

  // 3. Initialize Controllers
  window.projectsController = new window.ProjectsController();
  window.animationsManager = new window.AnimationsManager();
  window.contactFormHandler = new window.ContactFormHandler();

  // 4. Setup Mobile Menu Drawer Toggle
  setupMobileMenu();
});

function populateHeaderAndHero() {
  const config = window.PORTFOLIO_CONFIG.personal;
  
  // Set Profile Avatar
  const avatarImg = document.getElementById("heroAvatar");
  if (avatarImg) avatarImg.src = config.profileImage;

  // Set Hero Texts
  const nameEl = document.getElementById("heroName");
  if (nameEl) nameEl.textContent = config.name;

  const roleEl = document.getElementById("heroRole");
  if (roleEl) roleEl.textContent = config.role;

  const locEl = document.getElementById("heroLocation");
  if (locEl) locEl.innerHTML = `${config.flag} Based in ${config.location}`;

  const eduEl = document.getElementById("heroEducation");
  if (eduEl) eduEl.innerHTML = config.educationSummary;

  const bioEl = document.getElementById("heroBio");
  if (bioEl) bioEl.textContent = config.shortIntro;

  // Social Links
  const socials = window.PORTFOLIO_CONFIG.socialLinks;
  const githubLinks = document.querySelectorAll(".link-github");
  githubLinks.forEach(el => el.href = socials.github);

  const linkedinLinks = document.querySelectorAll(".link-linkedin");
  linkedinLinks.forEach(el => el.href = socials.linkedin);

  const emailLinks = document.querySelectorAll(".link-email");
  emailLinks.forEach(el => el.href = socials.email);
}

function populateAboutSection() {
  const about = window.PORTFOLIO_CONFIG.about;
  const titleEl = document.getElementById("aboutTitle");
  if (titleEl) titleEl.textContent = about.title;

  const bodyEl = document.getElementById("aboutBody");
  if (bodyEl) {
    bodyEl.innerHTML = about.paragraphs.map(p => `<p style="margin-bottom: 1rem; font-size: 1.05rem; line-height: 1.7;">${p}</p>`).join('');
  }
}

function populateSkillsSection() {
  const categories = window.PORTFOLIO_CONFIG.skills;
  const container = document.getElementById("skillsGrid");
  if (!container) return;

  container.innerHTML = categories.map(cat => `
    <div class="skill-category-card reveal">
      <div class="skill-category-header">
        <span style="font-weight: 700;">${cat.category}</span>
      </div>
      <div class="skill-items-list">
        ${cat.items.map(item => `
          <div class="skill-item">
            <span class="skill-name">${item.name}</span>
            <span class="skill-level-badge">${item.level}</span>
          </div>
        `).join('')}
      </div>
    </div>
  `).join('');
}

function populateExperienceSection() {
  const experiences = window.PORTFOLIO_CONFIG.experience;
  const container = document.getElementById("experienceTimeline");
  if (!container) return;

  container.innerHTML = experiences.map(exp => `
    <div class="timeline-item reveal">
      <div class="timeline-dot"></div>
      <div class="timeline-card">
        <h3 class="timeline-role">${exp.role}</h3>
        <div class="timeline-company">${exp.company} • ${exp.location}</div>
        <div class="timeline-meta">Duration: ${exp.period}</div>
        <p style="margin-bottom: 1rem;">${exp.description}</p>
        <ul class="timeline-bullets">
          ${exp.bullets.map(b => `<li>${b}</li>`).join('')}
        </ul>
        <div style="display: flex; flex-wrap: wrap; gap: 6px; margin-top: 1rem;">
          ${exp.technologies.map(t => `<span class="tech-tag">${t}</span>`).join('')}
        </div>
      </div>
    </div>
  `).join('');
}

function populateEducationSection() {
  const education = window.PORTFOLIO_CONFIG.education;
  const container = document.getElementById("educationTimeline");
  if (!container) return;

  container.innerHTML = education.map(edu => `
    <div class="timeline-item reveal">
      <div class="timeline-dot"></div>
      <div class="timeline-card">
        <h3 class="timeline-role">${edu.degree}</h3>
        <div class="timeline-company" style="color: var(--primary-accent-text);">${edu.specialization}</div>
        <div class="timeline-meta">${edu.institution} • ${edu.period} • <strong style="color: var(--text-primary);">${edu.score}</strong></div>
        <p>${edu.details}</p>
      </div>
    </div>
  `).join('');
}

function populateServicesSection() {
  const services = window.PORTFOLIO_CONFIG.services;
  const container = document.getElementById("servicesGrid");
  if (!container) return;

  container.innerHTML = services.map(srv => `
    <div class="service-card reveal">
      <div class="service-icon">⚡</div>
      <h3 style="margin-bottom: 0.5rem; font-size: 1.25rem;">${srv.title}</h3>
      <p style="font-size: 0.95rem; color: var(--text-secondary); line-height: 1.6;">${srv.description}</p>
    </div>
  `).join('');
}

function populateStatsSection() {
  const stats = window.PORTFOLIO_CONFIG.stats;
  const container = document.getElementById("statsGrid");
  if (!container) return;

  container.innerHTML = stats.map(st => `
    <div class="stat-card reveal">
      <div class="stat-number" data-target="${st.value.replace(/\+/g, '')}">${st.value}</div>
      <h4 style="margin-bottom: 4px; font-size: 1.1rem;">${st.label}</h4>
      <p style="font-size: 0.85rem; color: var(--text-muted);">${st.sub}</p>
    </div>
  `).join('');
}

function populateResumeSection() {
  const resumeBtn = document.getElementById("downloadResumeBtn");
  const viewBtn = document.getElementById("viewResumeBtn");
  const config = window.PORTFOLIO_CONFIG.personal;

  if (resumeBtn) resumeBtn.href = config.resumePath;
  if (viewBtn) {
    viewBtn.addEventListener("click", (e) => {
      e.preventDefault();
      if (window.ModalController) {
        window.ModalController.openResumeModal();
      }
    });
  }
}

function populateContactInfo() {
  const personal = window.PORTFOLIO_CONFIG.personal;
  
  const emailEl = document.getElementById("contactInfoEmail");
  if (emailEl) emailEl.textContent = personal.email;

  const phoneEl = document.getElementById("contactInfoPhone");
  if (phoneEl) phoneEl.textContent = personal.phone;
}

function populateFooter() {
  const yearEl = document.getElementById("currentYear");
  if (yearEl) yearEl.textContent = new Date().getFullYear();
}

function setupMobileMenu() {
  const toggle = document.getElementById("mobileToggle");
  const navLinks = document.getElementById("navLinks");
  
  if (toggle && navLinks) {
    toggle.addEventListener("click", () => {
      navLinks.classList.toggle("open");
    });

    document.querySelectorAll(".nav-link").forEach(link => {
      link.addEventListener("click", () => {
        navLinks.classList.remove("open");
      });
    });
  }

  // Mobile Bottom Navigation Active Highlight Observer
  const sections = document.querySelectorAll("section[id]");
  const bottomNavItems = document.querySelectorAll(".mobile-nav-item");

  if (sections.length > 0 && bottomNavItems.length > 0) {
    window.addEventListener("scroll", () => {
      let currentSection = "home";
      const scrollPos = window.scrollY + 200;

      sections.forEach(sec => {
        if (scrollPos >= sec.offsetTop) {
          currentSection = sec.getAttribute("id");
        }
      });

      bottomNavItems.forEach(item => {
        if (item.dataset.section === currentSection) {
          item.classList.add("active");
        } else {
          item.classList.remove("active");
        }
      });
    });
  }
}

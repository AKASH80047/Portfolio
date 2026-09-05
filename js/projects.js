/**
 * Akash Pandey — Projects Controller
 * Renders Featured Projects and All GitHub Projects with Live Search, Filter Chips, and Sorting.
 */

class ProjectsController {
  constructor() {
    this.featuredProjects = PORTFOLIO_CONFIG.featuredProjects;
    this.allProjects = [];
    this.currentFilter = "all";
    this.currentSearch = "";
    this.currentSort = "newest";
    
    this.githubService = new window.GitHubService();
    this.init();
  }

  async init() {
    this.renderFeaturedProjects();
    await this.loadAllProjects();
    this.setupEventListeners();
  }

  renderFeaturedProjects() {
    const container = document.getElementById("featuredProjectsGrid");
    if (!container) return;

    container.innerHTML = this.featuredProjects.map((project, index) => `
      <div class="project-card case-study ${index % 2 === 1 ? 'reverse' : ''} reveal">
        <div class="project-card-image-wrapper">
          <img src="${project.image}" alt="${project.name}" class="project-card-image" loading="lazy">
          <span class="badge-featured" style="position: absolute; top: 16px; right: 16px; z-index: 2;">${project.badge}</span>
        </div>
        <div class="project-card-body">
          <div class="project-card-header">
            <h3 class="project-card-title">${project.name}</h3>
          </div>
          <p class="project-card-description">${project.shortDescription}</p>
          
          <div class="project-card-features-list">
            ${(project.features || []).slice(0, 3).map(feat => `
              <div class="project-feature-bullet">
                <span>${feat}</span>
              </div>
            `).join('')}
          </div>

          <div class="project-card-tech">
            ${project.technologies.slice(0, 5).map(tech => `<span class="tech-tag">${tech}</span>`).join('')}
          </div>
          <div class="project-card-actions">
            <button class="btn btn-primary btn-sm view-details-btn" data-project-id="${project.id}">View Details</button>
            <a href="${project.githubUrl}" target="_blank" rel="noopener" class="btn btn-secondary btn-sm">GitHub</a>
            ${project.liveDemoUrl ? `<a href="${project.liveDemoUrl}" target="_blank" rel="noopener" class="btn btn-primary btn-sm" style="background: #00b894; border-color: #00b894;">Live Demo</a>` : ''}
          </div>
        </div>
      </div>
    `).join('');

    // Attach click event for View Details buttons
    container.querySelectorAll('.view-details-btn').forEach(btn => {
      btn.addEventListener('click', () => {
        const id = btn.dataset.projectId;
        const project = this.featuredProjects.find(p => p.id === id);
        if (project && window.ModalController) {
          window.ModalController.openProjectModal(project);
        }
      });
    });
  }

  async loadAllProjects() {
    const githubRepos = await this.githubService.fetchRepositories();
    
    // Combine featured and fetched GitHub repos
    const combined = [...this.featuredProjects];
    githubRepos.forEach(repo => {
      if (!combined.some(p => p.name.toLowerCase() === repo.name.toLowerCase())) {
        combined.push({
          id: repo.id,
          name: repo.name,
          badge: repo.language,
          category: repo.language,
          shortDescription: repo.description,
          fullDescription: repo.description,
          image: repo.image,
          gallery: [repo.image],
          technologies: [repo.language, ...(repo.topics || [])],
          features: ["Open-source repository available on GitHub profile."],
          githubUrl: repo.githubUrl,
          stars: repo.stars,
          forks: repo.forks,
          isFeatured: false
        });
      }
    });

    this.allProjects = combined;
    this.renderAllProjects();
  }

  renderAllProjects() {
    const container = document.getElementById("allProjectsGrid");
    if (!container) return;

    let filtered = this.allProjects.filter(project => {
      // Search match
      const matchesSearch = project.name.toLowerCase().includes(this.currentSearch) ||
                            project.shortDescription.toLowerCase().includes(this.currentSearch);
      
      // Filter category match
      if (this.currentFilter === "all") return matchesSearch;
      if (this.currentFilter === "flutter") return matchesSearch && project.technologies.some(t => t.toLowerCase().includes("flutter"));
      if (this.currentFilter === "dart") return matchesSearch && project.technologies.some(t => t.toLowerCase().includes("dart"));
      if (this.currentFilter === "firebase") return matchesSearch && project.technologies.some(t => t.toLowerCase().includes("firebase"));
      if (this.currentFilter === "other") return matchesSearch && !project.technologies.some(t => t.toLowerCase().includes("flutter"));
      return matchesSearch;
    });

    // Sorting
    if (this.currentSort === "stars") {
      filtered.sort((a, b) => (b.stars || 0) - (a.stars || 0));
    } else if (this.currentSort === "name") {
      filtered.sort((a, b) => a.name.localeCompare(b.name));
    }

    if (filtered.length === 0) {
      container.innerHTML = `
        <div style="grid-column: 1 / -1; text-align: center; padding: 3rem; color: var(--text-muted);">
          <p>No projects match your search criteria.</p>
        </div>
      `;
      return;
    }

    container.innerHTML = filtered.map(project => `
      <div class="project-card reveal">
        <div class="project-card-image-wrapper">
          <img src="${project.image}" alt="${project.name}" class="project-card-image" loading="lazy">
        </div>
        <div class="project-card-body">
          <h3 class="project-card-title">${project.name}</h3>
          <p class="project-card-description">${project.shortDescription}</p>
          <div class="project-card-tech">
            ${project.technologies.slice(0, 3).map(tech => `<span class="tech-tag">${tech}</span>`).join('')}
          </div>
          <div class="project-card-actions">
            <button class="btn btn-primary btn-sm view-details-btn" data-project-id="${project.id}">Details</button>
            <a href="${project.githubUrl}" target="_blank" rel="noopener" class="btn btn-secondary btn-sm">GitHub</a>
          </div>
        </div>
      </div>
    `).join('');

    container.querySelectorAll('.view-details-btn').forEach(btn => {
      btn.addEventListener('click', () => {
        const id = btn.dataset.projectId;
        const project = this.allProjects.find(p => p.id === id);
        if (project && window.ModalController) {
          window.ModalController.openProjectModal(project);
        }
      });
    });
  }

  setupEventListeners() {
    // Search Input
    const searchInput = document.getElementById("projectSearchInput");
    if (searchInput) {
      searchInput.addEventListener("input", (e) => {
        this.currentSearch = e.target.value.toLowerCase().trim();
        this.renderAllProjects();
      });
    }

    // Filter Chips
    document.querySelectorAll(".filter-chip").forEach(chip => {
      chip.addEventListener("click", () => {
        document.querySelectorAll(".filter-chip").forEach(c => c.classList.remove("active"));
        chip.classList.add("active");
        this.currentFilter = chip.dataset.filter;
        this.renderAllProjects();
      });
    });

    // Sort Dropdown
    const sortSelect = document.getElementById("projectSortSelect");
    if (sortSelect) {
      sortSelect.addEventListener("change", (e) => {
        this.currentSort = e.target.value;
        this.renderAllProjects();
      });
    }
  }
}

window.ProjectsController = ProjectsController;

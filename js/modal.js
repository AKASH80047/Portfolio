/**
 * Akash Pandey — Modal & Lightbox Controller
 * Manages Project Details dialog, image gallery lightbox, and resume viewer modal.
 * Uses <dialog closedby="any"> with JS light-dismiss fallback for full browser support.
 */

class ModalController {
  constructor() {
    this.projectModal = document.getElementById("projectModal");
    this.lightboxModal = document.getElementById("lightboxModal");
    this.resumeModal = document.getElementById("resumeModal");
    
    this.init();
  }

  init() {
    this.setupModalFallback(this.projectModal);
    this.setupModalFallback(this.resumeModal);
    this.setupLightbox();
  }

  setupModalFallback(dialogEl) {
    if (!dialogEl) return;

    // Standard close button click
    const closeBtns = dialogEl.querySelectorAll(".modal-close-btn");
    closeBtns.forEach(btn => {
      btn.addEventListener("click", () => dialogEl.close());
    });

    // Fallback for browsers without closedBy support (light dismiss on backdrop click)
    if (!('closedBy' in HTMLDialogElement.prototype)) {
      dialogEl.addEventListener('click', (event) => {
        if (event.target !== dialogEl) return;
        const rect = dialogEl.getBoundingClientRect();
        const isDialogContent = (
          rect.top <= event.clientY &&
          event.clientY <= rect.top + rect.height &&
          rect.left <= event.clientX &&
          event.clientX <= rect.left + rect.width
        );
        if (!isDialogContent) {
          dialogEl.close();
        }
      });
    }
  }

  openProjectModal(project) {
    if (!this.projectModal) return;

    const modalTitle = document.getElementById("modalProjectTitle");
    const modalBody = document.getElementById("modalProjectBody");

    if (modalTitle) modalTitle.textContent = project.name;

    if (modalBody) {
      modalBody.innerHTML = `
        <div style="margin-bottom: 1.5rem;">
          <img src="${project.image}" alt="${project.name}" id="modalMainCover" style="width: 100%; height: 320px; object-fit: cover; border-radius: 12px; cursor: pointer; border: 1px solid var(--border-color);" />
        </div>

        ${project.gallery && project.gallery.length > 1 ? `
          <div style="display: flex; gap: 10px; margin-bottom: 1.5rem; overflow-x: auto; padding-bottom: 5px;">
            ${project.gallery.map(img => `
              <img src="${img}" alt="Screenshot" class="modal-gallery-thumb" style="width: 120px; height: 75px; object-fit: cover; border-radius: 8px; cursor: pointer; border: 1px solid var(--border-color);" />
            `).join('')}
          </div>
        ` : ''}

        <h4 style="margin-bottom: 0.5rem; color: var(--primary-accent-text);">Project Overview</h4>
        <p style="margin-bottom: 1.5rem; line-height: 1.7;">${project.fullDescription || project.shortDescription}</p>

        ${project.features && project.features.length > 0 ? `
          <h4 style="margin-bottom: 0.5rem; color: var(--primary-accent-text);">Key Features</h4>
          <ul style="list-style: disc; padding-left: 1.2rem; margin-bottom: 1.5rem; color: var(--text-secondary);">
            ${project.features.map(f => `<li style="margin-bottom: 4px;">${f}</li>`).join('')}
          </ul>
        ` : ''}

        ${project.architecture ? `
          <h4 style="margin-bottom: 0.5rem; color: var(--primary-accent-text);">Architecture</h4>
          <p style="margin-bottom: 1.5rem;">${project.architecture}</p>
        ` : ''}

        ${project.challenges ? `
          <h4 style="margin-bottom: 0.5rem; color: var(--primary-accent-text);">Technical Challenges & Solution</h4>
          <p style="margin-bottom: 0.5rem;"><strong>Challenge:</strong> ${project.challenges}</p>
          <p style="margin-bottom: 1.5rem;"><strong>Solution:</strong> ${project.solution}</p>
        ` : ''}

        <h4 style="margin-bottom: 0.5rem; color: var(--primary-accent-text);">Tech Stack</h4>
        <div style="display: flex; flex-wrap: wrap; gap: 8px; margin-bottom: 2rem;">
          ${(project.technologies || []).map(t => `<span class="tech-tag">${t}</span>`).join('')}
        </div>

        ${project.liveDemoUrl ? `
          <h4 style="margin-bottom: 0.5rem; color: var(--primary-accent-text);">Interactive Live Application Preview</h4>
          <div style="width: 100%; border: 1px solid var(--border-color); border-radius: 12px; overflow: hidden; margin-bottom: 1.5rem; background: var(--bg-secondary);">
            <div style="padding: 8px 16px; background: rgba(0,0,0,0.2); display: flex; align-items: center; justify-content: space-between; border-bottom: 1px solid var(--border-color);">
              <span style="font-size: 0.8rem; font-family: monospace; color: var(--text-secondary);">${project.liveDemoUrl}</span>
              <a href="${project.liveDemoUrl}" target="_blank" rel="noopener" class="btn btn-secondary btn-sm" style="padding: 2px 8px; font-size: 0.75rem;">Open Fullscreen</a>
            </div>
            <iframe src="${project.liveDemoUrl}" style="width: 100%; height: 500px; border: none;" title="Live Application Preview"></iframe>
          </div>
        ` : ''}

        <div style="display: flex; gap: 12px; flex-wrap: wrap;">
          <a href="${project.githubUrl}" target="_blank" rel="noopener" class="btn btn-primary">GitHub Repository</a>
          ${project.liveDemoUrl ? `<a href="${project.liveDemoUrl}" target="_blank" rel="noopener" class="btn btn-secondary">Open Live Demo</a>` : ''}
          ${project.apkUrl ? `<a href="${project.apkUrl}" target="_blank" rel="noopener" class="btn btn-outline">Download APK</a>` : ''}
        </div>
      `;

      // Attach click event for gallery thumbnails
      const mainCover = document.getElementById("modalMainCover");
      modalBody.querySelectorAll(".modal-gallery-thumb").forEach(thumb => {
        thumb.addEventListener("click", () => {
          if (mainCover) mainCover.src = thumb.src;
        });
      });

      if (mainCover) {
        mainCover.addEventListener("click", () => {
          this.openLightbox(mainCover.src);
        });
      }
    }

    this.projectModal.showModal();
  }

  openLightbox(imageSrc) {
    if (!this.lightboxModal) return;
    const lightboxImg = document.getElementById("lightboxImage");
    if (lightboxImg) lightboxImg.src = imageSrc;
    this.lightboxModal.classList.add("open");
  }

  setupLightbox() {
    if (!this.lightboxModal) return;
    this.lightboxModal.addEventListener("click", () => {
      this.lightboxModal.classList.remove("open");
    });
  }

  openResumeModal() {
    if (this.resumeModal) {
      this.resumeModal.showModal();
    }
  }
}

window.ModalControllerInstance = new ModalController();
window.ModalController = window.ModalControllerInstance;

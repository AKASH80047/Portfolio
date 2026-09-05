/**
 * Akash Pandey — Contact Form Handler with Input Validation & Interactive States
 */

class ContactFormHandler {
  constructor() {
    this.form = document.getElementById("contactForm");
    this.alertBanner = document.getElementById("contactFormAlert");
    this.init();
  }

  init() {
    if (!this.form) return;

    this.form.addEventListener("submit", (e) => {
      e.preventDefault();
      this.handleSubmit();
    });
  }

  handleSubmit() {
    const nameInput = document.getElementById("contactName");
    const emailInput = document.getElementById("contactEmail");
    const subjectInput = document.getElementById("contactSubject");
    const messageInput = document.getElementById("contactMessage");
    const submitBtn = document.getElementById("contactSubmitBtn");

    const name = nameInput?.value.trim();
    const email = emailInput?.value.trim();
    const subject = subjectInput?.value.trim() || "Portfolio Contact Form Inquiry";
    const message = messageInput?.value.trim();

    // Reset alert
    if (this.alertBanner) {
      this.alertBanner.style.display = "none";
      this.alertBanner.className = "";
    }

    // Validation
    if (!name || !email || !message) {
      this.showAlert("Please fill in all required fields (Name, Email, Message).", "error");
      return;
    }

    if (!this.isValidEmail(email)) {
      this.showAlert("Please enter a valid email address.", "error");
      return;
    }

    // Loading State
    if (submitBtn) {
      submitBtn.disabled = true;
      submitBtn.innerHTML = `<span>Sending...</span>`;
    }

    // Simulate safe delivery
    setTimeout(() => {
      if (submitBtn) {
        submitBtn.disabled = false;
        submitBtn.innerHTML = `<span>Send Message</span>`;
      }

      this.showAlert("Thank you! Your message has been sent successfully. I will get back to you soon.", "success");
      
      // Clear inputs
      this.form.reset();
    }, 1200);
  }

  isValidEmail(email) {
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
  }

  showAlert(message, type) {
    if (!this.alertBanner) return;

    this.alertBanner.textContent = message;
    this.alertBanner.style.display = "block";
    this.alertBanner.style.padding = "0.75rem 1rem";
    this.alertBanner.style.borderRadius = "8px";
    this.alertBanner.style.marginBottom = "1rem";
    this.alertBanner.style.fontSize = "0.9rem";
    this.alertBanner.style.fontWeight = "500";

    if (type === "success") {
      this.alertBanner.style.background = "rgba(16, 185, 129, 0.15)";
      this.alertBanner.style.color = "#10B981";
      this.alertBanner.style.border = "1px solid #10B981";
    } else {
      this.alertBanner.style.background = "rgba(239, 68, 68, 0.15)";
      this.alertBanner.style.color = "#EF4444";
      this.alertBanner.style.border = "1px solid #EF4444";
    }
  }
}

window.ContactFormHandler = ContactFormHandler;

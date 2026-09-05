/**
 * Akash Pandey — Theme Engine & Accent Color Switcher
 * Supports: Dark Mode, Light Mode, System Preference Mode,
 * 6 Accent Presets + Custom Color Picker, LocalStorage persistence.
 */

class ThemeEngine {
  constructor() {
    this.storageKeyMode = "akash_portfolio_theme_mode";
    this.storageKeyAccent = "akash_portfolio_theme_accent";
    
    // Default theme settings
    this.currentMode = localStorage.getItem(this.storageKeyMode) || PORTFOLIO_CONFIG.themePresets.defaultMode;
    this.currentAccent = localStorage.getItem(this.storageKeyAccent) || PORTFOLIO_CONFIG.themePresets.defaultAccent;
    
    this.init();
  }

  init() {
    this.applyMode(this.currentMode);
    this.applyAccent(this.currentAccent);
    this.setupEventListeners();
  }

  applyMode(mode) {
    this.currentMode = mode;
    localStorage.setItem(this.storageKeyMode, mode);

    let effectiveTheme = mode;
    if (mode === 'system') {
      const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
      effectiveTheme = prefersDark ? 'dark' : 'light';
    }

    document.documentElement.setAttribute('data-theme', effectiveTheme);

    // Update active state on theme mode buttons in drawer
    document.querySelectorAll('.theme-mode-btn').forEach(btn => {
      if (btn.dataset.mode === mode) {
        btn.classList.add('active');
      } else {
        btn.classList.remove('active');
      }
    });
  }

  applyAccent(colorHex) {
    this.currentAccent = colorHex;
    localStorage.setItem(this.storageKeyAccent, colorHex);

    // Convert HEX to RGB for opacity variations
    const rgb = this.hexToRgb(colorHex) || { r: 1, g: 117, b: 194 };
    
    const root = document.documentElement;
    root.style.setProperty('--primary-accent', colorHex);
    root.style.setProperty('--primary-accent-rgb', `${rgb.r}, ${rgb.g}, ${rgb.b}`);
    root.style.setProperty('--primary-accent-light', `rgba(${rgb.r}, ${rgb.g}, ${rgb.b}, 0.15)`);
    root.style.setProperty('--primary-accent-glow', `rgba(${rgb.r}, ${rgb.g}, ${rgb.b}, 0.35)`);
    root.style.setProperty('--primary-accent-text', colorHex);

    // Update chips UI active status
    document.querySelectorAll('.accent-color-chip').forEach(chip => {
      if (chip.dataset.color.toLowerCase() === colorHex.toLowerCase()) {
        chip.classList.add('active');
      } else {
        chip.classList.remove('active');
      }
    });

    const picker = document.getElementById('customColorPicker');
    if (picker) {
      picker.value = colorHex;
    }
  }

  hexToRgb(hex) {
    const result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
    return result ? {
      r: parseInt(result[1], 16),
      g: parseInt(result[2], 16),
      b: parseInt(result[3], 16)
    } : null;
  }

  setupEventListeners() {
    // Mode Buttons Listener
    document.querySelectorAll('.theme-mode-btn').forEach(btn => {
      btn.addEventListener('click', () => {
        this.applyMode(btn.dataset.mode);
      });
    });

    // Accent Chips Listener
    document.querySelectorAll('.accent-color-chip').forEach(chip => {
      chip.addEventListener('click', () => {
        this.applyAccent(chip.dataset.color);
      });
    });

    // Custom Color Input Listener
    const picker = document.getElementById('customColorPicker');
    if (picker) {
      picker.addEventListener('input', (e) => {
        this.applyAccent(e.target.value);
      });
    }

    // Toggle Theme Drawer Visibility
    const drawerBtn = document.getElementById('themeToggleBtn');
    const drawer = document.getElementById('themeDrawer');
    if (drawerBtn && drawer) {
      drawerBtn.addEventListener('click', (e) => {
        e.stopPropagation();
        drawer.classList.toggle('open');
      });

      // Light dismiss drawer when clicking outside
      document.addEventListener('click', (e) => {
        if (!drawer.contains(e.target) && !drawerBtn.contains(e.target)) {
          drawer.classList.remove('open');
        }
      });
    }

    // OS Theme preference change watcher
    window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', () => {
      if (this.currentMode === 'system') {
        this.applyMode('system');
      }
    });
  }
}

window.ThemeEngine = ThemeEngine;

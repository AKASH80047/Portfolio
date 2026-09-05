/**
 * Akash Pandey — Personal Portfolio Configuration
 * Centralized single source of truth for all portfolio content, branding, and links.
 */

const PORTFOLIO_CONFIG = {
  personal: {
    name: "Akash Pandey",
    role: "Flutter Developer",
    location: "India",
    flag: "🇮🇳",
    phone: "+91-7428342558",
    email: "akp991892@gmail.com",
    githubUsername: "AKASH80047",
    githubUrl: "https://github.com/AKASH80047",
    linkedinUrl: "https://linkedin.com/in/akash106",
    bio: "Results-driven Flutter Developer with commercial internship experience building production-ready, cross-platform mobile applications. Proficient in Dart, Riverpod, Dio, REST API integration, Firebase (Auth & Firestore), and Clean Architecture / MVVM design patterns. Computer Science Engineering graduate with expertise in engineering responsive UI components following Material 3 guidelines.",
    shortIntro: "Flutter Developer focused on building modern, scalable, and user-friendly mobile applications using Flutter, Dart, Firebase, REST APIs, and clean application architecture.",
    profileImage: "assets/images/akash_pandey.jpg",
    resumePath: "assets/images/akp991892@gmail.com.pdf",
    educationSummary: "Flutter Developer | iOS Developer | B.Tech CSE Graduate | Flutter | Dart | Firebase | Mobile App Development | REST APIs | Riverpod",
    headlineTags: [
      "Flutter Developer",
      "iOS Developer",
      "B.Tech CSE Graduate",
      "Flutter",
      "Dart",
      "Firebase",
      "Mobile App Development",
      "REST APIs",
      "Riverpod"
    ]
  },

  socialLinks: {
    github: "https://github.com/AKASH80047",
    linkedin: "https://linkedin.com/in/akash106",
    email: "mailto:akp991892@gmail.com",
    phone: "tel:+917428342558",
    whatsapp: "https://wa.me/917428342558"
  },

  stats: [
    { label: "Months Commercial Exp.", value: "6+", sub: "Flutter Developer Intern" },
    { label: "Public Repositories", value: "30+", sub: "On GitHub (AKASH80047)" },
    { label: "Mobile Apps Built", value: "7+", sub: "Production & Open Source" },
    { label: "REST APIs Integrated", value: "20+", sub: "Using Dio & Clean Arch" }
  ],

  about: {
    title: "About Me",
    heading: "Crafting High-Performance Cross-Platform Mobile Experiences",
    paragraphs: [
      "I am a passionate Flutter Developer specialized in creating beautiful, fast, and maintainable cross-platform mobile applications for iOS and Android.",
      "With a strong academic background in Computer Science & Engineering (AI specialization) and practical engineering experience at ACME INFOSOFT PRIVATE LIMITED, I bring clean architectural principles to every mobile project.",
      "My technical approach relies on Clean Architecture (Data, Domain, Presentation layers), robust state management using Riverpod/BLoC/Provider, and optimized REST API communication with Dio HTTP client."
    ],
    highlights: [
      "Material 3 & Pixel-Perfect Responsive UI",
      "Clean Architecture & Layered MVVM",
      "Dio REST API Client & Interceptors",
      "Firebase Authentication & Firestore DB",
      "State Management (Riverpod, BLoC, Provider)",
      "Performance & Widget Rebuild Optimization"
    ]
  },

  skills: [
    {
      category: "Mobile Development",
      icon: "smartphone",
      items: [
        { name: "Flutter", level: "Advanced", icon: "flutter" },
        { name: "Dart", level: "Advanced", icon: "dart" },
        { name: "Android (Native Basics)", level: "Intermediate", icon: "android" },
        { name: "Responsive UI (Material 3)", level: "Advanced", icon: "layout" }
      ]
    },
    {
      category: "State Management",
      icon: "layers",
      items: [
        { name: "Riverpod", level: "Advanced", icon: "riverpod" },
        { name: "Provider", level: "Advanced", icon: "provider" },
        { name: "BLoC", level: "Intermediate", icon: "bloc" }
      ]
    },
    {
      category: "Backend & APIs",
      icon: "server",
      items: [
        { name: "Firebase Authentication", level: "Advanced", icon: "firebase" },
        { name: "Cloud Firestore", level: "Advanced", icon: "firestore" },
        { name: "Firebase Storage", level: "Intermediate", icon: "storage" },
        { name: "REST APIs", level: "Advanced", icon: "api" },
        { name: "Dio Client", level: "Advanced", icon: "dio" }
      ]
    },
    {
      category: "Architecture & Patterns",
      icon: "cpu",
      items: [
        { name: "Clean Architecture", level: "Advanced", icon: "architecture" },
        { name: "MVVM Pattern", level: "Advanced", icon: "pattern" },
        { name: "Repository Pattern", level: "Advanced", icon: "layers" }
      ]
    },
    {
      category: "Tools & Ecosystem",
      icon: "tool",
      items: [
        { name: "Git & GitHub", level: "Advanced", icon: "git" },
        { name: "Postman", level: "Advanced", icon: "postman" },
        { name: "Android Studio", level: "Advanced", icon: "androidstudio" },
        { name: "VS Code", level: "Advanced", icon: "vscode" }
      ]
    }
  ],

  featuredProjects: [
    {
      id: "medipoints",
      name: "MediPoints — Health & Pharmacy App",
      badge: "Healthcare",
      category: "Flutter",
      shortDescription: "Medicine & healthcare mobile application featuring batch tracking, inventory logs, and clean architecture.",
      fullDescription: "MediPoints is a specialized healthcare application engineered with Flutter, Dart, and Clean Architecture. Designed to handle medicine batch numbers, stock expiration tracking, billing desk management, and REST API network synchronization.",
      image: "assets/images/medipoints_mockup.png",
      gallery: [
        "assets/images/medipoints_mockup.png"
      ],
      technologies: ["Flutter", "Dart", "Clean Architecture", "Dio Client", "REST API", "State Management", "Material 3"],
      features: [
        "Batch tracking and medicine expiry monitoring system",
        "Point of Sale (POS) receipt & billing desk interface",
        "Clean Layered Architecture (Data, Domain, Presentation)",
        "Dio HTTP networking client with custom interceptors",
        "Pixel-perfect responsive layout for tablets and phones"
      ],
      architecture: "Clean Architecture with repository pattern isolating local SQLite database and remote REST API services.",
      challenges: "Ensuring zero data loss during high-volume batch data inputs and inventory calculations.",
      solution: "Implemented offline transaction queuing and Riverpod state providers for atomic UI updates.",
      githubUrl: "https://github.com/AKASH80047/medipoints",
      liveDemoUrl: null,
      apkUrl: null,
      isFeatured: true
    },
    {
      id: "applecart",
      name: "AppleCart E-Commerce App",
      badge: "E-Commerce",
      category: "Flutter",
      shortDescription: "Modern mobile e-commerce application featuring smooth product browsing, cart state management, and Firebase synchronization.",
      fullDescription: "AppleCart is a mobile shopping app designed for clean user navigation and high responsiveness. Built with Flutter, Riverpod, and Cloud Firestore to provide real-time cart updates and seamless checkout flow.",
      image: "assets/images/applecart_mockup.png",
      gallery: [
        "assets/images/applecart_mockup.png"
      ],
      technologies: ["Flutter", "Dart", "Riverpod", "Firebase", "Cloud Firestore", "Material 3"],
      features: [
        "Dynamic Product Catalog with categories, search, and filtering",
        "Real-time Cart management powered by Riverpod state providers",
        "User authentication & profile management via Firebase Auth",
        "Cloud Firestore backend integration for order placement and history",
        "Pixel-perfect Material 3 responsive layout"
      ],
      architecture: "MVVM architecture with Riverpod state management and Repository pattern for Firestore data source.",
      challenges: "Ensuring instant visual feedback when items are added/removed from cart across multiple screens.",
      solution: "Leveraged Riverpod StateNotifier to maintain a single reactive state source across product pages and checkout drawer.",
      githubUrl: "https://github.com/AKASH80047/AppleCart-Flutter",
      liveDemoUrl: null,
      apkUrl: null,
      isFeatured: true
    },
    {
      id: "online-exam",
      name: "Online Examination System",
      badge: "Education",
      category: "Flutter",
      shortDescription: "Interactive online quiz and examination app with timed tests, dynamic questions, and instant score analytics.",
      fullDescription: "Comprehensive mobile assessment application built for educational institutions and online testing. Features real-time countdown timers, question navigation, auto-evaluation, and historical score reports.",
      image: "assets/images/exam_mockup.png",
      gallery: [
        "assets/images/exam_mockup.png"
      ],
      technologies: ["Flutter", "Firebase", "Cloud Firestore", "Riverpod", "Dart"],
      features: [
        "Live exam timer with auto-submit upon expiration",
        "Dynamic question bank fetched from Cloud Firestore",
        "Student score card generation and result analytics",
        "Secure student authentication and exam attempt tracking",
        "Clean, distraction-free examination user interface"
      ],
      architecture: "Layered architecture isolating exam timer logic, Firestore service, and UI widgets.",
      challenges: "Preventing accidental app exits or state loss during active timed exams.",
      solution: "Utilized Flutter PopScope widget and Riverpod persistent state to cache answers locally in real-time.",
      githubUrl: "https://github.com/AKASH80047/Online-Examination-System",
      liveDemoUrl: null,
      apkUrl: null,
      isFeatured: true
    },
    {
      id: "employee-attendance",
      name: "Industry-Level Employee Management",
      badge: "Enterprise",
      category: "Flutter",
      shortDescription: "Mobile attendance logging and workforce management app with geofenced location verification and leave requests.",
      fullDescription: "A practical workforce mobile app allowing employees to log daily attendance, view monthly shift records, submit leave applications, and view manager approvals.",
      image: "assets/images/attendance_mockup.png",
      gallery: [
        "assets/images/attendance_mockup.png"
      ],
      technologies: ["Flutter", "Firebase", "REST API", "Dio", "Riverpod", "GPS Location"],
      features: [
        "Geofenced check-in and check-out tracking",
        "Monthly attendance calendar with color-coded status badges",
        "Leave request submission & tracking workflow",
        "Backend sync via Dio HTTP client and Firebase Auth",
        "Offline log buffering for unreliable connectivity"
      ],
      architecture: "Repository pattern isolating GPS location services and HTTP Dio network requests.",
      challenges: "Handling location precision and network drops during punch-in timestamps.",
      solution: "Created local caching layer that syncs queued punch events when connection is restored.",
      githubUrl: "https://github.com/AKASH80047/Industry-Level-Workflow-Employee-Management-System",
      liveDemoUrl: null,
      apkUrl: null,
      isFeatured: true
    },
    {
      id: "dairy-farming",
      name: "Startup Dairy Farming App",
      badge: "AgriTech",
      category: "Flutter",
      shortDescription: "Smart livestock & dairy farm management mobile application for milk yield tracking and record keeping.",
      fullDescription: "Mobile management system tailored for dairy farm owners to record daily milk yield, manage livestock health schedules, log feed consumption, and generate weekly analytics.",
      image: "assets/images/dairy_mockup.png",
      gallery: [
        "assets/images/dairy_mockup.png"
      ],
      technologies: ["Flutter", "Dart", "Provider", "Local DB", "Analytics"],
      features: [
        "Daily milk yield logging per cattle ID",
        "Weekly production analytics & yield trends",
        "Feed inventory & medication schedule reminders",
        "Exportable farm record summaries"
      ],
      architecture: "Provider pattern with local SQLite persistent storage.",
      challenges: "Designing an intuitive interface simple enough for non-technical field workers.",
      solution: "Built icon-driven high contrast UI buttons with instant visual feedback.",
      githubUrl: "https://github.com/AKASH80047/Startup-Dairy-forming-project-",
      liveDemoUrl: "https://web-two-gamma-52.vercel.app/#/home",
      apkUrl: null,
      isFeatured: true
    },
    {
      id: "peblo-ai",
      name: "Peblo AI Story Buddy",
      badge: "AI & EdTech",
      category: "Flutter",
      shortDescription: "Interactive AI story generator and quiz buddy mobile app built for children learning.",
      fullDescription: "Peblo AI Story Buddy is an innovative educational Flutter app engineered for interactive storytelling and dynamic AI quiz generation.",
      image: "assets/images/peblo_mockup.png",
      gallery: [
        "assets/images/peblo_mockup.png"
      ],
      technologies: ["Flutter", "Dart", "REST API", "AI Integration", "Riverpod"],
      features: [
        "AI-generated story prompts and child-friendly tales",
        "Interactive comprehension quiz generator",
        "Vibrant, kid-friendly UI theme and audio cues",
        "Smooth state management with Riverpod"
      ],
      architecture: "Clean presentation layer with decoupled AI API client service.",
      challenges: "Handling variable AI completion times without blocking UI animation.",
      solution: "Used async stream builders and shimmer loading placeholders.",
      githubUrl: "https://github.com/AKASH80047/Peblo-AI-Story-Buddy",
      liveDemoUrl: null,
      apkUrl: null,
      isFeatured: true
    },
    {
      id: "flutter-ui-animation",
      name: "Flutter UI Animation Showcase",
      badge: "UI Showcase",
      category: "Flutter",
      shortDescription: "Collection of custom Flutter animations, hero transitions, implicit/explicit motion, and custom painters.",
      fullDescription: "A dedicated repository showcasing Flutter UI craftsmanship, custom physics animations, Hero transitions, gesture motion, and custom painter canvas graphics.",
      image: "assets/images/animation_project.svg",
      gallery: [
        "assets/images/animation_project.svg"
      ],
      technologies: ["Flutter", "Dart", "Custom Painter", "Physics Motion", "Material 3"],
      features: [
        "Custom Painter canvas graphics and particle effects",
        "60fps smooth implicit and explicit animation controllers",
        "Hero transitions between complex view trees",
        "Interactive gesture-driven UI cards"
      ],
      architecture: "Modular UI widget showcase isolating custom animation delegates.",
      challenges: "Maintaining 60fps performance on low-end mobile hardware.",
      solution: "Used repaint boundaries and const widget constructors to avoid unnecessary repaints.",
      githubUrl: "https://github.com/AKASH80047/Flutter-UI-Animation",
      liveDemoUrl: null,
      apkUrl: null,
      isFeatured: true
    }
  ],

  experience: [
    {
      role: "Flutter Developer Intern",
      company: "ACME INFOSOFT PRIVATE LIMITED",
      location: "Delhi, India",
      period: "6 Months (2026)",
      type: "Commercial Internship",
      description: "Engineered scalable, production-ready cross-platform mobile apps using Flutter & Dart over a 6-month commercial internship.",
      bullets: [
        "Built responsive, pixel-perfect user interface components following Material 3 guidelines for modular widget architecture.",
        "Implemented Riverpod state management and Clean Architecture (Data, Domain, Presentation layers) for high code maintainability.",
        "Integrated 20+ backend REST APIs using Dio HTTP client and synchronized dynamic Firebase Authentication and Firestore database.",
        "Diagnosed and resolved production bug tickets, optimized widget rebuild trees, and collaborated via Git/GitHub in Agile sprints."
      ],
      technologies: ["Flutter", "Dart", "Riverpod", "Dio", "REST API", "Firebase Auth", "Firestore", "Clean Architecture", "Material 3", "Git"]
    }
  ],

  education: [
    {
      degree: "B.Tech — Computer Science & Engineering",
      specialization: "Specialization: Artificial Intelligence",
      institution: "Galgotias College of Engineering & Technology",
      location: "Greater Noida, UP",
      period: "2022 — 2026",
      score: "CGPA: 7.51",
      details: "Core coursework: Data Structures, Algorithms, Software Engineering, Artificial Intelligence, Mobile Application Development, Database Systems."
    },
    {
      degree: "12th Grade (Senior Secondary)",
      specialization: "Science & Mathematics (UP Board)",
      institution: "Praxis Vidyapeeth Basti",
      location: "Basti, UP",
      period: "2020 — 2021",
      score: "Percentage: 80%",
      details: "Focused on Physics, Chemistry, and Mathematics."
    },
    {
      degree: "10th Grade (Secondary)",
      specialization: "General Science & Mathematics (UP Board)",
      institution: "RPJ Saraswati Vidya Mandir Siddharth",
      location: "UP",
      period: "2018 — 2019",
      score: "Percentage: 78%",
      details: "Completed secondary education with honors in Mathematics."
    }
  ],

  certifications: [
    {
      title: "Flutter & Dart - Complete Mobile App Development",
      issuer: "Udemy",
      description: "Mastered cross-platform engineering, Riverpod, Dio REST APIs, and Firebase backends."
    },
    {
      title: "Advanced Flutter UI/UX & Animations",
      issuer: "Udemy",
      description: "Specialized in building pixel-perfect mobile interfaces, custom painter animations, and Material 3 design."
    }
  ],

  services: [
    {
      icon: "smartphone",
      title: "Flutter Mobile Apps",
      description: "Build high-performance, cross-platform Android & iOS applications using Flutter & Dart with clean, maintainable code."
    },
    {
      icon: "flame",
      title: "Firebase Applications",
      description: "Setup robust Firebase Auth, Cloud Firestore databases, Firebase Storage, and FCM real-time push notifications."
    },
    {
      icon: "globe",
      title: "REST API Integration",
      description: "Connect mobile frontends to complex backend APIs using Dio HTTP client with custom token refresh interceptors."
    },
    {
      icon: "palette",
      title: "UI Development",
      description: "Convert Figma/Adobe designs into responsive, pixel-perfect Flutter widgets with dynamic animations and dark mode support."
    },
    {
      icon: "layers",
      title: "Admin Panels & Business Systems",
      description: "CRM, attendance tracking, examination platforms, and operational management systems with clean architecture."
    },
    {
      icon: "wrench",
      title: "App Maintenance & Optimization",
      description: "Diagnose widget rebuild performance issues, resolve production bugs, optimize startup load times, and upgrade packages."
    }
  ],

  themePresets: {
    accentColors: [
      { name: "Flutter Blue", value: "#0175C2", darkValue: "#38BDF8" },
      { name: "Purple", value: "#7C3AED", darkValue: "#A78BFA" },
      { name: "Emerald Green", value: "#10B981", darkValue: "#34D399" },
      { name: "Amber Orange", value: "#F59E0B", darkValue: "#FBBF24" },
      { name: "Crimson Red", value: "#EF4444", darkValue: "#F87171" },
      { name: "Monochrome", value: "#6B7280", darkValue: "#9CA3AF" }
    ],
    defaultMode: "dark",
    defaultAccent: "#0175C2"
  }
};

// Export configuration globally for browser scripts
window.PORTFOLIO_CONFIG = PORTFOLIO_CONFIG;

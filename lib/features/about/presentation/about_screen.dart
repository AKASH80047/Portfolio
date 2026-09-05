import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/constants/portfolio_constants.dart';
import '../../../core/utils/url_launcher_util.dart';
import '../../../shared/widgets/next_section_banner.dart';
import '../../../shared/widgets/profile_avatar.dart';

class AboutScreen extends StatelessWidget {
  final VoidCallback? onViewProjects;
  final VoidCallback? onNextSection;

  const AboutScreen({super.key, this.onViewProjects, this.onNextSection});

  Future<void> _launchUrl(String urlString) async {
    await UrlLauncherUtil.openUrl(urlString);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final profileCards = [
      {
        "title": "Flutter & AI Engineer",
        "subtitle": "Mobile & Generative AI Architect",
        "icon": Icons.psychology,
      },
      {
        "title": "⭐ Top-Rated Freelancer",
        "subtitle": "100% Job Success Score (Upwork/Direct)",
        "icon": Icons.star,
      },
      {
        "title": "🌍 45+ Global Deliveries",
        "subtitle": "USA, UK, Germany, UAE & India",
        "icon": Icons.public,
      },
      {
        "title": "B.Tech CSE Graduate",
        "subtitle": "Galgotias College (CGPA: 7.51)",
        "icon": Icons.school_outlined,
      },
    ];

    final whatIBuildCards = [
      {
        "title": "Generative AI & Agentic Workflows",
        "desc":
            "Multi-Agent copilots, real-time streaming LLM chat (GPT-4o, Claude 3.5, Gemini 1.5), Vector RAG semantic search (Pinecone), and LangChain orchestration.",
        "tech": "GenAI • Vector RAG • Pinecone • WebSockets",
        "icon": Icons.psychology_outlined,
      },
      {
        "title": "Cross-Platform Mobile Applications",
        "desc":
            "High-performance iOS, Android & Web apps with responsive interfaces, pixel-perfect Material 3 design, 60fps animations, and native platform bindings.",
        "tech": "Flutter • Dart • iOS • Android",
        "icon": Icons.phone_android,
      },
      {
        "title": "API-Driven & Real-Time Microservices",
        "desc":
            "Enterprise production apps integrated with 100+ REST APIs and WebSockets via Dio HTTP client, handling JWT token rotation, offline caching, and retry interceptors.",
        "tech": "REST API • Dio • WebSockets • Caching",
        "icon": Icons.cloud_sync_outlined,
      },
      {
        "title": "Clean Architecture & State Management",
        "desc":
            "Scalable software architectures structured into Presentation, Domain (Use Cases), and Data (Repositories) layers using Riverpod 2.0 & BLoC state management.",
        "tech": "Riverpod 2.0 • BLoC • Clean Architecture",
        "icon": Icons.account_tree_outlined,
      },
    ];

    final workflowSteps = [
      {
        "step": "01",
        "title": "REQUIREMENT ANALYSIS",
        "desc":
            "Analyze user story, business objectives, and workflow edge cases.",
      },
      {
        "step": "02",
        "title": "UI/UX DESIGN",
        "desc":
            "Wireframe responsive layouts with clean Material 3 component hierarchy.",
      },
      {
        "step": "03",
        "title": "ARCHITECT & STATE",
        "desc":
            "Establish Clean Architecture layers, data models, and Riverpod/BLoC providers.",
      },
      {
        "step": "04",
        "title": "BUILD & MODULARIZE",
        "desc":
            "Develop modular, reusable Flutter widgets following DRY principles.",
      },
      {
        "step": "05",
        "title": "API & CLOUD INTEGRATION",
        "desc":
            "Connect Dio REST client, interceptors, Firebase Auth, and Firestore databases.",
      },
      {
        "step": "06",
        "title": "TEST & OPTIMIZE",
        "desc":
            "Execute unit/widget tests, resolve edge cases, eliminate unnecessary rebuilds, and optimize app size.",
      },
    ];

    final engineeringFocusItems = [
      {
        "title": "State Management Mastery",
        "desc":
            "Managing application state predictably using Riverpod 2.x, BLoC, or Provider based on project requirements.",
        "icon": Icons.layers_outlined,
      },
      {
        "title": "Dio REST API Interceptors",
        "desc":
            "Handling bearer token refresh, retries, request logging, and error mapping centrally via Dio interceptors.",
        "icon": Icons.api_outlined,
      },
      {
        "title": "Clean Architecture Layers",
        "desc":
            "Decoupling business logic from UI widgets and data source repositories to enable unit testing and team collaboration.",
        "icon": Icons.architecture_outlined,
      },
      {
        "title": "Firebase Infrastructure",
        "desc":
            "Provisioning Firestore security rules, Firebase Authentication, Cloud Storage, and FCM Push Notifications.",
        "icon": Icons.cloud_outlined,
      },
      {
        "title": "Performance Optimization",
        "desc":
            "Minimizing rebuild cycles, leveraging const constructors, lazy loading list items, and optimizing image assets.",
        "icon": Icons.speed_outlined,
      },
      {
        "title": "Git & CI/CD Discipline",
        "desc":
            "Maintaining clean Git commit histories, feature branching, pull request reviews, and GitHub Actions CI/CD automation.",
        "icon": Icons.precision_manufacturing_outlined,
      },
    ];

    final developerMindsetCards = [
      {
        "title": "Clean Code & SOLID Principles",
        "desc":
            "Writing clean, self-documenting code with single-responsibility classes that stay maintainable as projects scale.",
        "icon": Icons.code_outlined,
      },
      {
        "title": "User-Centric UX Design",
        "desc":
            "Prioritizing fast load times, intuitive navigation, responsive layouts, and accessible touch targets.",
        "icon": Icons.touch_app_outlined,
      },
      {
        "title": "Production Reliability",
        "desc":
            "Ensuring loading, error, and offline empty states are properly handled rather than failing silently.",
        "icon": Icons.verified_user_outlined,
      },
      {
        "title": "Continuous Learning",
        "desc":
            "Staying updated with Flutter release notes, Dart feature enhancements, and modern cross-platform patterns.",
        "icon": Icons.auto_stories_outlined,
      },
    ];

    return SingleChildScrollView(
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. HERO & BIO SECTION
              Text(
                'ABOUT AKASH PANDEY',
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Building Production-Ready Mobile Applications with Flutter & Clean Architecture.',
                style: theme.textTheme.headlineLarge,
              ),
              const SizedBox(height: 12),

              // Comprehensive Bio Card
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ProfileAvatar(size: 64, borderWidth: 2),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 8,
                                  children: [
                                    Text(
                                      PortfolioConstants.name,
                                      style: theme.textTheme.headlineMedium
                                          ?.copyWith(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    const Text(
                                      PortfolioConstants.flag,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Flutter Developer @ ACME INFOSOFT (Currently Working)',
                                  style: TextStyle(
                                    color: theme.colorScheme.primary,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      size: 16,
                                      color: theme.colorScheme.outline,
                                    ),
                                    const SizedBox(width: 4),
                                    Expanded(
                                      child: Text(
                                        '${PortfolioConstants.location} • Open for Remote & Onsite Opportunities',
                                        style: TextStyle(
                                          color: theme
                                              .colorScheme
                                              .onSurfaceVariant,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Divider(),
                      const SizedBox(height: 20),
                      Text(
                        "I am a results-driven Flutter Developer currently working at ACME INFOSOFT, building production-ready, cross-platform mobile applications for iOS and Android.",
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontSize: 16,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        "I hold a Bachelor of Technology (B.Tech) degree in Computer Science & Engineering from Galgotias College of Engineering & Technology (CGPA: 7.51), specializing in Artificial Intelligence. My development core relies on Clean Architecture (Data, Domain, Presentation layers), robust state management using Riverpod 2.x, BLoC, and Provider, and high-performance HTTP networking with Dio.",
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontSize: 15,
                          height: 1.6,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        "Throughout my professional engineering work at ACME INFOSOFT and independent projects, I have integrated over 100+ REST API endpoints (with custom token refresh interceptors and logging), configured Firebase backend cloud services (Auth, Firestore, Cloud Storage, FCM), and resolved 100+ production bug tickets to ensure smooth user experiences.",
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontSize: 15,
                          height: 1.6,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF25D366),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                            ),
                            icon: const FaIcon(
                              FontAwesomeIcons.whatsapp,
                              size: 18,
                            ),
                            label: const Text(
                              'Direct WhatsApp Chat',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            onPressed: () =>
                                _launchUrl(PortfolioConstants.whatsappUrl),
                          ),
                          OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                            ),
                            icon: const FaIcon(FontAwesomeIcons.github, size: 18),
                            label: const Text(
                              'GitHub (@AKASH80047)',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            onPressed: () =>
                                _launchUrl(PortfolioConstants.githubUrl),
                          ),
                          OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                            ),
                            icon: const FaIcon(FontAwesomeIcons.linkedin, size: 18, color: Color(0xFF0A66C2)),
                            label: const Text(
                              'LinkedIn Profile',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            onPressed: () =>
                                _launchUrl(PortfolioConstants.linkedinUrl),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Quick Highlight Cards
              LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth >= 700;
                  final itemWidth = isWide
                      ? (constraints.maxWidth - 48) / 4
                      : (constraints.maxWidth - 16) / 2;
                  return Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: profileCards.map((card) {
                      return SizedBox(
                        width: itemWidth,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(
                                  card["icon"] as IconData,
                                  color: theme.colorScheme.primary,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        card["title"] as String,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        card["subtitle"] as String,
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: theme
                                              .colorScheme
                                              .onSurfaceVariant,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
              const SizedBox(height: 14),

              // 2. QUICK METRICS MATRIX
              LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth >= 768;
                  final cardWidth = isWide
                      ? (constraints.maxWidth - 48) / 4
                      : (constraints.maxWidth - 16) / 2;
                  return Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: PortfolioConstants.stats.map((stat) {
                      return SizedBox(
                        width: cardWidth,
                        child: Card(
                          elevation: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  stat["value"]!,
                                  style: theme.textTheme.headlineLarge
                                      ?.copyWith(
                                        color: theme.colorScheme.primary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 26,
                                      ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  stat["label"]!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  stat["sub"]!,
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: theme.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
              const SizedBox(height: 16),

              // 3. WORK EXPERIENCE & ROLE
              Text(
                'COMMERCIAL EXPERIENCE',
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'WORK HISTORY & EXPERIENCE',
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        spacing: 12,
                        runSpacing: 8,
                        children: [
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 600),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Flutter Developer',
                                  style: theme.textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'ACME INFOSOFT • Full-Time Role',
                                  style: TextStyle(
                                    color: theme.colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary.withValues(
                                alpha: 0.12,
                              ),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: theme.colorScheme.primary.withValues(
                                  alpha: 0.3,
                                ),
                              ),
                            ),
                            child: Text(
                              'Currently Working',
                              style: TextStyle(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Divider(),
                      const SizedBox(height: 16),
                      const Text(
                        'Key Commercial Engineering Impact:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildBulletPoint(
                        theme,
                        'Mobile App Engineering: Developed production-ready Flutter applications for iOS and Android platforms using Dart.',
                      ),
                      _buildBulletPoint(
                        theme,
                        'REST API Integration: Integrated 100+ REST API endpoints using Dio HTTP client with custom interceptors for bearer authentication, logging, and error handling.',
                      ),
                      _buildBulletPoint(
                        theme,
                        'State Management: Architected application state using Riverpod and Provider for predictable UI data flow and business logic separation.',
                      ),
                      _buildBulletPoint(
                        theme,
                        'Bug Resolution: Diagnosed and resolved 100+ production bug tickets, improving stability, load times, and memory efficiency.',
                      ),
                      _buildBulletPoint(
                        theme,
                        'Agile Collaboration: Utilized Git for version control, feature branching, pull request code reviews, and daily agile standups.',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        spacing: 12,
                        runSpacing: 8,
                        children: [
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 600),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'AI & Mobile Engineer',
                                  style: theme.textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Handshake Platform & AI Networks • Part-Time / Contract',
                                  style: TextStyle(
                                    color: theme.colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF10B981).withValues(
                                alpha: 0.12,
                              ),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: const Color(0xFF10B981).withValues(
                                  alpha: 0.3,
                                ),
                              ),
                            ),
                            child: const Text(
                              'Part-Time & Active',
                              style: TextStyle(
                                color: Color(0xFF34D399),
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Divider(),
                      const SizedBox(height: 16),
                      const Text(
                        'Key Part-Time Engineering Impact:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildBulletPoint(
                        theme,
                        'Generative AI & LLMs: Engineered multi-agent AI workflows and streaming completions using OpenAI GPT-4o, Google Gemini 1.5 Pro, and Claude 3.5.',
                      ),
                      _buildBulletPoint(
                        theme,
                        'Vector RAG Architecture: Built semantic retrieval pipelines over enterprise documents using Pinecone vector database with source citation grounding.',
                      ),
                      _buildBulletPoint(
                        theme,
                        'Companion Mobile Tools: Developed cross-platform Flutter companion interfaces for real-time prompt chaining, WebSocket telemetry, and session caching.',
                      ),
                      _buildBulletPoint(
                        theme,
                        'Autonomous Agent Tooling: Implemented LangChain tool definitions, structured JSON schema validations, and automated prompt benchmark testing.',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // 4. EDUCATION & ACADEMIC HIGHLIGHTS
              Text(
                'EDUCATION',
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'ACADEMIC BACKGROUND',
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        spacing: 8,
                        runSpacing: 6,
                        children: [
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 600),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Bachelor of Technology (B.Tech) - Computer Science & Engineering',
                                  style: theme.textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'Galgotias College of Engineering & Technology',
                                  style: TextStyle(
                                    color: theme.colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.secondary.withValues(
                                alpha: 0.12,
                              ),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: theme.colorScheme.secondary.withValues(
                                  alpha: 0.3,
                                ),
                              ),
                            ),
                            child: Text(
                              'CGPA: 7.51 / 10',
                              style: TextStyle(
                                color: theme.colorScheme.secondary,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(),
                      const SizedBox(height: 8),
                      Text(
                        'Specialization & Focus: Artificial Intelligence & Mobile Computing',
                        style: TextStyle(
                          color: theme.colorScheme.onSurfaceVariant,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children:
                            [
                                  'Data Structures & Algorithms',
                                  'Object-Oriented Programming (OOP)',
                                  'Mobile Application Engineering',
                                  'Database Management Systems (DBMS)',
                                  'Software Engineering & Agile',
                                  'Artificial Intelligence & ML',
                                ]
                                .map(
                                  (subject) => Chip(
                                    label: Text(
                                      subject,
                                      style: const TextStyle(fontSize: 11),
                                    ),
                                    padding: EdgeInsets.zero,
                                    visualDensity: VisualDensity.compact,
                                    backgroundColor: theme
                                        .colorScheme
                                        .surfaceContainerHighest,
                                  ),
                                )
                                .toList(),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // 5. PROFESSIONAL CERTIFICATIONS
              Text(
                'CERTIFICATIONS',
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'CONTINUOUS LEARNING & CERTIFICATIONS',
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: 10),
              LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth >= 768;
                  final cardWidth = isWide
                      ? (constraints.maxWidth - 16) / 2
                      : double.infinity;
                  return Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: PortfolioConstants.certifications.map((cert) {
                      return SizedBox(
                        width: cardWidth,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.workspace_premium,
                                      color: theme.colorScheme.primary,
                                      size: 22,
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        cert["title"]!,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme.primary.withValues(
                                      alpha: 0.12,
                                    ),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    'Issuer: ${cert["issuer"]!}',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: theme.colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  cert["desc"]!,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontSize: 12,
                                    height: 1.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
              const SizedBox(height: 16),

              // 6. WHAT I BUILD (CAPABILITIES)
              Text(
                'CAPABILITIES',
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 4),
              Text('WHAT I BUILD', style: theme.textTheme.headlineMedium),
              const SizedBox(height: 10),
              LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth >= 768;
                  final itemWidth = isWide
                      ? (constraints.maxWidth - 16) / 2
                      : double.infinity;
                  return Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: whatIBuildCards.map((item) {
                      return SizedBox(
                        width: itemWidth,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: theme.colorScheme.primary
                                            .withValues(alpha: 0.12),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Icon(
                                        item["icon"] as IconData,
                                        color: theme.colorScheme.primary,
                                        size: 20,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        item["title"] as String,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  item["desc"] as String,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontSize: 12,
                                    height: 1.3,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 3,
                                  ),
                                  decoration: BoxDecoration(
                                    color: theme
                                        .colorScheme
                                        .surfaceContainerHighest,
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                      color: theme.colorScheme.outline
                                          .withValues(alpha: 0.2),
                                    ),
                                  ),
                                  child: Text(
                                    'Technology: ${item["tech"]}',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: theme.colorScheme.primary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
              const SizedBox(height: 16),

              // 8. ENGINEERING WORKFLOW
              Text(
                'WORKFLOW',
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'HOW I BUILD APPLICATIONS',
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: 10),
              LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth >= 900;
                  final itemWidth = isWide
                      ? (constraints.maxWidth - 32) / 3
                      : double.infinity;
                  return Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: workflowSteps.map((s) {
                      return SizedBox(
                        width: itemWidth,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      s["step"] as String,
                                      style: TextStyle(
                                        color: theme.colorScheme.primary,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      size: 16,
                                      color: theme.colorScheme.outline
                                          .withValues(alpha: 0.5),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  s["title"] as String,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  s["desc"] as String,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
              const SizedBox(height: 16),

              // 9. ENGINEERING FOCUS
              Text(
                'PRACTICES',
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'ENGINEERING DISCIPLINES',
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: 10),
              LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth >= 768;
                  final itemWidth = isWide
                      ? (constraints.maxWidth - 16) / 2
                      : double.infinity;
                  return Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: engineeringFocusItems.map((item) {
                      return SizedBox(
                        width: itemWidth,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  item["icon"] as IconData,
                                  color: theme.colorScheme.primary,
                                  size: 20,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item["title"] as String,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        item["desc"] as String,
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
              const SizedBox(height: 16),

              // 11. DEVELOPER MINDSET
              Text(
                'CORE VALUES',
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'WHAT GUIDES MY CODE',
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: 10),
              LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth >= 768;
                  final itemWidth = isWide
                      ? (constraints.maxWidth - 16) / 2
                      : double.infinity;
                  return Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: developerMindsetCards.map((card) {
                      return SizedBox(
                        width: itemWidth,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  card["icon"] as IconData,
                                  color: theme.colorScheme.primary,
                                  size: 20,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        card["title"] as String,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        card["desc"] as String,
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
              const SizedBox(height: 16),

              // 12. BEYOND UI CALLOUT
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      theme.colorScheme.primary.withValues(alpha: 0.15),
                      theme.colorScheme.primary.withValues(alpha: 0.05),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: theme.colorScheme.primary.withValues(alpha: 0.3),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.psychology_outlined,
                          color: theme.colorScheme.primary,
                          size: 22,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'BEYOND UI',
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.w900,
                            fontSize: 14,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '"I focus not only on how an application looks, but also on how it behaves under network latency, handles state mutations, manages background data, and scales across releases."',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontSize: 15,
                        height: 1.3,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // 13. CALL TO ACTION CARD
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    children: [
                      Text(
                        "Want to explore my engineering work?",
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Browse through case studies, live demos, and verified GitHub source code repositories.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      const SizedBox(height: 14),
                      Wrap(
                        spacing: 12,
                        runSpacing: 10,
                        alignment: WrapAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: theme.colorScheme.primary,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 10,
                              ),
                            ),
                            icon: const Icon(Icons.rocket_launch, size: 16),
                            label: const Text(
                              'View All Projects →',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                            onPressed: () {
                              if (onViewProjects != null) {
                                onViewProjects!();
                              }
                            },
                          ),
                          OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 10,
                              ),
                            ),
                            icon: const FaIcon(FontAwesomeIcons.github, size: 16),
                            label: const Text(
                              'Visit GitHub Profile →',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                            onPressed: () =>
                                _launchUrl(PortfolioConstants.githubUrl),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // NEXT SECTION BANNER
              if (onNextSection != null)
                NextSectionBanner(
                  title: 'Live Demos & Featured Projects',
                  subtitle: 'Explore 8+ commercial apps, AI platforms & Clean Architecture studies',
                  icon: Icons.rocket_launch_outlined,
                  accentColor: const Color(0xFF10B981),
                  onTap: onNextSection!,
                ),

              // 14. FINAL FOOTER QUOTE
              Center(
                child: Text(
                  '"A high-quality Flutter application is built on solid architecture, predictable state management, resilient data flow, and intuitive user experiences."',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: theme.colorScheme.outline,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBulletPoint(ThemeData theme, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle_outline,
            size: 18,
            color: theme.colorScheme.primary,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: theme.textTheme.bodyMedium?.copyWith(height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}

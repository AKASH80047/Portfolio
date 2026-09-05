import 'package:flutter/material.dart';
import '../../../shared/widgets/next_section_banner.dart';

class SkillsScreen extends StatefulWidget {
  final VoidCallback? onNextSection;

  const SkillsScreen({super.key, this.onNextSection});

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  int _activeSkillIndex = 0;

  final List<Map<String, dynamic>> _topCircularSkills = [
    {
      "name": "GenAI & LLMs",
      "level": 0.94,
      "icon": Icons.psychology,
      "color": const Color(0xFF10B981), // Emerald Green
      "badge": "Flagship Proven",
      "proof": "Handshake AI Multi-Agent & RAG Workspace",
      "desc": "OpenAI GPT-4o, Gemini 1.5 Pro, Claude 3.5, streaming SSE completions, Vector RAG (Pinecone), and LangChain agent tools."
    },
    {
      "name": "Flutter 3.24",
      "level": 0.96,
      "icon": Icons.smartphone,
      "color": const Color(0xFF0288D1), // Flutter Blue
      "badge": "Production Proven",
      "proof": "Handshake AI, Feel Every Beat, MediPoints, AppleCart",
      "desc": "Cross-platform mobile development, custom widget trees, Material 3 theme design, and responsive layout architectures."
    },
    {
      "name": "Dart 3",
      "level": 0.92,
      "icon": Icons.code,
      "color": const Color(0xFF3F51B5), // Indigo Blue
      "badge": "Production Proven",
      "proof": "Core language for all 8 featured projects & AI workflows",
      "desc": "Pattern matching, sealed class hierarchies, async/await streams, FFI bindings, and extension methods."
    },
    {
      "name": "Riverpod 2.x",
      "level": 0.94,
      "icon": Icons.layers,
      "color": const Color(0xFF2E7D32), // Forest Emerald Green
      "badge": "Production Proven",
      "proof": "Handshake AI, Feel Every Beat, MediPoints POS & AppleCart",
      "desc": "StateNotifier & AsyncNotifier providers, selective watching, atomic UI updates, and scoped state disposal."
    },
    {
      "name": "Dio & WebSockets",
      "level": 0.92,
      "icon": Icons.http,
      "color": const Color(0xFFE65100), // Deep Coral Orange
      "badge": "Production Proven",
      "proof": "100+ REST APIs & real-time streaming sockets",
      "desc": "Custom OAuth token refresh interceptors, request logging, connection timeout handling, and bi-directional WebSockets."
    },
    {
      "name": "Clean Arch",
      "level": 0.92,
      "icon": Icons.account_tree,
      "color": const Color(0xFF7B1FA2), // Royal Violet Purple
      "badge": "Production Proven",
      "proof": "Handshake AI, MediPoints & Support CRM",
      "desc": "3-layer decoupling (Data, Domain, Presentation) for high testability and maintainable enterprise codebases."
    },
    {
      "name": "Vector RAG & DB",
      "level": 0.90,
      "icon": Icons.storage,
      "color": const Color(0xFF8B5CF6), // Purple
      "badge": "Production Proven",
      "proof": "Pinecone & ChromaDB in Handshake AI",
      "desc": "Dense vector embeddings, cosine similarity search, chunking strategies, and hybrid semantic retrieval."
    },
    {
      "name": "Firestore DB",
      "level": 0.90,
      "icon": Icons.cloud_done,
      "color": const Color(0xFFC2185B), // Raspberry Pink
      "badge": "Production Proven",
      "proof": "AppleCart & Online Examination System",
      "desc": "Real-time document snapshot listeners, Firestore security rules, transactions, and offline cache sync."
    },
    {
      "name": "GitHub CI/CD",
      "level": 0.90,
      "icon": Icons.precision_manufacturing,
      "color": const Color(0xFFF57F17), // Bright Amber Gold
      "badge": "Production Proven",
      "proof": "Automated pipelines (.github/workflows)",
      "desc": "Automated CI/CD pipelines running static analysis (flutter analyze), unit tests, and release builds."
    },
    {
      "name": "Material 3 UI",
      "level": 0.94,
      "icon": Icons.palette_outlined,
      "color": const Color(0xFF00838F), // Deep Cyan Teal
      "badge": "Production Proven",
      "proof": "Adaptive Design across Mobile & Web",
      "desc": "Dynamic color schemes, responsive navigation rails, slivers, glassmorphism, and fluid micro-animations."
    },
  ];

  void _showSkillDetails(BuildContext context, Map<String, dynamic> skill) {
    final theme = Theme.of(context);
    final String name = (skill["name"] as String?) ?? 'Skill Details';
    final double level = (skill["level"] as double?) ?? 0.90;
    final IconData icon = (skill["icon"] as IconData?) ?? Icons.verified;
    final Color color = (skill["color"] as Color?) ?? theme.colorScheme.primary;
    final String badge = (skill["badge"] as String?) ?? 'Production Proven';
    final String proof = (skill["proof"] as String?) ?? 'Implemented in Commercial Repositories';
    final String desc = (skill["desc"] as String?) ?? 'Production mobile app feature implementation.';
    final int percentage = (level * 100).round();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(28.0),
        decoration: BoxDecoration(
          color: theme.dialogBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
          boxShadow: const [BoxShadow(color: Colors.black38, blurRadius: 20)],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: theme.colorScheme.outline.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.18),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(icon, color: color, size: 32),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: theme.textTheme.headlineMedium?.copyWith(fontSize: 20)),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          badge,
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '$percentage%',
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: LinearProgressIndicator(
                value: level,
                backgroundColor: color.withOpacity(0.15),
                color: color,
                minHeight: 10,
              ),
            ),
            const SizedBox(height: 20),
            Text('Overview & Technical Scope', style: theme.textTheme.headlineMedium?.copyWith(fontSize: 16)),
            const SizedBox(height: 8),
            Text(desc, style: theme.textTheme.bodyLarge),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: theme.colorScheme.outline.withOpacity(0.2)),
              ),
              child: Row(
                children: [
                  Icon(Icons.verified, color: color, size: 20),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Architectural Proof', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                        const SizedBox(height: 2),
                        Text(proof, style: TextStyle(color: color, fontSize: 13, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: color, foregroundColor: Colors.white),
                onPressed: () => Navigator.pop(context),
                child: const Text('Close Details'),
              ),
            ),
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final activeSkill = _topCircularSkills[_activeSkillIndex];
    final activeColor = (activeSkill["color"] as Color?) ?? theme.colorScheme.primary;

    final skillCategories = [
      {
        "title": "Mobile Application Engineering",
        "icon": Icons.smartphone,
        "subtitle": "Core Flutter & Dart cross-platform expertise",
        "skills": [
          {
            "name": "Flutter Framework & Dart 3",
            "level": 0.95,
            "badge": "Production Proven",
            "proof": "Implemented in MediPoints, AppleCart, Dairy Farming",
            "desc": "Custom widget trees, Material 3 design system, responsive breakpoints, sealed classes, pattern matching."
          },
          {
            "name": "Responsive & Adaptive Layouts",
            "level": 0.92,
            "badge": "Production Proven",
            "proof": "Tested on Mobile, Tablet & Desktop Web",
            "desc": "LayoutBuilder, MediaQuery, Slivers, constraints-based adaptive UI components."
          },
          {
            "name": "Custom UI & Micro-Animations",
            "level": 0.88,
            "badge": "Core Competency",
            "proof": "Fluid Page Transitions & Hero Animations",
            "desc": "Implicit/Explicit animations, Hero widgets, custom painters, and touch interaction feedback."
          },
        ]
      },
      {
        "title": "State Management Architecture",
        "icon": Icons.layers,
        "subtitle": "Predictable, reactive & decoupled application state",
        "skills": [
          {
            "name": "Riverpod (StateNotifier & AsyncNotifier)",
            "level": 0.92,
            "badge": "Production Proven",
            "proof": "MediPoints POS Cart & AppleCart E-Commerce",
            "desc": "Atomic state management, selective provider watching, auto-dispose, and reactive UI synchronization."
          },
          {
            "name": "Provider Pattern",
            "level": 0.88,
            "badge": "Production Proven",
            "proof": "Startup Dairy Farming App",
            "desc": "ChangeNotifier models, scoped dependency injection, and clean state listening."
          },
          {
            "name": "BLoC / Cubit",
            "level": 0.82,
            "badge": "Core Competency",
            "proof": "Enterprise State Streams",
            "desc": "Event-driven stream architecture, State-Event separation, and testable Cubit flows."
          },
        ]
      },
      {
        "title": "Backend, APIs & Cloud Integration",
        "icon": Icons.cloud_done,
        "subtitle": "RESTful networking & Firebase cloud services",
        "skills": [
          {
            "name": "Dio HTTP Client & Custom Interceptors",
            "level": 0.92,
            "badge": "Production Proven",
            "proof": "100+ REST APIs Integrated at ACME INFOSOFT",
            "desc": "Automated OAuth token refresh interceptors, request logging, timeout buffering, and unified error handling."
          },
          {
            "name": "Firebase Auth & Cloud Firestore DB",
            "level": 0.90,
            "badge": "Production Proven",
            "proof": "AppleCart & Online Examination System",
            "desc": "Real-time document listeners, security rules, user profile authentication, and cloud transactions."
          },
          {
            "name": "JustAudio & Background Audio (AudioService)",
            "level": 0.90,
            "badge": "Production Proven",
            "proof": "Feel Every Beat — Music & Audio Streaming App",
            "desc": "Native foreground service isolate channels, background playback controls, lyrics sync, and real-time audio visualizers."
          },
          {
            "name": "Push Notifications (FCM) & Analytics",
            "level": 0.85,
            "badge": "Core Competency",
            "proof": "Real-Time User Alerts & Event Logs",
            "desc": "Firebase Cloud Messaging, local notification channels, and custom analytics event tracking."
          },
        ]
      },
      {
        "title": "Application Architecture & Storage",
        "icon": Icons.account_tree,
        "subtitle": "Clean Architecture, MVVM & Local Data Isolation",
        "skills": [
          {
            "name": "Clean Architecture (3-Layer Isolation)",
            "level": 0.90,
            "badge": "Production Proven",
            "proof": "MediPoints & Industry Employee Management",
            "desc": "Strict separation across Presentation, Domain (Use Cases), and Data (Repositories & Data Sources) layers."
          },
          {
            "name": "MVVM & Repository Pattern",
            "level": 0.92,
            "badge": "Production Proven",
            "proof": "Decoupled Data Providers across apps",
            "desc": "SOLID principles, dependency inversion, and reusable repository abstraction layers."
          },
          {
            "name": "SQLite / Local Caching & Persistence",
            "level": 0.86,
            "badge": "Production Proven",
            "proof": "Offline-First Transaction Queues",
            "desc": "Offline data buffering, local SQLite queries (sqflite), and SharedPreferences theme persistence."
          },
        ]
      },
      {
        "title": "DevOps, Quality & Engineering Tools",
        "icon": Icons.verified_user_outlined,
        "subtitle": "CI/CD automation, strict linting & testing discipline",
        "skills": [
          {
            "name": "Automated CI/CD (GitHub Actions)",
            "level": 0.88,
            "badge": "Production Proven",
            "proof": "Configured in .github/workflows/flutter_ci.yml",
            "desc": "Automated workflow triggering static analysis (flutter analyze), unit tests (flutter test), and release builds."
          },
          {
            "name": "Automated Testing (flutter_test)",
            "level": 0.85,
            "badge": "Production Proven",
            "proof": "Unit & Widget Smoke Test Suite",
            "desc": "Unit testing repositories and widget testing core UI components for zero regression."
          },
          {
            "name": "Strict Code Linting & Conventional Commits",
            "level": 0.92,
            "badge": "Production Proven",
            "proof": "analysis_options.yaml & Git History",
            "desc": "Strict static analyzer rules, clean code formatting (dart format), and industry conventional commit messages."
          },
        ]
      },
    ];

    final engineeringPrinciples = [
      {
        "title": "DRY & Reusable Custom Widgets",
        "desc": "Zero code duplication through modular widgets inside shared/widgets/ and features/*/widgets/.",
        "icon": Icons.widgets_outlined,
      },
      {
        "title": "Unified Error & Loading States",
        "desc": "Every API operation handles Loading, Success, Empty, and Error states cleanly with retry triggers.",
        "icon": Icons.error_outline,
      },
      {
        "title": "Environment Security & Key Isolation",
        "desc": "API keys and sensitive tokens isolated via environment configuration, never hardcoded in source.",
        "icon": Icons.security,
      },
      {
        "title": "Widget Tree & Performance Optimization",
        "desc": "Selective Riverpod watching, const constructors everywhere, and image caching for 60 FPS UI.",
        "icon": Icons.speed,
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
              Text(
                'TECHNICAL CAPABILITIES',
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 4),
              Text('Skills & Capabilities Matrix', style: theme.textTheme.headlineLarge),
              const SizedBox(height: 6),
              const Text(
                'Production-proven skills backed by real architectural evidence in commercial and open-source applications.',
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
              const SizedBox(height: 14),

              // 1. MASTER MULTI-COLOR SKILL WHEEL RING
              Card(
                margin: const EdgeInsets.only(bottom: 14),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.palette_outlined, color: activeColor, size: 20),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              '⚡ Core Production Skill Highlights',
                              style: theme.textTheme.headlineMedium?.copyWith(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Touch any skill badge to inspect real Flutter 3.24, Riverpod, Dio REST API & Clean Architecture code proof:',
                          style: TextStyle(color: theme.colorScheme.primary, fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Multi-Color Legend Badges
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        alignment: WrapAlignment.center,
                        children: List.generate(_topCircularSkills.length, (index) {
                          final skill = _topCircularSkills[index];
                          final String name = (skill["name"] as String?) ?? '';
                          final Color color = (skill["color"] as Color?) ?? theme.colorScheme.primary;
                          final double level = (skill["level"] as double?) ?? 0.90;
                          final int percentage = (level * 100).round();
                          final isSelected = index == _activeSkillIndex;

                          return InkWell(
                            onTap: () {
                              setState(() => _activeSkillIndex = index);
                              _showSkillDetails(context, skill);
                            },
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: isSelected ? color : color.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: color, width: isSelected ? 1.5 : 1),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    name,
                                    style: TextStyle(
                                      color: isSelected ? Colors.white : color,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                                    decoration: BoxDecoration(
                                      color: isSelected ? Colors.white.withOpacity(0.25) : color.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      '$percentage%',
                                      style: TextStyle(
                                        color: isSelected ? Colors.white : color,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 9,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),

              // 2. INDIVIDUAL MULTI-COLOR CIRCULAR GAUGES GRID
              Text(
                'FLUTTER SKILL GAUGES',
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 4),
              Text('Interactive Flutter & Tech Skills', style: theme.textTheme.headlineMedium),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: Center(
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: _topCircularSkills.map((skill) {
                      final String name = (skill["name"] as String?) ?? '';
                      final double level = (skill["level"] as double?) ?? 0.90;
                      final IconData icon = (skill["icon"] as IconData?) ?? Icons.star;
                      final Color color = (skill["color"] as Color?) ?? theme.colorScheme.primary;
                      final int percentage = (level * 100).round();

                      return InkWell(
                        onTap: () => _showSkillDetails(context, skill),
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          width: 140,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: theme.cardTheme.color,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: color.withOpacity(0.3)),
                            boxShadow: [
                              BoxShadow(
                                color: color.withOpacity(0.08),
                                blurRadius: 6,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 68,
                                height: 68,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SizedBox(
                                      width: 68,
                                      height: 68,
                                      child: CircularProgressIndicator(
                                        value: level,
                                        strokeWidth: 6,
                                        backgroundColor: color.withOpacity(0.15),
                                        color: color,
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(icon, color: color, size: 20),
                                        Text(
                                          '$percentage%',
                                          style: TextStyle(
                                            color: color,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                name,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),

              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 12),

              // 3. CATEGORIZED SKILLS MATRIX
              Text(
                'DETAILED CAPABILITIES MATRIX',
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 4),
              Text('Domain-Wise Architecture Breakdown', style: theme.textTheme.headlineMedium),
              const SizedBox(height: 10),

              Column(
                children: skillCategories.map((category) {
                  final String title = category["title"] as String;
                  final String subtitle = category["subtitle"] as String;
                  final IconData icon = category["icon"] as IconData;
                  final List<Map<String, dynamic>> skills = category["skills"] as List<Map<String, dynamic>>;

                  return Card(
                    margin: const EdgeInsets.only(bottom: 14),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.primary.withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(icon, color: theme.colorScheme.primary, size: 24),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      title,
                                      style: theme.textTheme.headlineMedium?.copyWith(fontSize: 18),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      subtitle,
                                      style: TextStyle(color: theme.colorScheme.outline, fontSize: 13),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          ...skills.map((skill) {
                            final String name = (skill["name"] as String?) ?? '';
                            final double level = (skill["level"] as double?) ?? 0.90;
                            final String badge = (skill["badge"] as String?) ?? 'Production Proven';
                            final String proof = (skill["proof"] as String?) ?? 'Implemented in Commercial Repositories';
                            final String desc = (skill["desc"] as String?) ?? 'Production feature implementation.';
                            final int percentage = (level * 100).round();

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          name,
                                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        '$percentage%',
                                        style: TextStyle(
                                          color: theme.colorScheme.primary,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme.primary.withOpacity(0.12),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      badge,
                                      style: TextStyle(
                                        color: theme.colorScheme.primary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  LinearProgressIndicator(
                                    value: level,
                                    backgroundColor: theme.colorScheme.primary.withOpacity(0.12),
                                    color: theme.colorScheme.primary,
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    desc,
                                    style: theme.textTheme.bodyMedium?.copyWith(fontSize: 13),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(Icons.terminal_outlined, size: 14, color: theme.colorScheme.primary),
                                      const SizedBox(width: 6),
                                      Expanded(
                                        child: Text(
                                          'Proof: $proof',
                                          style: TextStyle(
                                            color: theme.colorScheme.primary,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 14),
              // SENIOR ENGINEERING PRINCIPLES SECTION
              Text(
                'ENGINEERING DISCIPLINE',
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 4),
              Text('Code Standards & Quality Rules', style: theme.textTheme.headlineLarge),
              const SizedBox(height: 10),

              LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth >= 768;
                  final itemWidth = isWide ? (constraints.maxWidth - 16) / 2 : double.infinity;
                  return Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: engineeringPrinciples.map((item) {
                      final String title = item["title"] as String;
                      final String desc = item["desc"] as String;
                      final IconData icon = item["icon"] as IconData;

                      return SizedBox(
                        width: itemWidth,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(icon, color: theme.colorScheme.primary, size: 20),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        title,
                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(desc, style: theme.textTheme.bodyMedium?.copyWith(fontSize: 12)),
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

              // NEXT SECTION BANNER
              if (widget.onNextSection != null)
                NextSectionBanner(
                  title: 'Get In Touch & Hire Akash',
                  subtitle: 'Open for Mobile & Generative AI engineering roles and contract work',
                  icon: Icons.chat_bubble_outline,
                  accentColor: const Color(0xFFE65100),
                  onTap: widget.onNextSection!,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

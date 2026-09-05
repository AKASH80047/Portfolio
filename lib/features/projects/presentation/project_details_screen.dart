import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/utils/url_launcher_util.dart';
import '../../../data/models/project_model.dart';

class ProjectDetailsScreen extends StatelessWidget {
  final ProjectModel project;

  const ProjectDetailsScreen({super.key, required this.project});

  Future<void> _launchUrl(String url) async {
    await UrlLauncherUtil.openUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final engineeringScorecard = [
      {"label": "Architecture", "val": "Clean Architecture / Multi-Layer MVVM", "icon": Icons.account_tree},
      {"label": "State Management", "val": "Riverpod 2.0 / CodeGen Notifiers", "icon": Icons.layers},
      {"label": "AI & GenAI Integration", "val": "Streaming LLMs & Vector RAG (Pinecone)", "icon": Icons.psychology},
      {"label": "REST API & WebSockets", "val": "Dio Interceptors & Real-Time Streams", "icon": Icons.cloud},
      {"label": "Automated Testing", "val": "Unit, Widget & Mock Repositories", "icon": Icons.fact_check},
      {"label": "CI/CD & Deployment", "val": "GitHub Actions, Web & Mobile Build", "icon": Icons.precision_manufacturing},
      {"label": "Responsive UI", "val": "60fps Fluid (Web, iOS & Android)", "icon": Icons.devices},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(project.name),
        actions: [
          if (project.liveDemoUrl != null)
            FilledButton.icon(
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF059669),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              ),
              icon: const Icon(Icons.rocket_launch, size: 14),
              label: const Text('Live Demo', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              onPressed: () => _launchUrl(project.liveDemoUrl!),
            ),
          const SizedBox(width: 8),
          if (project.githubUrl.isNotEmpty)
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.github, size: 20),
              tooltip: 'View GitHub Repository',
              onPressed: () => _launchUrl(project.githubUrl),
            ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Image Header
            Hero(
              tag: project.id,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  project.image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.black,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.smartphone, size: 64, color: theme.colorScheme.primary),
                          const SizedBox(height: 12),
                          Text(project.name, style: theme.textTheme.headlineLarge?.copyWith(fontSize: 24, color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Badges
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      Chip(
                        label: Text(project.badge),
                        backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.15),
                        labelStyle: TextStyle(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (project.liveDemoUrl != null)
                        const Chip(
                          avatar: Icon(Icons.circle, color: Color(0xFF34D399), size: 8),
                          label: Text('Live Online Deployment', style: TextStyle(color: Color(0xFF34D399), fontWeight: FontWeight.bold)),
                          backgroundColor: Color(0xFF0F172A),
                          side: BorderSide(color: Color(0xFF34D399)),
                        ),
                      ...project.technologies.map(
                        (tech) => ActionChip(
                          label: Text(tech),
                          side: BorderSide(color: theme.colorScheme.outline),
                          onPressed: () {
                            final explanation = project.techExplanations[tech] ??
                                "This technology was selected to ensure scalable performance, platform consistency, and robust architectural support.";
                            showDialog(
                              context: context,
                              builder: (context) {
                                final theme = Theme.of(context);
                                return Dialog(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                  child: Container(
                                    padding: const EdgeInsets.all(24),
                                    constraints: const BoxConstraints(maxWidth: 450),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                '$tech in ${project.id == "support-crm" ? "Support CRM" : project.name.split(" — ").first}',
                                                style: theme.textTheme.headlineMedium?.copyWith(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: theme.colorScheme.primary,
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.close),
                                              onPressed: () => Navigator.pop(context),
                                            ),
                                          ],
                                        ),
                                        const Divider(),
                                        const SizedBox(height: 16),
                                        Text(
                                          explanation,
                                          style: theme.textTheme.bodyMedium?.copyWith(
                                            fontSize: 14,
                                            height: 1.6,
                                            color: theme.colorScheme.onSurface,
                                          ),
                                        ),
                                        const SizedBox(height: 24),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: FilledButton(
                                            onPressed: () => Navigator.pop(context),
                                            child: const Text('Close'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // LIVE DEMO BANNER IF AVAILABLE
                  if (project.liveDemoUrl != null) ...[
                    Card(
                      color: const Color(0xFF064E3B).withValues(alpha: 0.3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(color: Color(0xFF34D399), width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final isNarrow = constraints.maxWidth < 500;
                            if (isNarrow) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    children: [
                                      Icon(Icons.rocket_launch, color: Color(0xFF34D399), size: 28),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          'Live Web Application is Active!',
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    'Experience the live interactive application in your browser: ${project.liveDemoUrl}',
                                    style: TextStyle(fontSize: 12, color: Colors.grey.shade300),
                                  ),
                                  const SizedBox(height: 12),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton.icon(
                                      onPressed: () => _launchUrl(project.liveDemoUrl!),
                                      icon: const Icon(Icons.launch, size: 16),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFF059669),
                                        foregroundColor: Colors.white,
                                        padding: const EdgeInsets.symmetric(vertical: 12),
                                      ),
                                      label: const Text('Launch Demo', style: TextStyle(fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ],
                              );
                            }
                            return Row(
                              children: [
                                const Icon(Icons.rocket_launch, color: Color(0xFF34D399), size: 36),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Live Web Application is Active!',
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'Experience the live interactive application in your browser: ${project.liveDemoUrl}',
                                        style: TextStyle(fontSize: 13, color: Colors.grey.shade300),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 12),
                                ElevatedButton.icon(
                                  onPressed: () => _launchUrl(project.liveDemoUrl!),
                                  icon: const Icon(Icons.launch, size: 16),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF059669),
                                    foregroundColor: Colors.white,
                                  ),
                                  label: const Text('Launch Demo'),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                  ],

                  // ENGINEERING SCORECARD & HEALTH INDICATORS
                  Text('Engineering Architecture & Practice Scorecard', style: theme.textTheme.headlineMedium?.copyWith(fontSize: 20)),
                  const SizedBox(height: 12),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final isCardMobile = constraints.maxWidth < 500;
                          final labelWidth = isCardMobile ? 130.0 : 195.0;

                          return Column(
                            children: engineeringScorecard.map((item) {
                              final String label = item["label"] as String;
                              final String val = item["val"] as String;
                              final IconData icon = item["icon"] as IconData;
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 7.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(icon, size: 18, color: theme.colorScheme.primary),
                                    const SizedBox(width: 8),
                                    SizedBox(
                                      width: labelWidth,
                                      child: Text('$label:', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                                    ),
                                    const SizedBox(width: 6),
                                    Expanded(
                                      child: Text(
                                        val,
                                        style: TextStyle(color: theme.colorScheme.primary, fontWeight: FontWeight.w600, fontSize: 13),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),

                  // 1. Problem Statement
                  _CaseStudySection(
                    icon: Icons.error_outline,
                    iconColor: Colors.orangeAccent,
                    title: 'Problem Statement',
                    content: project.problemStatement.isNotEmpty
                        ? project.problemStatement
                        : project.shortDescription,
                  ),

                  // 2. Solution Statement
                  _CaseStudySection(
                    icon: Icons.lightbulb_outline,
                    iconColor: Colors.greenAccent,
                    title: 'The Solution Built',
                    content: project.solutionStatement.isNotEmpty
                        ? project.solutionStatement
                        : project.fullDescription,
                  ),

                  // 3. My Role & Responsibilities
                  _CaseStudySection(
                    icon: Icons.person_outline,
                    iconColor: theme.colorScheme.primary,
                    title: 'My Role & Responsibilities',
                    content: project.myRole,
                  ),

                  // 4. State Management Visibility
                  if (project.stateManagementDetail.isNotEmpty)
                    _CaseStudySection(
                      icon: Icons.layers_outlined,
                      iconColor: theme.colorScheme.primary,
                      title: 'State Management Architecture',
                      content: project.stateManagementDetail,
                    ),

                  // 5. Technical Architecture
                  if (project.architecture.isNotEmpty)
                    _CaseStudySection(
                      icon: Icons.account_tree_outlined,
                      iconColor: theme.colorScheme.primary,
                      title: 'Technical Architecture & Flow',
                      content: project.architecture,
                    ),

                  // 6. Key Features
                  if (project.features.isNotEmpty) ...[
                    Text('Key Production Features', style: theme.textTheme.headlineMedium?.copyWith(fontSize: 20)),
                    const SizedBox(height: 12),
                    ...project.features.map(
                      (feature) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.check_circle_outline, color: theme.colorScheme.primary, size: 18),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(feature, style: theme.textTheme.bodyLarge?.copyWith(fontSize: 14)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],

                  // 7. Challenges & Solution
                  if (project.challenges.isNotEmpty) ...[
                    Text('Engineering Challenges & Solution', style: theme.textTheme.headlineMedium?.copyWith(fontSize: 20)),
                    const SizedBox(height: 8),
                    Text('Challenge: ${project.challenges}', style: theme.textTheme.bodyLarge?.copyWith(fontSize: 14)),
                    const SizedBox(height: 4),
                    Text('Solution: ${project.solution}', style: theme.textTheme.bodyLarge?.copyWith(fontSize: 14)),
                    const SizedBox(height: 32),
                  ],

                  // Action Buttons
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      if (project.liveDemoUrl != null)
                        ElevatedButton.icon(
                          onPressed: () => _launchUrl(project.liveDemoUrl!),
                          icon: const Icon(Icons.rocket_launch, size: 18),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF059669),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                          ),
                          label: const Text('Launch Live Web Application', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      if (project.githubUrl.isNotEmpty)
                        OutlinedButton.icon(
                          onPressed: () => _launchUrl(project.githubUrl),
                          icon: const FaIcon(FontAwesomeIcons.github, size: 18),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                          ),
                          label: const Text('View Source on GitHub'),
                        ),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CaseStudySection extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String content;

  const _CaseStudySection({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: iconColor, size: 22),
                  const SizedBox(width: 10),
                  Text(title, style: theme.textTheme.headlineMedium?.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 10),
              Text(content, style: theme.textTheme.bodyLarge?.copyWith(fontSize: 14, height: 1.6)),
            ],
          ),
        ),
      ),
    );
  }
}

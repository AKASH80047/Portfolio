import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/responsive/responsive_layout.dart';
import '../../../core/utils/url_launcher_util.dart';
import '../../../data/repositories/portfolio_repository.dart';
import '../../../shared/widgets/next_section_banner.dart';
import 'widgets/project_card_case_study.dart';
import 'widgets/project_card_mobile.dart';

class ProjectsScreen extends StatefulWidget {
  final VoidCallback? onNextSection;

  const ProjectsScreen({super.key, this.onNextSection});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  String _selectedCategory = 'All';

  final List<String> _categories = [
    'All',
    '🚀 Live Demos',
    'FinTech & Banking',
    'AI & GenAI',
    'Enterprise SaaS',
    'Healthcare & POS',
    'E-Commerce',
    'Audio & Media',
    'AgriTech',
  ];

  Future<void> _launchUrl(String url) async {
    await UrlLauncherUtil.openUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = ResponsiveLayout.isMobile(context);

    final allProjects = PortfolioRepository.featuredProjects;

    final filteredProjects = allProjects.where((p) {
      if (_selectedCategory == 'All') return true;
      if (_selectedCategory == '🚀 Live Demos') return p.liveDemoUrl != null;
      if (_selectedCategory == 'FinTech & Banking') return p.badge.contains('FinTech') || p.badge.contains('Banking') || p.category.contains('FinTech') || p.name.contains('Banking') || p.name.contains('Expense') || p.badge.contains('Analytics');
      if (_selectedCategory == 'AI & GenAI') return p.badge.contains('AI') || p.category.contains('AI');
      if (_selectedCategory == 'Enterprise SaaS') return p.badge.contains('Enterprise') || p.badge.contains('CRM');
      if (_selectedCategory == 'Healthcare & POS') return p.badge.contains('Health') || p.badge.contains('POS');
      if (_selectedCategory == 'E-Commerce') return p.badge.contains('Commerce') || p.badge.contains('Retail') || p.badge.contains('Jewel') || p.name.contains('Jewel');
      if (_selectedCategory == 'Audio & Media') return p.badge.contains('Audio') || p.badge.contains('Music') || p.badge.contains('Media');
      if (_selectedCategory == 'AgriTech') return p.badge.contains('Agri');
      return true;
    }).toList();

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 12 : 20, vertical: 12),
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Badge & Title
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF10B981).withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFF10B981).withValues(alpha: 0.5)),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.circle, color: Color(0xFF34D399), size: 8),
                        SizedBox(width: 6),
                        Text(
                          'LIVE DEMOS & PRODUCTION ARCHITECTURES',
                          style: TextStyle(
                            color: Color(0xFF34D399),
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            letterSpacing: 0.9,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Commercial Work, Case Studies & AI Platforms',
                style: theme.textTheme.headlineLarge?.copyWith(fontSize: isMobile ? 22 : 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Explore high-impact applications built with Flutter, Riverpod 2.0, Generative AI (LLMs & Vector RAG), Clean Architecture, and Cloud Microservices.',
                style: TextStyle(fontSize: isMobile ? 13 : 15, color: Colors.grey.shade300, height: 1.5),
              ),
              const SizedBox(height: 20),

              // Category Filter Chips
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _categories.map((category) {
                    final isSelected = _selectedCategory == category;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: FilterChip(
                        selected: isSelected,
                        label: Text(category),
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.grey.shade300,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          fontSize: 12,
                        ),
                        backgroundColor: theme.colorScheme.surface,
                        selectedColor: category.contains('Live') ? const Color(0xFF059669) : theme.colorScheme.primary,
                        side: BorderSide(
                          color: isSelected
                              ? (category.contains('Live') ? const Color(0xFF34D399) : theme.colorScheme.primary)
                              : theme.colorScheme.outline.withValues(alpha: 0.2),
                        ),
                        onSelected: (selected) {
                          setState(() {
                            _selectedCategory = category;
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 24),

              // Results Count
              Text(
                'Showing ${filteredProjects.length} ${filteredProjects.length == 1 ? "project" : "projects"}',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
              ),
              const SizedBox(height: 16),

              // Projects List
              if (filteredProjects.isEmpty)
                Container(
                  padding: const EdgeInsets.all(40),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      const Icon(Icons.folder_open, size: 48, color: Colors.grey),
                      const SizedBox(height: 12),
                      const Text('No projects found in this category.', style: TextStyle(color: Colors.grey)),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: () => setState(() => _selectedCategory = 'All'),
                        child: const Text('Reset Filter'),
                      ),
                    ],
                  ),
                )
              else
                ...List.generate(filteredProjects.length, (index) {
                  final project = filteredProjects[index];
                  if (isMobile) {
                    return ProjectCardMobile(
                      project: project,
                      onTapDetails: () => context.push('/projects/${project.id}'),
                      onTapGithub: project.githubUrl.isNotEmpty ? () => _launchUrl(project.githubUrl) : null,
                      onTapLiveDemo: project.liveDemoUrl != null ? () => _launchUrl(project.liveDemoUrl!) : null,
                    );
                  }
                  return ProjectCardCaseStudy(
                    project: project,
                    isReverse: index % 2 == 1,
                    onTapDetails: () => context.push('/projects/${project.id}'),
                    onTapGithub: project.githubUrl.isNotEmpty ? () => _launchUrl(project.githubUrl) : null,
                    onTapLiveDemo: project.liveDemoUrl != null ? () => _launchUrl(project.liveDemoUrl!) : null,
                  );
                }),

              // NEXT SECTION BANNER
              if (widget.onNextSection != null)
                NextSectionBanner(
                  title: 'Technical Skills & Capabilities',
                  subtitle: 'Inspect Flutter 3.24, Riverpod, Dio & AI architecture proof matrix',
                  icon: Icons.psychology_outlined,
                  accentColor: const Color(0xFF0288D1),
                  onTap: widget.onNextSection!,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

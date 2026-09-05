import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/portfolio_constants.dart';
import '../../../core/responsive/responsive_layout.dart';
import '../../../core/utils/url_launcher_util.dart';
import '../../../data/repositories/portfolio_repository.dart';
import '../../../shared/widgets/next_section_banner.dart';
import '../../projects/presentation/widgets/project_card_case_study.dart';
import '../../projects/presentation/widgets/project_card_mobile.dart';
import 'widgets/hero_desktop_view.dart';
import 'widgets/hero_mobile_view.dart';

class HomeView extends StatefulWidget {
  final VoidCallback onViewProjects;
  final VoidCallback? onNextSection;

  const HomeView({super.key, required this.onViewProjects, this.onNextSection});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _launchUrl(String url) async {
    await UrlLauncherUtil.openUrl(url);
  }

  Future<void> _sendMessage() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final message = _messageController.text.trim();

    if (name.isEmpty || message.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your name and message.'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    final subject =
        Uri.encodeComponent("Portfolio Inquiry / Message from $name");
    final body = Uri.encodeComponent(
      "Hi Akash,\n\n"
      "Name: $name\n"
      "Email: ${email.isNotEmpty ? email : 'Not provided'}\n\n"
      "Message:\n$message\n\n"
      "---\nSent via Akash Pandey's Portfolio Website",
    );
    final mailtoUrl =
        "mailto:${PortfolioConstants.email}?subject=$subject&body=$body";
    await _launchUrl(mailtoUrl);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Opening mail app to send your message to ${PortfolioConstants.email}...'),
          backgroundColor: Color(0xFF10B981),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = ResponsiveLayout.isMobile(context);

    // Only show live deployed projects on Home page (Expense Tracker, Dairy Farming, etc.)
    final topProjects = PortfolioRepository.featuredProjects
        .where((p) => p.liveDemoUrl != null && p.liveDemoUrl!.trim().isNotEmpty)
        .toList();

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          // 1. HERO SECTION
          if (isMobile)
            HeroMobileView(
              onViewProjects: widget.onViewProjects,
            )
          else
            HeroDesktopView(
              onViewProjects: widget.onViewProjects,
            ),

          const Divider(height: 16),

          // 2. FREELANCE PLATFORMS & TRUST STRIP
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 12 : 24, vertical: 8),
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.verified, color: Colors.amber, size: 18),
                    const SizedBox(width: 8),
                    Text(
                      'VERIFIED FREELANCE CREDENTIALS & GLOBAL CLIENTS',
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: isMobile ? 11 : 12,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final isWide = constraints.maxWidth >= 768;
                    final itemWidth = isWide
                        ? (constraints.maxWidth - 36) / 4
                        : (constraints.maxWidth - 12) / 2;
                    return Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children:
                          PortfolioConstants.freelancePlatforms.map((item) {
                        return SizedBox(
                          width: itemWidth,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 12),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.surface,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: theme.colorScheme.outline
                                      .withValues(alpha: 0.2)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  alignment: WrapAlignment.spaceBetween,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 4,
                                  runSpacing: 4,
                                  children: [
                                    Text(
                                      item["platform"]!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.amber
                                            .withValues(alpha: 0.15),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text(
                                        item["badge"]!,
                                        style: const TextStyle(
                                            color: Colors.amber,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  item["detail"]!,
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey.shade400),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // 3. QUICK STATS MATRIX
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 12 : 24, vertical: 8),
            constraints: const BoxConstraints(maxWidth: 1100),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth >= 768;
                final cardWidth = isWide
                    ? (constraints.maxWidth - 48) / 4
                    : (constraints.maxWidth - 16) / 2;
                return Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: PortfolioConstants.stats.map((stat) {
                    return SizedBox(
                      width: cardWidth,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                stat["value"]!,
                                style: theme.textTheme.headlineLarge?.copyWith(
                                  color: theme.colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: isMobile ? 26 : 32,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                stat["label"]!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                stat["sub"]!,
                                style: TextStyle(
                                    fontSize: 11, color: Colors.grey.shade400),
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
          ),

          const Divider(height: 16),

          // 4. FEATURED APPS & CASE STUDIES
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 12 : 24, vertical: 10),
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'FEATURED WORK & LIVE APPS',
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            letterSpacing: 1.1,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text('Flagship AI & Mobile Projects',
                            style: theme.textTheme.headlineMedium
                                ?.copyWith(fontSize: isMobile ? 20 : 26)),
                      ],
                    ),
                    TextButton.icon(
                      onPressed: widget.onViewProjects,
                      icon: const Icon(Icons.arrow_forward, size: 16),
                      label: const Text('View All',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ...List.generate(topProjects.length, (index) {
                  final project = topProjects[index];
                  if (isMobile) {
                    return ProjectCardMobile(
                      project: project,
                      onTapDetails: () =>
                          context.push('/projects/${project.id}'),
                      onTapGithub: project.githubUrl.isNotEmpty
                          ? () => _launchUrl(project.githubUrl)
                          : null,
                      onTapLiveDemo: project.liveDemoUrl != null
                          ? () => _launchUrl(project.liveDemoUrl!)
                          : null,
                    );
                  }
                  return ProjectCardCaseStudy(
                    project: project,
                    isReverse: index % 2 == 1,
                    onTapDetails: () => context.push('/projects/${project.id}'),
                    onTapGithub: project.githubUrl.isNotEmpty
                        ? () => _launchUrl(project.githubUrl)
                        : null,
                    onTapLiveDemo: project.liveDemoUrl != null
                        ? () => _launchUrl(project.liveDemoUrl!)
                        : null,
                  );
                }),
              ],
            ),
          ),

          const Divider(height: 16),

          // 5. EXPERIENCE & TIMELINE (Matching cv-mehar.vercel.app)
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 12 : 24, vertical: 10),
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color:
                            theme.colorScheme.primary.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            color: theme.colorScheme.primary
                                .withValues(alpha: 0.4)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.timeline,
                              color: theme.colorScheme.primary, size: 14),
                          const SizedBox(width: 6),
                          Text(
                            'WORK HISTORY',
                            style: TextStyle(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text('Experience & Journey',
                    style: theme.textTheme.headlineMedium?.copyWith(
                        fontSize: isMobile ? 20 : 26,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                      children: PortfolioConstants.experiences.map((exp) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme.primary
                                          .withValues(alpha: 0.15),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Icon(
                                      exp["icon"] == "business"
                                          ? Icons.business
                                          : (exp["icon"] == "smart_toy"
                                              ? Icons.smart_toy_outlined
                                              : (exp["icon"] == "star"
                                                  ? Icons.star
                                                  : Icons.school)),
                                      color: theme.colorScheme.primary,
                                      size: 24,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Wrap(
                                          alignment: WrapAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              WrapCrossAlignment.center,
                                          spacing: 8,
                                          runSpacing: 4,
                                          children: [
                                            Text(
                                              exp["role"]!,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 3),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF10B981)
                                                    .withValues(alpha: 0.15),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Text(
                                                exp["badge"]!,
                                                style: const TextStyle(
                                                    color: Color(0xFF34D399),
                                                    fontSize: 11,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          '${exp["company"]!} • ${exp["period"]!}',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: theme.colorScheme.primary,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          exp["desc"]!,
                                          style: TextStyle(
                                              fontSize: 13,
                                              height: 1.5,
                                              color: Colors.grey.shade300),
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
              ],
            ),
          ),

          const Divider(height: 16),

          // 6. GLOBAL CLIENT REVIEWS & TESTIMONIALS
          if (PortfolioConstants.clientReviews.isNotEmpty) ...[
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 12 : 24, vertical: 10),
              constraints: const BoxConstraints(maxWidth: 1100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'CLIENT TESTIMONIALS',
                        style: TextStyle(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text('What Global Clients Say',
                      style: theme.textTheme.headlineMedium
                          ?.copyWith(fontSize: isMobile ? 20 : 26)),
                  const SizedBox(height: 6),
                  const Text(
                    'Feedback from startup founders, CTOs, and product directors on Upwork & enterprise contracts.',
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isWide = constraints.maxWidth >= 768;
                      final cardWidth = isWide
                          ? (constraints.maxWidth - 20) / 2
                          : constraints.maxWidth;
                      return Wrap(
                        spacing: 20,
                        runSpacing: 16,
                        children:
                            PortfolioConstants.clientReviews.map((review) {
                          return SizedBox(
                            width: cardWidth,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Wrap(
                                      alignment: WrapAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      spacing: 8,
                                      runSpacing: 6,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ...List.generate(
                                              5,
                                              (i) => const Icon(Icons.star,
                                                  color: Colors.amber,
                                                  size: 16),
                                            ),
                                            const SizedBox(width: 6),
                                            Text(
                                              review["rating"]!,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 2),
                                          decoration: BoxDecoration(
                                            color: theme.colorScheme.primary
                                                .withValues(alpha: 0.15),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            review["project"]!,
                                            style: TextStyle(
                                                color:
                                                    theme.colorScheme.primary,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      '"${review["comment"]!}"',
                                      style: TextStyle(
                                        fontSize: 13.5,
                                        height: 1.5,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.grey.shade300,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    const Divider(height: 1),
                                    const SizedBox(height: 12),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 18,
                                          backgroundColor: theme
                                              .colorScheme.primary
                                              .withValues(alpha: 0.2),
                                          child: Text(
                                            review["client"]!
                                                .split(" ")
                                                .map((w) => w[0])
                                                .take(2)
                                                .join(),
                                            style: TextStyle(
                                                color:
                                                    theme.colorScheme.primary,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                review["client"]!,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14),
                                              ),
                                              Text(
                                                '${review["role"]!} • ${review["location"]!}',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color:
                                                        Colors.grey.shade400),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
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
                ],
              ),
            ),
            const Divider(height: 16),
          ],

          // 7. FREELANCE SERVICES & CORE EXPERTISE
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 12 : 24, vertical: 10),
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'WHAT I DELIVER',
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    letterSpacing: 1.1,
                  ),
                ),
                const SizedBox(height: 4),
                Text('Core Freelance & Engineering Services',
                    style: theme.textTheme.headlineMedium
                        ?.copyWith(fontSize: isMobile ? 20 : 26)),
                const SizedBox(height: 20),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final isWide = constraints.maxWidth >= 768;
                    final cardWidth = isWide
                        ? (constraints.maxWidth - 20) / 2
                        : constraints.maxWidth;
                    return Wrap(
                      spacing: 20,
                      runSpacing: 16,
                      children:
                          PortfolioConstants.freelanceServices.map((service) {
                        return SizedBox(
                          width: cardWidth,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: theme.colorScheme.primary
                                              .withValues(alpha: 0.15),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Icon(
                                          _getServiceIcon(service["icon"]!),
                                          color: theme.colorScheme.primary,
                                          size: 22,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Text(
                                          service["title"]!,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    service["desc"]!,
                                    style: TextStyle(
                                        fontSize: 13,
                                        height: 1.5,
                                        color: Colors.grey.shade400),
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
              ],
            ),
          ),

          const Divider(height: 16),

          // 8. INTERACTIVE CONTACT & "LET'S WORK TOGETHER" FORM (Matching cv-mehar.vercel.app)
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 12 : 24, vertical: 12),
            constraints: const BoxConstraints(maxWidth: 900),
            child: Card(
              color: theme.colorScheme.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                    color: theme.colorScheme.primary.withValues(alpha: 0.3)),
              ),
              child: Padding(
                padding: EdgeInsets.all(isMobile ? 16.0 : 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color:
                            theme.colorScheme.primary.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: theme.colorScheme.primary
                                .withValues(alpha: 0.3)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.mail_outline,
                              color: theme.colorScheme.primary, size: 14),
                          const SizedBox(width: 6),
                          Text(
                            'CONTACT',
                            style: TextStyle(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Let's Work Together",
                      style: theme.textTheme.headlineLarge?.copyWith(
                          fontSize: isMobile ? 24 : 32,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Ready to bring your ideas to life? I'm always excited to work on ambitious mobile and AI projects.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: isMobile ? 13 : 15,
                          color: Colors.grey.shade300),
                    ),
                    const SizedBox(height: 28),

                    // Inputs
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final isWide = constraints.maxWidth >= 600;
                        return isWide
                            ? Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: _nameController,
                                      decoration: InputDecoration(
                                        labelText: 'Your Name *',
                                        hintText: 'John Doe',
                                        prefixIcon:
                                            const Icon(Icons.person_outline),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: TextField(
                                      controller: _emailController,
                                      decoration: InputDecoration(
                                        labelText: 'Your Email *',
                                        hintText: 'john@example.com',
                                        prefixIcon:
                                            const Icon(Icons.mail_outline),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  TextField(
                                    controller: _nameController,
                                    decoration: InputDecoration(
                                      labelText: 'Your Name *',
                                      hintText: 'John Doe',
                                      prefixIcon:
                                          const Icon(Icons.person_outline),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  TextField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      labelText: 'Your Email *',
                                      hintText: 'john@example.com',
                                      prefixIcon:
                                          const Icon(Icons.mail_outline),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                    ),
                                  ),
                                ],
                              );
                      },
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _messageController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        labelText: 'Your Message *',
                        hintText: 'Tell me about your project or idea...',
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(bottom: 50.0),
                          child: Icon(Icons.message_outlined),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: _sendMessage,
                      icon: const Icon(Icons.send_rounded, size: 18),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF10B981),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                      ),
                      label: const Text('Send Message →',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                    ),
                    const SizedBox(height: 24),
                    const Divider(),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 12,
                      runSpacing: 10,
                      alignment: WrapAlignment.center,
                      children: [
                        OutlinedButton.icon(
                          onPressed: () =>
                              _launchUrl('mailto:${PortfolioConstants.email}'),
                          icon: const Icon(Icons.mail_outline),
                          label: const Text('Direct Email'),
                        ),
                        OutlinedButton.icon(
                          onPressed: () =>
                              _launchUrl(PortfolioConstants.whatsappUrl),
                          icon: const Icon(Icons.chat_bubble_outline),
                          label: const Text('WhatsApp Chat'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // NEXT SECTION BANNER (Seamless navigation)
          if (widget.onNextSection != null)
            NextSectionBanner(
              title: 'About Akash & Career History',
              subtitle: 'Explore professional timeline, architecture philosophy, and education',
              icon: Icons.person_outline,
              accentColor: const Color(0xFF6366F1),
              onTap: widget.onNextSection!,
            ),

          // 9. FOOTER (Matching cv-mehar.vercel.app)
          Container(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              '© 2026 Akash Pandey. Built with Flutter, Clean Architecture & Material 3.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  IconData _getServiceIcon(String iconKey) {
    switch (iconKey) {
      case "phone_iphone":
        return Icons.phone_android;
      case "psychology":
        return Icons.psychology;
      case "account_tree":
        return Icons.account_tree_outlined;
      case "cloud":
        return Icons.cloud_done_outlined;
      default:
        return Icons.code;
    }
  }
}

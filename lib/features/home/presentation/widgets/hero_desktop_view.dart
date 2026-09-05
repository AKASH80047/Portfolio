import 'package:flutter/material.dart';
import '../../../../core/constants/portfolio_constants.dart';
import '../../../../core/utils/url_launcher_util.dart';
import 'skill_pill_tag.dart';
import '../../../../shared/widgets/brand_icons.dart';

class HeroDesktopView extends StatelessWidget {
  final VoidCallback onViewProjects;

  const HeroDesktopView({
    super.key,
    required this.onViewProjects,
  });

  Future<void> _launchUrl(String url) async {
    await UrlLauncherUtil.openUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      constraints: const BoxConstraints(minHeight: 480),
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left Content
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Wrap(
                  spacing: 10,
                  runSpacing: 8,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFF10B981).withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFF10B981).withValues(alpha: 0.5)),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.circle, color: Color(0xFF34D399), size: 10),
                          SizedBox(width: 6),
                          Text(
                            'AVAILABLE FOR PROJECTS & FULL-TIME',
                            style: TextStyle(
                              color: Color(0xFF34D399),
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                              letterSpacing: 1.1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  "Hi, I'm ${PortfolioConstants.name}.",
                  style: theme.textTheme.displayLarge?.copyWith(
                    fontSize: 52,
                    height: 1.1,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  PortfolioConstants.role,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  PortfolioConstants.subRole,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  PortfolioConstants.headline,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  PortfolioConstants.shortIntro,
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade400, height: 1.6),
                ),
                const SizedBox(height: 28),
                // CTAs
                Wrap(
                  spacing: 14,
                  runSpacing: 12,
                  children: [
                    ElevatedButton.icon(
                      onPressed: onViewProjects,
                      icon: const Icon(Icons.rocket_launch, size: 18),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      ),
                      label: const Text('Explore Live Projects & AI', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    FilledButton.tonalIcon(
                      icon: const Icon(Icons.chat_bubble_outline, size: 18),
                      label: const Text('Hire Me on WhatsApp'),
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFF10B981).withValues(alpha: 0.2),
                        foregroundColor: const Color(0xFF34D399),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      ),
                      onPressed: () => _launchUrl(PortfolioConstants.whatsappUrl),
                    ),
                    OutlinedButton.icon(
                      icon: const Icon(Icons.mail_outline, size: 18),
                      label: const Text('Send Email'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      ),
                      onPressed: () => _launchUrl('mailto:${PortfolioConstants.email}'),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                // Social Links with clean pill buttons matching cv-mehar.vercel.app
                Wrap(
                  spacing: 10,
                  runSpacing: 8,
                  children: [
                    ActionChip(
                      avatar: const GithubBrandIcon(size: 16),
                      label: const Text('GitHub', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                      onPressed: () => _launchUrl(PortfolioConstants.githubUrl),
                    ),
                    ActionChip(
                      avatar: const LinkedinBrandIcon(size: 16),
                      label: const Text('LinkedIn', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                      onPressed: () => _launchUrl(PortfolioConstants.linkedinUrl),
                    ),
                    ActionChip(
                      avatar: const WhatsappBrandIcon(size: 16),
                      label: const Text('WhatsApp', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                      onPressed: () => _launchUrl(PortfolioConstants.whatsappUrl),
                    ),
                    ActionChip(
                      avatar: const Icon(Icons.mail_rounded, size: 16, color: Colors.redAccent),
                      label: const Text('Email', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                      onPressed: () => _launchUrl('mailto:${PortfolioConstants.email}'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 48),
          // Right Profile Photo & Badges
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 280,
                      height: 280,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: theme.colorScheme.primary.withValues(alpha: 0.35),
                            blurRadius: 45,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                    ),
                    ClipOval(
                      child: Image.asset(
                        PortfolioConstants.profileImage,
                        width: 260,
                        height: 260,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: 260,
                          height: 260,
                          color: theme.colorScheme.surface,
                          child: Icon(Icons.person, size: 100, color: theme.colorScheme.primary),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 8,
                  children: [
                    Chip(
                      avatar: const Text('🇮🇳'),
                      label: const Text('Based in India • Serving Worldwide'),
                      side: BorderSide(color: theme.colorScheme.outline),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                // Professional Skill & Qualification Pill Tags
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 8,
                  runSpacing: 8,
                  children: PortfolioConstants.headlineTags.map((tag) {
                    return SkillPillTag(tag: tag);
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../core/constants/portfolio_constants.dart';
import '../../../../core/utils/url_launcher_util.dart';
import 'skill_pill_tag.dart';
import '../../../../shared/widgets/brand_icons.dart';

class HeroMobileView extends StatelessWidget {
  final VoidCallback onViewProjects;

  const HeroMobileView({
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Availability Badge with pulsing green style
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF10B981).withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFF10B981).withValues(alpha: 0.5)),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.circle, color: Color(0xFF34D399), size: 8),
                SizedBox(width: 6),
                Text(
                  'AVAILABLE FOR PROJECTS & FULL-TIME',
                  style: TextStyle(
                    color: Color(0xFF34D399),
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    letterSpacing: 0.8,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Circular Profile Photo
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: theme.colorScheme.primary.withValues(alpha: 0.4),
                      blurRadius: 20,
                      spreadRadius: 3,
                    ),
                  ],
                ),
              ),
              ClipOval(
                child: Image.asset(
                  PortfolioConstants.profileImage,
                  width: 112,
                  height: 112,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 130,
                    height: 130,
                    color: theme.colorScheme.surface,
                    child: Icon(Icons.person, size: 56, color: theme.colorScheme.primary),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            PortfolioConstants.name,
            style: theme.textTheme.headlineLarge?.copyWith(
              fontSize: 28,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            PortfolioConstants.role,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 2),
          const Text(
            PortfolioConstants.subRole,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 6,
            children: [
              Chip(
                avatar: const Icon(Icons.star, color: Colors.amber, size: 14),
                label: const Text('Top-Rated Freelancer (100% JSS)', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                side: BorderSide(color: theme.colorScheme.primary.withValues(alpha: 0.4)),
                backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.1),
                padding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
              ),
              Chip(
                avatar: const Text('🇮🇳', style: TextStyle(fontSize: 12)),
                label: const Text('Worldwide Remote', style: TextStyle(fontSize: 11)),
                side: BorderSide(color: theme.colorScheme.outline),
                padding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Professional Skill & Qualification Pill Tags
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 6,
            runSpacing: 6,
            children: PortfolioConstants.headlineTags.map((tag) {
              return SkillPillTag(tag: tag);
            }).toList(),
          ),
          const SizedBox(height: 14),
          Text(
            PortfolioConstants.headline,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge?.copyWith(fontSize: 14, color: Colors.white),
          ),
          const SizedBox(height: 18),
          // Touch Friendly CTAs
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: onViewProjects,
              icon: const Icon(Icons.rocket_launch, size: 16),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                backgroundColor: theme.colorScheme.primary,
              ),
              label: const Text('Explore Live Projects & AI', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: FilledButton.tonalIcon(
                  onPressed: () => _launchUrl(PortfolioConstants.whatsappUrl),
                  icon: const Icon(Icons.chat_bubble_outline, size: 15),
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF10B981).withValues(alpha: 0.2),
                    foregroundColor: const Color(0xFF34D399),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  label: const Text('WhatsApp', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => _launchUrl('mailto:${PortfolioConstants.email}'),
                  icon: const Icon(Icons.mail_outline, size: 15),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  label: const Text('Email Me', style: TextStyle(fontSize: 13)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          // Social ActionChip Pills
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 6,
            children: [
              ActionChip(
                avatar: const GithubBrandIcon(size: 15),
                label: const Text('GitHub', style: TextStyle(fontSize: 11)),
                onPressed: () => _launchUrl(PortfolioConstants.githubUrl),
              ),
              ActionChip(
                avatar: const LinkedinBrandIcon(size: 15),
                label: const Text('LinkedIn', style: TextStyle(fontSize: 11)),
                onPressed: () => _launchUrl(PortfolioConstants.linkedinUrl),
              ),
              ActionChip(
                avatar: const WhatsappBrandIcon(size: 15),
                label: const Text('WhatsApp', style: TextStyle(fontSize: 11)),
                onPressed: () => _launchUrl(PortfolioConstants.whatsappUrl),
              ),
              ActionChip(
                avatar: const Icon(Icons.mail_rounded, size: 15, color: Colors.redAccent),
                label: const Text('Email', style: TextStyle(fontSize: 11)),
                onPressed: () => _launchUrl('mailto:${PortfolioConstants.email}'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

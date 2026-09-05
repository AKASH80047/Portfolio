import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../data/models/project_model.dart';

class ProjectCardCaseStudy extends StatelessWidget {
  final ProjectModel project;
  final bool isReverse;
  final VoidCallback onTapDetails;
  final VoidCallback? onTapGithub;
  final VoidCallback? onTapLiveDemo;

  const ProjectCardCaseStudy({
    super.key,
    required this.project,
    this.isReverse = false,
    required this.onTapDetails,
    this.onTapGithub,
    this.onTapLiveDemo,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final imageWidget = Container(
      height: 240,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              project.image,
              fit: BoxFit.cover,
              alignment: Alignment.center,
              errorBuilder: (context, error, stackTrace) => Container(
                color: theme.colorScheme.primary.withValues(alpha: 0.08),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.smartphone, size: 48, color: theme.colorScheme.primary),
                      const SizedBox(height: 8),
                      Text(
                        project.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Top Left Live Demo Indicator
            if (project.liveDemoUrl != null)
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F172A).withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFF10B981).withValues(alpha: 0.6)),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.circle, color: Color(0xFF34D399), size: 7),
                      SizedBox(width: 5),
                      Text(
                        'LIVE APP',
                        style: TextStyle(
                          color: Color(0xFF34D399),
                          fontWeight: FontWeight.bold,
                          fontSize: 9.5,
                          letterSpacing: 0.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            // Top Right Badge
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [BoxShadow(color: Colors.black38, blurRadius: 4)],
                ),
                child: Text(
                  project.badge,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    final infoWidget = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            project.name,
            style: theme.textTheme.headlineMedium?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              height: 1.25,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            project.shortDescription,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 13,
              color: Colors.grey.shade300,
              height: 1.35,
            ),
          ),
          const SizedBox(height: 8),
          // Features List (Compact)
          ...project.features.take(2).map(
                (feat) => Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 2.0),
                        child: Icon(Icons.check_circle_outline,
                            size: 14, color: Color(0xFF10B981)),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          feat,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontSize: 12,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          const SizedBox(height: 8),
          // Tech Badges (Compact)
          Wrap(
            spacing: 5,
            runSpacing: 4,
            children: project.technologies.take(5).map(
              (tech) => InkWell(
                onTap: () {
                  final explanation = project.techExplanations[tech] ??
                      "Selected for optimal performance, type safety, and clean architecture scalability.";
                  showDialog(
                    context: context,
                    builder: (context) {
                      final dialogTheme = Theme.of(context);
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          constraints: const BoxConstraints(maxWidth: 420),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      '$tech in ${project.name.split(" — ").first}',
                                      style: dialogTheme.textTheme.headlineMedium
                                          ?.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: dialogTheme.colorScheme.primary,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.close, size: 18),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ],
                              ),
                              const Divider(),
                              const SizedBox(height: 10),
                              Text(
                                explanation,
                                style: dialogTheme.textTheme.bodyMedium?.copyWith(
                                  fontSize: 13,
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Align(
                                alignment: Alignment.centerRight,
                                child: FilledButton(
                                  style: FilledButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                  ),
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
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest
                        .withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                        color: theme.colorScheme.outline.withValues(alpha: 0.2)),
                  ),
                  child: Text(
                    tech,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ).toList(),
          ),
          const SizedBox(height: 10),
          // Action Buttons (Compact & Pro)
          Wrap(
            spacing: 8,
            runSpacing: 6,
            children: [
              if (onTapLiveDemo != null)
                FilledButton.icon(
                  onPressed: onTapLiveDemo,
                  icon: const Icon(Icons.rocket_launch, size: 13),
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF059669),
                    foregroundColor: Colors.white,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                    minimumSize: const Size(0, 34),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  label: const Text('🚀 Live Demo',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                ),
              FilledButton.icon(
                onPressed: onTapDetails,
                icon: const Icon(Icons.visibility, size: 13),
                style: FilledButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                  minimumSize: const Size(0, 34),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                label: const Text('Case Study',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              ),
              if (onTapGithub != null)
                OutlinedButton.icon(
                  onPressed: onTapGithub,
                  icon: const FaIcon(FontAwesomeIcons.github, size: 13),
                  style: OutlinedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    minimumSize: const Size(0, 34),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  label: const Text('Source',
                      style: TextStyle(fontSize: 12)),
                ),
            ],
          ),
        ],
      ),
    );

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(
          color: theme.colorScheme.outline.withValues(alpha: 0.18),
        ),
      ),
      child: InkWell(
        onTap: onTapDetails,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: isReverse
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(flex: 11, child: infoWidget),
                    const SizedBox(width: 8),
                    Expanded(flex: 9, child: imageWidget),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(flex: 9, child: imageWidget),
                    const SizedBox(width: 8),
                    Expanded(flex: 11, child: infoWidget),
                  ],
                ),
        ),
      ),
    );
  }
}

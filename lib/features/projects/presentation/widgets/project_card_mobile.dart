import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../data/models/project_model.dart';

class ProjectCardMobile extends StatelessWidget {
  final ProjectModel project;
  final VoidCallback onTapDetails;
  final VoidCallback? onTapGithub;
  final VoidCallback? onTapLiveDemo;

  const ProjectCardMobile({
    super.key,
    required this.project,
    required this.onTapDetails,
    this.onTapGithub,
    this.onTapLiveDemo,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Hero(
      tag: project.id,
      child: Card(
        margin: const EdgeInsets.only(bottom: 12),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTapDetails,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Photorealistic Image Banner
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        project.image,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: theme.colorScheme.primary.withValues(alpha: 0.1),
                          child: Center(
                            child: Icon(Icons.smartphone, size: 48, color: theme.colorScheme.primary),
                          ),
                        ),
                      ),
                    ),
                    // Live Demo Indicator
                    if (project.liveDemoUrl != null)
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFF0F172A).withValues(alpha: 0.85),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFF34D399).withValues(alpha: 0.6)),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.circle, color: Color(0xFF34D399), size: 6),
                              SizedBox(width: 4),
                              Text(
                                'LIVE APP',
                                style: TextStyle(
                                  color: Color(0xFF34D399),
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4)],
                        ),
                        child: Text(
                          project.badge,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project.name,
                      style: theme.textTheme.headlineMedium?.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      project.shortDescription,
                      style: theme.textTheme.bodyMedium?.copyWith(height: 1.4),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: project.technologies.take(4).map(
                        (tech) => InkWell(
                          onTap: () {
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
                          borderRadius: BorderRadius.circular(4),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: theme.scaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: theme.colorScheme.outline.withValues(alpha: 0.3)),
                            ),
                            child: Text(tech, style: const TextStyle(fontSize: 11)),
                          ),
                        ),
                      ).toList(),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        if (onTapLiveDemo != null)
                          ElevatedButton.icon(
                            onPressed: onTapLiveDemo,
                            icon: const Icon(Icons.rocket_launch, size: 14),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF059669),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                            ),
                            label: const Text('🚀 Live Demo', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                          ),
                        ElevatedButton.icon(
                          onPressed: onTapDetails,
                          icon: const Icon(Icons.visibility, size: 14),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                          ),
                          label: const Text('Details', style: TextStyle(fontSize: 12)),
                        ),
                        if (onTapGithub != null)
                          OutlinedButton.icon(
                            onPressed: onTapGithub,
                            icon: const FaIcon(FontAwesomeIcons.github, size: 14),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                            ),
                            label: const Text('GitHub', style: TextStyle(fontSize: 12)),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SkillPillTag extends StatefulWidget {
  final String tag;

  const SkillPillTag({super.key, required this.tag});

  @override
  State<SkillPillTag> createState() => _SkillPillTagState();
}

class _SkillPillTagState extends State<SkillPillTag> {
  bool _isHoveredOrPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDegree = widget.tag.contains('B.Tech');
    final isActive = _isHoveredOrPressed;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHoveredOrPressed = true),
      onExit: (_) => setState(() => _isHoveredOrPressed = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isHoveredOrPressed = true),
        onTapUp: (_) => setState(() => _isHoveredOrPressed = false),
        onTapCancel: () => setState(() => _isHoveredOrPressed = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          decoration: BoxDecoration(
            color: isActive
                ? theme.colorScheme.primary.withOpacity(0.22)
                : theme.colorScheme.primary.withOpacity(0.08),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isActive
                  ? theme.colorScheme.primary
                  : theme.colorScheme.primary.withOpacity(0.25),
              width: isActive ? 1.5 : 1.0,
            ),
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: theme.colorScheme.primary.withOpacity(0.3),
                      blurRadius: 8,
                      spreadRadius: 1,
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isDegree) ...[
                const Text('🎓 ', style: TextStyle(fontSize: 13)),
              ],
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 180),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.w600,
                  color: isActive
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onSurface.withOpacity(0.9),
                ),
                child: Text(widget.tag),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

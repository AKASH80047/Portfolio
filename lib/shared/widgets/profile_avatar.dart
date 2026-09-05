import 'package:flutter/material.dart';
import '../../core/constants/portfolio_constants.dart';

class ProfileAvatar extends StatelessWidget {
  final double size;
  final double borderWidth;
  final Color? borderColor;

  const ProfileAvatar({
    super.key,
    this.size = 36,
    this.borderWidth = 1.5,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final activeBorderColor = borderColor ?? theme.colorScheme.primary;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: activeBorderColor,
          width: borderWidth,
        ),
      ),
      child: ClipOval(
        child: Image.asset(
          PortfolioConstants.profileImage,
          width: size,
          height: size,
          fit: BoxFit.cover,
          alignment: Alignment.center,
          errorBuilder: (context, error, stackTrace) => Container(
            color: activeBorderColor.withValues(alpha: 0.15),
            child: Center(
              child: Text(
                'AP',
                style: TextStyle(
                  color: activeBorderColor,
                  fontWeight: FontWeight.bold,
                  fontSize: size * 0.38,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

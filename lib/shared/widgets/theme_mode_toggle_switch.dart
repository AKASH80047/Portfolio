import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/portfolio_providers.dart';
import '../../features/settings/presentation/theme_settings_dialog.dart';

class ThemeModeToggleSwitch extends ConsumerStatefulWidget {
  const ThemeModeToggleSwitch({super.key});

  @override
  ConsumerState<ThemeModeToggleSwitch> createState() => _ThemeModeToggleSwitchState();
}

class _ThemeModeToggleSwitchState extends ConsumerState<ThemeModeToggleSwitch> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeModeProvider);
    final isDark = themeMode == ThemeMode.dark ||
        (themeMode == ThemeMode.system &&
            MediaQuery.platformBrightnessOf(context) == Brightness.dark);

    return Tooltip(
      message: isDark ? 'Switch to Light Theme' : 'Switch to Dark Theme',
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: () {
            ref.read(themeModeProvider.notifier).setTheme(
                  isDark ? ThemeMode.light : ThemeMode.dark,
                );
          },
          onLongPress: () {
            showDialog(
              context: context,
              builder: (context) => const ThemeSettingsDialog(),
            );
          },
          child: AnimatedScale(
            scale: _isHovered ? 1.06 : 1.0,
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeOut,
            child: Container(
              width: 58,
              height: 32,
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
              decoration: BoxDecoration(
                color: const Color(0xFFE8EEF5), // Subtle light-gray capsule matching reference
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFFD3DDEB),
                  width: 1,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x12000000),
                    blurRadius: 3,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: AnimatedAlign(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeInOut,
                alignment: isDark ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFDEE5F0), // Subtle light-gray circular background
                    border: Border.all(
                      color: const Color(0xFFCBD6E4), // Crisp circular border ring
                      width: 1,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x14000000),
                        blurRadius: 3,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.nightlight_round,
                      size: 15,
                      color: Color(0xFF2563EB), // Clean royal-blue crescent moon matching reference
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

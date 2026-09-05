import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/portfolio_constants.dart';
import '../../../core/responsive/responsive_layout.dart';
import '../../../core/utils/url_launcher_util.dart';
import '../../../shared/widgets/mobile_bottom_nav.dart';
import '../../../shared/widgets/web_nav_bar.dart';
import '../../about/presentation/about_screen.dart';
import '../../contact/presentation/contact_screen.dart';
import '../../projects/presentation/projects_screen.dart';
import '../../settings/presentation/theme_settings_dialog.dart';
import '../../skills/presentation/skills_screen.dart';
import 'home_view.dart';
import '../../../shared/widgets/profile_avatar.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late final PageController _pageController;
  int _currentNavIndex = 0;
  DateTime _lastAutoAdvanceTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentNavIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNavSelected(int index) {
    if (_currentNavIndex == index) return;
    setState(() {
      _currentNavIndex = index;
    });
    if (_pageController.hasClients) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void _goToNextSection() {
    final nextIndex = (_currentNavIndex + 1) % 5;
    _onNavSelected(nextIndex);
  }

  bool _onScrollNotification(ScrollNotification notification) {
    // Only respond to main vertical page scrolling
    if (notification.metrics.axis != Axis.vertical) return false;
    if (notification.metrics.maxScrollExtent < 80) return false;

    // Check if scroll position has reached or exceeded the bottom limit
    final bool isNearBottom =
        notification.metrics.pixels >= (notification.metrics.maxScrollExtent - 20);

    // Detect user pulling down / scrolling down at the end
    final bool isScrollingDownAtBottom = (notification is ScrollUpdateNotification &&
            (notification.scrollDelta ?? 0) > 0.5 &&
            isNearBottom) ||
        (notification is OverscrollNotification &&
            notification.overscroll > 2);

    if (isScrollingDownAtBottom) {
      final now = DateTime.now();
      if (now.difference(_lastAutoAdvanceTime).inMilliseconds > 700) {
        _lastAutoAdvanceTime = now;
        _goToNextSection();
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    final List<Widget> pages = [
      HomeView(
        onViewProjects: () => _onNavSelected(2),
        onNextSection: () => _onNavSelected(1),
      ),
      AboutScreen(
        onViewProjects: () => _onNavSelected(2),
        onNextSection: () => _onNavSelected(2),
      ),
      ProjectsScreen(
        onNextSection: () => _onNavSelected(3),
      ),
      SkillsScreen(
        onNextSection: () => _onNavSelected(4),
      ),
      ContactScreen(
        onNextSection: () => _onNavSelected(0),
      ),
    ];

    return Scaffold(
      appBar: isMobile
          ? AppBar(
              titleSpacing: 12,
              title: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ProfileAvatar(size: 34),
                  SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      'Akash Pandey',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              actions: [
                FilledButton.icon(
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    backgroundColor: const Color(0xFF10B981),
                  ),
                  icon: const Icon(Icons.chat_bubble_outline, size: 14),
                  label: const Text('Hire Me', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                  onPressed: () => UrlLauncherUtil.openUrl(PortfolioConstants.whatsappUrl),
                ),
                const SizedBox(width: 4),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => const ThemeSettingsDialog(),
                    );
                  },
                  icon: const Icon(Icons.palette_outlined, size: 20),
                  tooltip: 'Customize Theme',
                ),
                const SizedBox(width: 6),
              ],
            )
          : null,
      bottomNavigationBar: isMobile
          ? MobileBottomNav(
              currentIndex: _currentNavIndex,
              onTap: _onNavSelected,
            )
          : null,
      body: Stack(
        children: [
          // HORIZONTAL SIDE-SCROLL & PAGEVIEW CONTAINER
          Padding(
            padding: EdgeInsets.only(top: isMobile ? 0 : 76),
            child: NotificationListener<ScrollNotification>(
              onNotification: _onScrollNotification,
              child: PageView(
                controller: _pageController,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    _currentNavIndex = index;
                  });
                },
                children: pages,
              ),
            ),
          ),

          // STICKY DESKTOP NAVBAR
          if (!isMobile)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: WebNavBar(
                activeIndex: _currentNavIndex,
                onNavSelected: _onNavSelected,
              ),
            ),
        ],
      ),
    );
  }
}

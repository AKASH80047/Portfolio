import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/projects/presentation/project_details_screen.dart';
import '../../data/repositories/portfolio_repository.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/projects/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'];
        final project = PortfolioRepository.featuredProjects.firstWhere(
          (p) => p.id == id,
          orElse: () => PortfolioRepository.featuredProjects.first,
        );
        return ProjectDetailsScreen(project: project);
      },
    ),
  ],
  errorBuilder: (context, state) => const Scaffold(
    body: Center(
      child: Text('Page not found'),
    ),
  ),
);

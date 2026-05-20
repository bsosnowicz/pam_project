import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/auth/domain/auth_state.dart';
import '../../features/auth/presentation/auth_provider.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/register_screen.dart';
import '../../features/profile/presentation/onboarding_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/profile/presentation/profile_provider.dart';
import '../../features/workout_builder/presentation/builder_screen.dart';
import '../../features/live_tracking/presentation/live_tracking_screen.dart';
import '../../features/workout_summary/presentation/summary_screen.dart';
import '../../features/history/presentation/history_screen.dart';
import '../../features/history/presentation/workout_detail_screen.dart';
import '../../features/analytics/presentation/analytics_screen.dart';
import '../../features/extras/presentation/goals_screen.dart';
import '../../shared/widgets/shell_scaffold.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final authState = ref.watch(authNotifierProvider);
  final profileAsync = ref.watch(profileNotifierProvider);

  return GoRouter(
    initialLocation: '/login',
    redirect: (context, state) {
      final isAuthenticated = authState is _Authenticated;
      final isLoading = authState is _Loading;
      final onAuthRoute = state.matchedLocation == '/login' ||
          state.matchedLocation == '/register';

      if (isLoading) return null;
      if (!isAuthenticated && !onAuthRoute) return '/login';
      if (isAuthenticated && onAuthRoute) {
        final profile = profileAsync.valueOrNull;
        if (profile == null) return '/onboarding';
        return '/';
      }
      if (isAuthenticated && state.matchedLocation == '/') {
        final profile = profileAsync.valueOrNull;
        if (profile == null) return '/onboarding';
      }
      return null;
    },
    routes: [
      GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),
      GoRoute(path: '/register', builder: (_, __) => const RegisterScreen()),
      GoRoute(path: '/onboarding', builder: (_, __) => const OnboardingScreen()),
      ShellRoute(
        builder: (context, state, child) => ShellScaffold(child: child),
        routes: [
          GoRoute(
            path: '/',
            builder: (_, __) => const DashboardScreen(),
          ),
          GoRoute(
            path: '/history',
            builder: (_, __) => const HistoryScreen(),
            routes: [
              GoRoute(
                path: ':id',
                builder: (_, state) =>
                    WorkoutDetailScreen(workoutId: state.pathParameters['id']!),
              ),
            ],
          ),
          GoRoute(
            path: '/analytics',
            builder: (_, __) => const AnalyticsScreen(),
          ),
          GoRoute(
            path: '/profile',
            builder: (_, __) => const ProfileScreen(),
          ),
        ],
      ),
      GoRoute(path: '/builder', builder: (_, __) => const BuilderScreen()),
      GoRoute(path: '/live', builder: (_, __) => const LiveTrackingScreen()),
      GoRoute(path: '/summary', builder: (_, __) => const SummaryScreen()),
      GoRoute(path: '/goals', builder: (_, __) => const GoalsScreen()),
    ],
  );
}

// Dashboard placeholder — implemented fully in dashboard feature
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileNotifierProvider).valueOrNull;
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.fitness_center, size: 64),
            const SizedBox(height: 16),
            Text(
              'Hej! Gotowy na trening?',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            if (profile != null) ...[
              const SizedBox(height: 8),
              Text(
                'Waga: ${profile.weightKg} kg',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () => context.push('/builder'),
              icon: const Icon(Icons.add),
              label: const Text('Nowy trening'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(240, 52),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/providers/theme_provider.dart';
import '../../auth/presentation/auth_provider.dart';
import 'profile_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileNotifierProvider);
    final isDark = ref.watch(themeNotifierProvider) == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: profileAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Blad: $e')),
        data: (profile) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (profile != null) ...[
              _InfoCard(
                title: 'Dane biometryczne',
                items: [
                  ('Waga', '${profile.weightKg} kg'),
                  ('Wzrost', '${profile.heightCm} cm'),
                  ('Wiek', '${profile.age} lat'),
                  ('Plec', _genderLabel(profile.gender)),
                  ('Aktywnosc', _activityLabel(profile.activityLevel)),
                ],
              ),
              const SizedBox(height: 16),
              ListTile(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                tileColor: Theme.of(context).cardTheme.color,
                leading: const Icon(Icons.edit_outlined),
                title: const Text('Edytuj profil'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.push('/onboarding'),
              ),
              const SizedBox(height: 8),
            ],
            ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              tileColor: Theme.of(context).cardTheme.color,
              leading: Icon(isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
              title: Text(isDark ? 'Tryb jasny' : 'Tryb ciemny'),
              trailing: Switch(
                value: isDark,
                onChanged: (_) => ref.read(themeNotifierProvider.notifier).toggle(),
              ),
            ),
            const SizedBox(height: 8),
            ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              tileColor: Theme.of(context).cardTheme.color,
              leading: const Icon(Icons.flag_outlined),
              title: const Text('Moje cele'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.push('/goals'),
            ),
            const SizedBox(height: 24),
            OutlinedButton.icon(
              onPressed: () async {
                await ref.read(authNotifierProvider.notifier).signOut();
              },
              icon: const Icon(Icons.logout, color: Colors.red),
              label: const Text('Wyloguj sie', style: TextStyle(color: Colors.red)),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.red),
                minimumSize: const Size(double.infinity, 52),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _genderLabel(String g) => switch (g) {
        'male' => 'Mezczyzna',
        'female' => 'Kobieta',
        _ => 'Inne',
      };

  String _activityLabel(String a) => switch (a) {
        'sedentary' => 'Siedzacy tryb zycia',
        'light' => 'Lekka aktywnosc',
        'moderate' => 'Umiarkowana aktywnosc',
        'active' => 'Aktywny',
        'very_active' => 'Bardzo aktywny',
        _ => a,
      };
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.title, required this.items});
  final String title;
  final List<(String, String)> items;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ...items.map((item) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(item.$1, style: Theme.of(context).textTheme.bodyMedium),
                      Text(item.$2,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              )),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

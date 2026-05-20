import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/errors/app_exception.dart';
import '../../../shared/widgets/primary_button.dart';
import '../../../core/supabase/supabase_client.dart';
import '../domain/user_profile.dart';
import 'profile_provider.dart';
import '../../auth/presentation/auth_provider.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _weightCtrl = TextEditingController(text: '70');
  final _heightCtrl = TextEditingController(text: '175');
  final _ageCtrl = TextEditingController(text: '25');
  String _gender = 'male';
  String _activityLevel = 'moderate';
  bool _loading = false;

  static const _genders = [
    ('male', 'Mezczyzna'),
    ('female', 'Kobieta'),
    ('other', 'Inne'),
  ];

  static const _activities = [
    ('sedentary', 'Siedzacy tryb zycia'),
    ('light', 'Lekka aktywnosc'),
    ('moderate', 'Umiarkowana aktywnosc'),
    ('active', 'Aktywny'),
    ('very_active', 'Bardzo aktywny'),
  ];

  @override
  void dispose() {
    _weightCtrl.dispose();
    _heightCtrl.dispose();
    _ageCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) return;

    setState(() => _loading = true);
    try {
      final profile = UserProfile(
        id: userId,
        weightKg: double.parse(_weightCtrl.text.replaceAll(',', '.')),
        heightCm: double.parse(_heightCtrl.text.replaceAll(',', '.')),
        age: int.parse(_ageCtrl.text),
        gender: _gender,
        activityLevel: _activityLevel,
      );
      await ref.read(profileNotifierProvider.notifier).saveProfile(profile);
      if (mounted) context.go('/');
    } on AppException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          TextButton.icon(
            onPressed: () => ref.read(authNotifierProvider.notifier).signOut(),
            icon: const Icon(Icons.logout),
            label: const Text('Wyloguj'),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                Text(
                  'Skonfiguruj profil',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Te dane pomoga nam liczyc kalorie i statystyki',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                      ),
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _weightCtrl,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        decoration: const InputDecoration(
                          labelText: 'Waga (kg)',
                          prefixIcon: Icon(Icons.monitor_weight_outlined),
                        ),
                        validator: (v) {
                          final val = double.tryParse(v?.replaceAll(',', '.') ?? '');
                          if (val == null || val < 30 || val > 300) return 'Nieprawidlowa waga';
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextFormField(
                        controller: _heightCtrl,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Wzrost (cm)',
                          prefixIcon: Icon(Icons.height),
                        ),
                        validator: (v) {
                          final val = double.tryParse(v ?? '');
                          if (val == null || val < 100 || val > 250) return 'Nieprawidlowy wzrost';
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _ageCtrl,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Wiek',
                    prefixIcon: Icon(Icons.cake_outlined),
                  ),
                  validator: (v) {
                    final val = int.tryParse(v ?? '');
                    if (val == null || val < 10 || val > 120) return 'Nieprawidlowy wiek';
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Text('Plec', style: Theme.of(context).textTheme.labelLarge),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: _genders
                      .map((g) => ChoiceChip(
                            label: Text(g.$2),
                            selected: _gender == g.$1,
                            onSelected: (_) => setState(() => _gender = g.$1),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 20),
                Text('Poziom aktywnosci', style: Theme.of(context).textTheme.labelLarge),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: _activityLevel,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.directions_run),
                  ),
                  items: _activities
                      .map((a) => DropdownMenuItem(value: a.$1, child: Text(a.$2)))
                      .toList(),
                  onChanged: (v) => setState(() => _activityLevel = v!),
                ),
                const SizedBox(height: 32),
                PrimaryButton(
                  label: 'Zacznij trenowac',
                  loading: _loading,
                  onPressed: _submit,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

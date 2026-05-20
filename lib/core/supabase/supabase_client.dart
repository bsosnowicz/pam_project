import 'package:supabase_flutter/supabase_flutter.dart';

const _supabaseUrl = 'https://wmgwncowvhapxpfoaxoq.supabase.co';
const _supabaseAnonKey = 'sb_publishable_X7HNQtIts-Qz-CXxU-d5bQ_PIrewbGB';

Future<void> initSupabase() async {
  await Supabase.initialize(
    url: _supabaseUrl,
    anonKey: _supabaseAnonKey,
  );
}

SupabaseClient get supabase => Supabase.instance.client;

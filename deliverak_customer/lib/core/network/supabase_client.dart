import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseClientHelper {
  static SupabaseClient get client => Supabase.instance.client;

  static GoTrueClient get auth => client.auth;

  static PostgrestQueryBuilder from(String table) => client.from(table);
}

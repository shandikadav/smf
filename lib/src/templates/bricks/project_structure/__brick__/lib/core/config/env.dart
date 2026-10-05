import 'package:envied/envied.dart';

part 'env.g.dart';

{{#is_preset_enterprise}}/// Environment configuration loaded at build time via envied.
///
/// Create a `.env` file at the project root with your keys:
/// ```
/// BASE_URL=https://api.example.com
/// API_KEY=your_api_key_here
/// ```
@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'BASE_URL')
  static const String baseUrl = _Env.baseUrl;

  @EnviedField(varName: 'API_KEY', obfuscate: true)
  static final String apiKey = _Env.apiKey;
}
{{/is_preset_enterprise}}{{^is_preset_enterprise}}/// Environment configuration loaded at build time via envied.
///
/// Create a `.env` file at the project root with your keys:
/// ```
/// BASE_URL=https://api.example.com
/// ```
@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'BASE_URL')
  static const String baseUrl = _Env.baseUrl;
}
{{/is_preset_enterprise}}

import 'package:injectable/injectable.dart';

@module
abstract class EnviromentModule {
  @Named('apiUrl')
  String get apiUrl => const String.fromEnvironment('API_URL');
}

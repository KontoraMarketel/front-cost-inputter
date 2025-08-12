import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_flutter/talker_flutter.dart';

@module
abstract class AppModule {
  Talker get talker => TalkerFlutter.init();

  Dio get dio =>
      Dio(BaseOptions(headers: {'Content-Type': 'application/json'}))
        ..interceptors.addAll([TalkerDioLogger(talker: talker)]);
}

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void slSetup() {
  sl.registerSingleton(Dio());
}

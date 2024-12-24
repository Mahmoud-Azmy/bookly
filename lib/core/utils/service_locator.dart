import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_bookly/Features/home/data/repos/home_repo_implementation.dart';
import 'package:my_bookly/core/utils/api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImplementation>(
    HomeRepoImplementation(
      getIt.get<ApiService>(),
    ),
  );
}

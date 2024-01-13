import 'package:booklyapp/Features/Home/Data/Repo/home_repo_imple.dart';
import 'package:booklyapp/Features/Search/Data/Repo/implemnt_home_repo.dart';
import 'package:booklyapp/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

setupServicsGetit() {
  getit.registerSingleton<ApiService>(ApiService(Dio()));
  getit
      .registerSingleton<HomeRepoImple>(HomeRepoImple(getit.get<ApiService>()));
  getit.registerSingleton<ImpHomeRepoSearch>(
      ImpHomeRepoSearch(getit.get<ApiService>()));
}

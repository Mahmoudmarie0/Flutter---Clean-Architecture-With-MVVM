import 'package:clean_architecture_with_mvvm/app/app_prefs.dart';
import 'package:clean_architecture_with_mvvm/data/data_source/remote_data_source.dart';
import 'package:clean_architecture_with_mvvm/data/network/app_api.dart';
import 'package:clean_architecture_with_mvvm/data/repository/repositery.impl.dart';
import 'package:clean_architecture_with_mvvm/domain/repository/repository.dart';
import 'package:clean_architecture_with_mvvm/domain/usecase/login_usecase.dart';
import 'package:clean_architecture_with_mvvm/presentation/login/login_viewmodel.dart';
import 'package:dio/src/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/network/dio_factory.dart';
import '../data/network/network_info.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  //shared prefs instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);//lazy singleton here means we have only one sharedpref instance in whole app

  //app prefs instance/lazy singleton her
  instance.registerLazySingleton<AppPrefrences>(() => AppPrefrences(instance()));
  // TODO: implement init

  //network info
  instance.registerLazySingleton<NewtworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()));

  //dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  //app service client

  final dio =  instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio as Dio));

  //remote data source
  instance.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImplementer(instance()));

  //repository
  instance.registerLazySingleton<Repository>(() => RepositoryImpl(instance(),instance()));
initLoginModule();


}

//should call when open login screen
initLoginModule(){
  if(!GetIt.I.isRegistered<LoginUsecase>()){
    instance.registerFactory<LoginUsecase>(() => LoginUsecase(instance()));
    instance.registerFactory<LoginViewmodel>(() => LoginViewmodel(instance()));
  }
}



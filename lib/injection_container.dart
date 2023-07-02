import 'package:book/features/weather/data/datasources/weather_local_data_source.dart';
import 'package:book/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:book/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:book/features/weather/domain/repositories/weather_repository.dart';
import 'package:book/features/weather/domain/usecases/get_weather_city.dart';
import 'package:book/features/weather/domain/usecases/get_weather_cordinate.dart';
import 'package:book/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/platform/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
    () => WeatherCubit(
      getWeatherCity: sl(),
      getWeatherCordinate: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetWeatherCity(sl()));
  sl.registerLazySingleton(() => GetWeatherCordinate(sl()));

  // Repository
  sl.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(
      localDataSource: sl(),
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<WeatherRemoteDataSource>(
    () => WeatherRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<WeatherLocalDataSource>(
    () => WeatherLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}

void initFeatures() {}

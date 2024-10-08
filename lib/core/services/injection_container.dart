import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiga_belas_apps/src/auth/data/datasources/auth_remote_data_source.dart';
import 'package:tiga_belas_apps/src/auth/data/repos/auth_repo_impl.dart';
import 'package:tiga_belas_apps/src/auth/domain/repos/auth_repo.dart';
import 'package:tiga_belas_apps/src/auth/domain/usecases/forgot_password.dart';
import 'package:tiga_belas_apps/src/auth/domain/usecases/sign_in.dart';
import 'package:tiga_belas_apps/src/auth/domain/usecases/sign_up.dart';
import 'package:tiga_belas_apps/src/auth/domain/usecases/update_user.dart';
import 'package:tiga_belas_apps/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:tiga_belas_apps/src/on_boarding/data/datasources/on_boarding_local_data_source.dart';
import 'package:tiga_belas_apps/src/on_boarding/data/repos/on_boarding_repo_impl.dart';
import 'package:tiga_belas_apps/src/on_boarding/domain/repos/on_boarding_repo.dart';
import 'package:tiga_belas_apps/src/on_boarding/domain/usecases/cache_first_timer.dart';
import 'package:tiga_belas_apps/src/on_boarding/domain/usecases/check_if_user_is_first_timer.dart';
import 'package:tiga_belas_apps/src/on_boarding/presentation/cubit/on_boarding_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _initOnBoarding();
  await _initAuth();
}

Future<void> _initAuth() async {
  sl
    ..registerFactory(
      () => AuthBloc(
        signIn: sl(),
        signUp: sl(),
        forgotPassword: sl(),
        updateUser: sl(),
      ),
    )
    ..registerLazySingleton(() => SignIn(sl()))
    ..registerLazySingleton(() => SignUp(sl()))
    ..registerLazySingleton(() => ForgotPassword(sl()))
    ..registerLazySingleton(() => UpdateUser(sl()))
    ..registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl()))
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        authClient: sl(),
        cloudStoreClient: sl(),
        dbClient: sl(),
      ),
    )
    ..registerLazySingleton(() => FirebaseAuth.instance)
    ..registerLazySingleton(() => FirebaseFirestore.instance)
    ..registerLazySingleton(() => FirebaseStorage.instance);
}

Future<void> _initOnBoarding() async {
  final prefs = await SharedPreferences.getInstance();

  sl
    ..registerFactory(
      () => OnBoardingCubit(
        cacheFirstTimer: sl(),
        checkIfUserIsFirstTimer: sl(),
      ),
    )
    ..registerLazySingleton(() => CacheFirstTimer(sl()))
    ..registerLazySingleton(() => CheckIfUserIsFirstTimer(sl()))
    ..registerLazySingleton<OnBoardingRepo>(() => OnBardingRepoImpl(sl()))
    ..registerLazySingleton<OnBoardingLocalDataSource>(
      () => OnBoardingLocalDataSrcImpl(sl()),
    )
    ..registerLazySingleton(() => prefs);
}

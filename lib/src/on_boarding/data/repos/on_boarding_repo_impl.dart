

import 'package:dartz/dartz.dart';
import 'package:tiga_belas_apps/core/errors/exceptions.dart';
import 'package:tiga_belas_apps/core/errors/failures.dart';
import 'package:tiga_belas_apps/core/utils/typedef.dart';
import 'package:tiga_belas_apps/src/on_boarding/data/datasources/on_boarding_local_data_source.dart';
import 'package:tiga_belas_apps/src/on_boarding/domain/repos/on_boarding_repo.dart';

class OnBardingRepoImpl implements OnBoardingRepo {
  const OnBardingRepoImpl(this._localDataSource);

  final OnBoardingLocalDataSource _localDataSource;

  @override
  ResultFuture<void> cacheFirstTimer() async {
    try {
      await _localDataSource.cacheFirstTimer();
      return const Right(null);
    } on CacheException catch (e) {
      return Left(
        CacheFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
    }
  }

  @override
  ResultFuture<bool> checkIfUserIsFirstTimer() async {
    try {
      final result =  await _localDataSource.checkIfUserIsFirstTimer();
      return Right(result);
    } on CacheException catch(e) {
      return Left(
        CacheFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
    }
  }
}

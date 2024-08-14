

import 'package:tiga_belas_apps/core/usecases/usecases.dart';
import 'package:tiga_belas_apps/core/utils/typedef.dart';
import 'package:tiga_belas_apps/src/on_boarding/domain/repos/on_boarding_repo.dart';

class CacheFirstTimer extends UsecasesWithoutParams<void> {
  const CacheFirstTimer(this._repo);

  final OnBoardingRepo _repo;

  @override
  ResultFuture<void> call() async => _repo.cacheFirstTimer();
}

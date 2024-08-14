

import 'package:tiga_belas_apps/core/utils/typedef.dart';

abstract class OnBoardingRepo {
  const OnBoardingRepo();
  
  ResultFuture<void> cacheFirstTimer();
  ResultFuture<bool> checkIfUserIsFirstTimer();
  
}



import 'package:tiga_belas_apps/core/usecases/usecases.dart';
import 'package:tiga_belas_apps/core/utils/typedef.dart';
import 'package:tiga_belas_apps/src/auth/domain/repos/auth_repo.dart';

class ForgotPassword extends UsecasesWithParams<void, String> {
  const ForgotPassword(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<void> call(String params) => _repo.forgotPassword(params);
}

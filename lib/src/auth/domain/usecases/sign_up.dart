
import 'package:equatable/equatable.dart';
import 'package:tiga_belas_apps/core/usecases/usecases.dart';
import 'package:tiga_belas_apps/core/utils/typedef.dart';
import 'package:tiga_belas_apps/src/auth/domain/repos/auth_repo.dart';

class SignUp extends UsecasesWithParams<void, SignUpParams> {
  const SignUp(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<void> call(SignUpParams params) => _repo.signUp(
        email: params.email,
        fullName: params.fullName,
        password: params.password,
      );
}

class SignUpParams extends Equatable {
  const SignUpParams({
    required this.email,
    required this.password,
    required this.fullName,
  });

  const SignUpParams.empty()
      : this(
          email: '',
          password: '',
          fullName: '',
        );

  final String email;
  final String password;
  final String fullName;

  @override
  List<Object?> get props => [email, password, fullName];
}

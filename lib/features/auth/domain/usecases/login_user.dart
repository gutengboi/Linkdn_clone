import 'package:dartz/dartz.dart';
import 'package:linkdn_clon/core/errors/failure.dart';
import 'package:linkdn_clon/features/auth/domain/repository/auth_repo.dart';
import '../../../../core/useCases/login_user_core.dart';

class LoginUser implements LoginUserParams<String, Params> {
  final AuthRepo repository;

  LoginUser({required this.repository});

  @override
  Future<Either<Failure, String>> call(Params params) async {
    return await repository.handleLogin(
      email: params.email,
      password: params.password,
    );
  }
}
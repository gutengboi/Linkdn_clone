import 'package:dartz/dartz.dart';
import 'package:linkdn_clon/core/errors/failure.dart';
import 'package:linkdn_clon/core/useCases/register_user.dart';
import 'package:linkdn_clon/features/auth/domain/repository/auth_repo.dart';

class RegisterUser implements RegisterUserParams<String, ParamsRegister> {
  final AuthRepo repository;

  RegisterUser({required this.repository});

  @override
  Future<Either<Failure, String>> call(ParamsRegister params) async {
    return await repository.handleRegister(
      email: params.email,
      password: params.password,
      name: params.name,
      lastName: params.lastName,
    );
  }
}
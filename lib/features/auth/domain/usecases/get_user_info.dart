import 'package:dartz/dartz.dart';
import 'package:linkdn_clon/core/errors/failure.dart';
import 'package:linkdn_clon/core/useCases/get_user_info.dart';
import 'package:linkdn_clon/features/auth/domain/entities/user_entity.dart';
import 'package:linkdn_clon/features/auth/domain/repository/auth_repo.dart';

class GetUserInfo implements GetUserInfoParams<UserEntity, ParamsGetUserInfo> {
  final AuthRepo authRepo;

  GetUserInfo({required this.authRepo});

  @override
  Future<Either<Failure, UserEntity>> call(ParamsGetUserInfo params) async {
    return await authRepo.getUserInfo(params.ownerId);
  }
}
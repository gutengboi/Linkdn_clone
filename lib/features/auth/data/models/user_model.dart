import 'package:linkdn_clon/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel (
      super.id,
      super.email,
      super.name,
      super.lastName,
      super.profilePic,
      super.bannerPic,
      super.job,
      super.bio,
      );
}
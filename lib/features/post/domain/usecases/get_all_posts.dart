import 'package:dartz/dartz.dart';
import 'package:linkdn_clon/features/post/domain/entities%20/post_entity.dart';
import 'package:linkdn_clon/features/post/domain/repository%20/post_repo.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/useCases/get_all_post.dart';
import '../../../../core/useCases/get_user_info.dart';


class GetAllPost implements GetAllPostUseCase<List<PostEntity>, NoParams> {
  final PostRepo postRepository;

  GetAllPost({required this.postRepository});
  @override
  Future<Either<Failure, List<PostEntity>>> call(NoParams params) async {
    return await postRepository.getAllPost();
  }
}
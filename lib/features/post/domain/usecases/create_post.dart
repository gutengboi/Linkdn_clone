import 'package:dartz/dartz.dart';
import 'package:linkdn_clon/core/errors/failure.dart';
import 'package:linkdn_clon/features/post/domain/repository%20/post_repo.dart';

import '../../../../core/useCases/create_post.dart';

class CreatePostUseCase implements CreatePostParams<void, ParamsPost> {
  final PostRepo postRepository;

  CreatePostUseCase({required this.postRepository});
  @override
  Future<Either<Failure, String>> call(ParamsPost params) async {
    return await postRepository.createPost(
      description: params.description,
      pic: params.postImageURL,
    );
  }
}
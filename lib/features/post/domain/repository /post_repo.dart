import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:linkdn_clon/features/post/domain/entities%20/post_entity.dart';

import '../../../../core/errors/failure.dart';


abstract class PostRepo {
  Future<Either<Failure, List<PostEntity>>> getAllPost();
  Future<Either<Failure, String>> createPost(
      {required String description, required File pic});
}
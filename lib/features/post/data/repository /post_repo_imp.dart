import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:linkdn_clon/core/errors/errror.dart';
import 'package:linkdn_clon/core/errors/failure.dart';
import 'package:linkdn_clon/features/post/data/models%20/post_model.dart';
import 'package:linkdn_clon/features/post/domain/repository%20/post_repo.dart';


import '../dataSources/post_dataSource.dart';

class PostRepoImp implements PostRepo {
  final PostDataSource postDataSource;

  PostRepoImp({
    required this.postDataSource,
  });

  @override
  Future<Either<Failure, String>> createPost({
    required String description,
    required File pic,
  }) async {
    try {
      final response = await postDataSource.createPost(description, pic);
      return Right(response);
    } on ServerExeption catch (err) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<PostModel>>> getAllPost() async {
    try {
      final response = await postDataSource.getAllPost();
      return Right(response);
    } on ServerExeption catch (err) {
      return Left(ServerFailure());
    }
  }
}
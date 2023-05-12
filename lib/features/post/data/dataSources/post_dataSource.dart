import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:linkdn_clon/core/errors/errror.dart';
import 'package:linkdn_clon/core/storage/storage.dart';
import 'package:linkdn_clon/features/post/data/models%20/post_model.dart';

abstract class PostDataSource {
  Future<String> createPost(String description, File pic);
  Future<List<PostModel>> getAllPost();
}

const uri = 'http://localhost:3500/post';

class PostDataSourceImp implements PostDataSource {
  final http.Client client;

  PostDataSourceImp({required this.client});

//string return 'post created!
  @override
  Future<String> createPost(String description, File pic) async {
    String res = "Some error occurred";
    try {
      String? ownerId = await Storage().secureStorage.read(key: 'userId');
      print(ownerId);

      if (ownerId == null) {
        throw ServerExeption();
      }

      String? token = await Storage().secureStorage.read(key: 'token');
      print(token);
      //------------------------------------
      final uriv = Uri.parse(uri);
      var reqq = http.MultipartRequest('POST', uriv);
      // reqq.headers.addAll();
      reqq.files.add(await http.MultipartFile.fromPath('image', pic.path));

      reqq.fields['description'] = description;
      reqq.fields['ownerId'] = ownerId;

      var resss = await reqq.send();
      print(resss.statusCode);
      if (resss.statusCode == 201) {
        print('post created');
      } else {
        throw ServerExeption();
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  @override
  Future<List<PostModel>> getAllPost() async {
    http.Response res = await http.get(Uri.parse(uri), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      // 'x-auth-token': userProvider.user.token,
    });

    List jsonResponse = jsonDecode(res.body);

    final List<PostModel> h =
    jsonResponse.map((dynamic e) => PostModel.fromMap(e)).toList();

    print(h);
    if (res.statusCode == 200) {
      return h;
    } else {
      throw ServerExeption();
    }
  }
}
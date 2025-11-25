import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:tp_widget/models/user.dart';
import '../models/post.dart';
part 'rest_client.g.dart';
@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;
  @GET("/posts")
  Future<List<Post>> getPosts();
  @GET("/posts/{id}")
  Future<Post> getPostById(@Path("id") int id);
  @GET("/users")
  Future<List<User>> getUsers();
}
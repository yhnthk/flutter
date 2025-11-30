import 'package:dio/dio.dart';
import 'package:flutter_application_4/models/user_model.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<UserModel>> getUsers() async {
    final response = await _dio.get(
      "https://jsonplaceholder.typicode.com/users",
    );
    final List<dynamic> data = response.data;


    return data.map((E)=> UserModel.fromJson(E)).toList();
  }
}

import 'package:dio/dio.dart';
import '../models/user_model.dart';
import '../../../../core/network/dio_client.dart';

class AuthRemoteDataSource {
  final Dio dio = DioClient.dio;

  Future<UserModel> login(String email, String password) async {
    try {
      final response = await dio.post(
        '/auth/login',
        data: {
          'email': email, 
          'password': password
        },
      );
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Login failed'
    );
    }
  }

Future<UserModel> signup(String name, String email, String password) async{
  try{
    final response = await dio.post(
      '/auth/signup',
      data: {'name': name, 'email': email, 'password': password},
    );;
    return UserModel.fromJson(response.data);
  }on DioException catch (e){
    throw Exception(e.response?.data['message'] ?? 'Signup failed'
    );
  }
}
}

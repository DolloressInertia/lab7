import 'package:dio/dio.dart';
import 'rest_client.dart';

class ApiService {
  late final Dio dio;
  late final RestClient client;

  ApiService() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));

    client = RestClient(dio);
  }
}

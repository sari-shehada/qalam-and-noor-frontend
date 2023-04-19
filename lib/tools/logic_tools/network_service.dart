import 'package:http/http.dart' as http;

abstract class HttpService {
  Future<T> get<T>({
    required String url,
    T Function(dynamic responseData)? dataMapper,
  }) async {
    // Uri uriFromUrl

    throw UnimplementedError();
  }
}

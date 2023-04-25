// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class HttpService {
  static const String _baseURL = 'http://qalamnoor-001-site1.htempurl.com/';
  static Future<MapperReturnType> getParsed<MapperReturnType, JsonParseType>({
    required String url,
    required MapperReturnType Function(JsonParseType responseData) dataMapper,
  }) async {
    http.Response response = await getUnparsed(url);
    return dataMapper(jsonDecode(response.body) as JsonParseType);
  }

  static Future<http.Response> getUnparsed(String url) async {
    return await http.get(Uri.parse(_baseURL + url));
  }

  static Future<int?> post({
    required String url,
    String? serializedBody,
  }) async {
    Uri uriParsedFromURL = Uri.parse(_baseURL + url);
    http.Response response =
        await http.post(uriParsedFromURL, body: serializedBody, headers: {
      'Access-Control-Allow-Origin': "*",
      'Content-Type': 'application/json',
      'Accept': '*/*'
    });
    return int.tryParse(response.body.toString());
  }
}

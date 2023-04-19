// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class HttpService {
  static Future<MapperReturnType> getParsed<MapperReturnType, JsonParseType>({
    required String url,
    required MapperReturnType Function(JsonParseType responseData) dataMapper,
  }) async {
    http.Response response = await getUnparsed(url);
    return dataMapper(jsonDecode(response.body) as JsonParseType);
  }

  static Future<http.Response> getUnparsed(String url) async {
    return await http.get(Uri.parse(url));
  }
}

class TestClassConsumer {
  final String name;
  final int age;
  TestClassConsumer({
    required this.name,
    required this.age,
  });

  TestClassConsumer copyWith({
    String? name,
    int? age,
  }) {
    return TestClassConsumer(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
    };
  }

  factory TestClassConsumer.fromMap(Map<String, dynamic> map) {
    return TestClassConsumer(
      name: map['name'] as String,
      age: map['age'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory TestClassConsumer.fromJson(String source) =>
      TestClassConsumer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TestClassConsumer(name: $name, age: $age)';

  @override
  bool operator ==(covariant TestClassConsumer other) {
    if (identical(this, other)) return true;

    return other.name == name && other.age == age;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}

class TestClassConsumerController {
  Future<List<TestClassConsumer>> getAllTestClassItems() async {
    return await HttpService.getParsed<List<TestClassConsumer>, List<dynamic>>(
      url: 'http://www.example.com/someTestURL/get',
      dataMapper: (responseData) {
        List<TestClassConsumer> resultData = [];
        for (final element in responseData) {
          resultData.add(TestClassConsumer.fromMap(element));
        }
        return resultData;
      },
    );
  }
}

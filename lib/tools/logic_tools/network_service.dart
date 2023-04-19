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

class DummyEntity {
  final String name;
  final int age;
  DummyEntity({
    required this.name,
    required this.age,
  });

  DummyEntity copyWith({
    String? name,
    int? age,
  }) {
    return DummyEntity(
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

  factory DummyEntity.fromMap(Map<String, dynamic> map) {
    return DummyEntity(
      name: map['name'] as String,
      age: map['age'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory DummyEntity.fromJson(String source) =>
      DummyEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TestClassConsumer(name: $name, age: $age)';

  @override
  bool operator ==(covariant DummyEntity other) {
    if (identical(this, other)) return true;

    return other.name == name && other.age == age;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}

class TestClassConsumerController {
  Future<List<DummyEntity>> getAllTestClassItems() async {
    return await HttpService.getParsed<List<DummyEntity>, List<dynamic>>(
      url: 'http://www.example.com/someTestURL/get',
      dataMapper: (data) {
        return data
            .map<DummyEntity>((item) => DummyEntity.fromMap(item))
            .toList();
      },
    );
  }
}

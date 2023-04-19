// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:kalam_noor/tools/logic_tools/network_service.dart';

class CRUDInterface<T> {
  String get _controllerName => throw UnimplementedError();

  Future<List<T>> getAll() async {
    throw UnimplementedError();
  }

  Future<T?> getById(int id) async {
    throw UnimplementedError();
  }

  Future insert(T object) async {
    throw UnimplementedError();
  }

  Future update(T object) async {
    throw UnimplementedError();
  }
}

class DummyClass {
  final String name;
  DummyClass({
    required this.name,
  });

  DummyClass copyWith({
    String? name,
  }) {
    return DummyClass(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory DummyClass.fromMap(Map<String, dynamic> map) {
    return DummyClass(
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DummyClass.fromJson(String source) =>
      DummyClass.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DummyClass(name: $name)';

  @override
  bool operator ==(covariant DummyClass other) {
    if (identical(this, other)) return true;

    return other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}

class SimpleImplementer implements CRUDInterface<DummyClass> {
  @override
  // TODO: implement _controllerName
  String get _controllerName => throw UnimplementedError();

  @override
  Future<List<DummyClass>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<DummyClass?> getById(int id) async {
    try {
      return await HttpService.getParsed<DummyClass, Map<String, dynamic>>(
        url: '$_controllerName/getById?id=$id',
        dataMapper: (responseData) {
          return DummyClass.fromMap(responseData);
        },
      );
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  @override
  Future insert(DummyClass object) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<int> update(DummyClass object) {
    // TODO: implement update
    throw UnimplementedError();
  }
}

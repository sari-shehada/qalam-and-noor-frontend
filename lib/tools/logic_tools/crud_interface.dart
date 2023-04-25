// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:kalam_noor/models/educational/class.dart';
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

class DummyClass implements CRUDInterface<Class> {
  @override
  // TODO: implement _controllerName
  String get _controllerName => throw UnimplementedError();

  @override
  Future<List<Class>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<Class?> getById(int id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future insert(Class object) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future update(Class object) {
    // TODO: implement update
    throw UnimplementedError();
  }
}

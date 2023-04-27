// ignore_for_file: public_member_api_docs, sort_constructors_first
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

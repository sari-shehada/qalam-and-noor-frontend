import '../../conversations/conversation.dart';
import '../../../tools/logic_tools/crud_interface.dart';
import '../../../tools/logic_tools/network_service.dart';

class ConversationsDBHelper implements CRUDInterface<Conversation> {
  String get _controllerName => 'ConversationController/';
  static ConversationsDBHelper get instance => ConversationsDBHelper();

  @override
  Future<List<Conversation>> getAll() async {
    String url = '${_controllerName}GetConversations';
    List<Conversation> allConversations =
        await HttpService.getParsed<List<Conversation>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return Conversation.fromMap(e);
          },
        ).toList();
      },
    );
    return allConversations;
  }

  @override
  Future<Conversation?> getById(int id) async {
    String url = '${_controllerName}GetConversationById?id=$id';
    Conversation? conversation =
        await HttpService.getParsed<Conversation?, Map<String, dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return Conversation.fromMap(responseData);
      },
    );
    return conversation;
  }

  Future<int> getConversationsCount() async {
    return await getAll().then((value) => value.length);
  }

  @override
  Future<bool> insert(Conversation object) async {
    String url = '${_controllerName}InsertConversation';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }

  @override
  Future<bool> update(Conversation object) async {
    String url = '${_controllerName}UpdateConversation';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }
}

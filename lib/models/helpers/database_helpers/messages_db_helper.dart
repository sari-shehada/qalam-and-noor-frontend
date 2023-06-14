import '../../conversations/message.dart';
import '../../../tools/logic_tools/crud_interface.dart';

import '../../../tools/logic_tools/network_service.dart';

class MessagesDBHelper implements CRUDInterface<Message> {
  String get _controllerName => 'MassegeController/';
  static MessagesDBHelper get instance => MessagesDBHelper();

  @override
  Future<List<Message>> getAll() async {
    String url = '${_controllerName}GetMessages';
    List<Message> allMessages =
        await HttpService.getParsed<List<Message>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return Message.fromMap(e);
          },
        ).toList();
      },
    );
    return allMessages;
  }

  @override
  Future<Message?> getById(int id) async {
    String url = '${_controllerName}GetMessageById?id=$id';
    Message? message =
        await HttpService.getParsed<Message?, Map<String, dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return Message.fromMap(responseData);
      },
    );
    return message;
  }

  Future<List<Message>> getByConversationId(int id) async {
    String url =
        '${_controllerName}GetMessagesByConversationID?conversationId=$id';
    List<Message> messages = await HttpService.getParsed<List<Message>, List>(
      url: url,
      dataMapper: (responseData) {
        return responseData
            .map(
              (e) => Message.fromMap(e),
            )
            .toList();
      },
    );
    return messages;
  }

  Future<int> getMessagesCount() async {
    return await getAll().then((value) => value.length);
  }

  @override
  Future<bool> insert(Message object) async {
    String url = '${_controllerName}InsertMassege';
    int? result = await HttpService.post(
      url: url,
      serializedBody: object.toJson(),
    );
    if (result == null) return false;
    return result == 1;
  }

  @override
  Future<bool> update(Message object) async {
    String url = '${_controllerName}UpdateMessage';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }
}

import '../../conversations/web_conversation.dart';
import '../../../tools/logic_tools/network_service.dart';

class WebConversationDBHelper {
  String get _controllerName => 'WebConversationController/';
  static WebConversationDBHelper get instance => WebConversationDBHelper();

  Future<List<WebConversation>> getAll() async {
    String url = '${_controllerName}GetWebConversations';
    List<WebConversation> allConversations =
        await HttpService.getParsed<List<WebConversation>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return WebConversation.fromMap(e);
          },
        ).toList();
      },
    );
    return allConversations;
  }

  Future<List<WebConversation>> getOpenConversations() async {
    String url = '${_controllerName}GetOpenWebConversations';
    List<WebConversation> allConversations =
        await HttpService.getParsed<List<WebConversation>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return WebConversation.fromMap(e);
          },
        ).toList();
      },
    );
    return allConversations;
  }

  Future<List<WebConversation>> getClosedConversations() async {
    String url = '${_controllerName}GetClosedWebConversations';
    List<WebConversation> allConversations =
        await HttpService.getParsed<List<WebConversation>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return WebConversation.fromMap(e);
          },
        ).toList();
      },
    );
    return allConversations;
  }
}

import 'package:url_launcher/url_launcher.dart';

class URLHelper {
  static void navigateToLink(String link) async {
    Uri url = Uri.parse(link);
    if (!await launchUrl(
      url,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}

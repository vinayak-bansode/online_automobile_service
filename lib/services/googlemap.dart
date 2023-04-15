import 'package:url_launcher/url_launcher.dart';

class GoogleMap {
  void _launchMapsUrl(String address) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$address';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

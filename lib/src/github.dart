import 'package:url_launcher/url_launcher.dart';

class GitHub {
  GitHub._();

  static void open() async {
    const url = "https://github.com/fischerscode/MathTools";
    if (await canLaunch(url)) {
      launch(url);
    }
  }
}

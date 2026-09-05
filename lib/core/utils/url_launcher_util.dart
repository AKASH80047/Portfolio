import 'url_launcher_stub.dart'
    if (dart.library.js_util) 'url_launcher_web.dart'
    if (dart.library.html) 'url_launcher_web.dart';

class UrlLauncherUtil {
  static Future<void> openUrl(String url) async {
    await openPlatformUrl(url);
  }
}

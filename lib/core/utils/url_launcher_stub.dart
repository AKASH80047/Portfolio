import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_filex/open_filex.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openPlatformUrl(String url) async {
  try {
    if (!url.startsWith('http') && !url.startsWith('mailto') && !url.startsWith('tel')) {
      final cleanUrl = url.startsWith('/') ? url.substring(1) : url;
      
      final byteData = await rootBundle.load(cleanUrl);
      final tempDir = await getTemporaryDirectory();
      final fileName = cleanUrl.split('/').last;
      final tempFile = File('${tempDir.path}/$fileName');
      
      await tempFile.writeAsBytes(
        byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes),
        flush: true,
      );
      
      final result = await OpenFilex.open(tempFile.path);
      if (result.type != ResultType.done) {
        debugPrint('Could not open file natively (${result.message}). Trying browser fallback...');
        final fallbackUrl = 'https://raw.githubusercontent.com/AKASH80047/Portfolio/main/$cleanUrl';
        final Uri uri = Uri.parse(fallbackUrl);
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } else {
      final Uri uri = Uri.parse(url);
      try {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } catch (e) {
        debugPrint('Direct launch failed: $e. Trying default launch...');
        await launchUrl(uri);
      }
    }
  } catch (e) {
    debugPrint('Error launching URL ($url): $e');
  }
}

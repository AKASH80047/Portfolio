// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter/foundation.dart';

Future<void> openPlatformUrl(String url) async {
  try {
    String absoluteUrl = url;
    if (!url.startsWith('http') && !url.startsWith('mailto') && !url.startsWith('tel')) {
      final origin = html.window.location.origin;
      final cleanUrl = url.startsWith('/') ? url.substring(1) : url;
      absoluteUrl = '$origin/$cleanUrl';
    }
    final html.AnchorElement anchor = html.AnchorElement(href: absoluteUrl)
      ..target = '_blank'
      ..rel = 'noopener noreferrer';
    html.document.body?.children.add(anchor);
    anchor.click();
    anchor.remove();
  } catch (e) {
    debugPrint('Error launching Web URL ($url): $e');
  }
}

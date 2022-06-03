import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class DetailBookPage extends StatelessWidget {
  const DetailBookPage({Key? key, this.pdfUrl}) : super(key: key);

  final String? pdfUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const PDF(
        enableSwipe: true,
        swipeHorizontal: false,
      ).cachedFromUrl(pdfUrl!),
    );
  }
}

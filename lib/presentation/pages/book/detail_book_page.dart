import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class DetailBookPage extends StatelessWidget {
  const DetailBookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PDF(
        enableSwipe: true,
        swipeHorizontal: true,
      ).cachedFromUrl('http://africau.edu/images/default/sample.pdf'),
    );
  }
}
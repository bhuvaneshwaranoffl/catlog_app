import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerPage extends StatelessWidget {
  final String name;
  final String pdfPath;

  const PdfViewerPage({super.key, required this.pdfPath, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(name),
      ),
 body: SfPdfViewer.asset(
          pdfPath),
    );

  }
}

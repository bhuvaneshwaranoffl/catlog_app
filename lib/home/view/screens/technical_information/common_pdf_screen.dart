import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class CommonPdfPage extends StatefulWidget {
  final String name;
   final String url;
  const CommonPdfPage({super.key, required this.url, required this.name});

  @override
  State<CommonPdfPage> createState() => _CommonPdfPageState();
}

class _CommonPdfPageState extends State<CommonPdfPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:Text(widget.name),
        ),
        body: SfPdfViewer.asset(widget.url.toString()));
  }
}

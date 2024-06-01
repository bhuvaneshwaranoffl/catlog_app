import 'package:catalogue/home/model/technical_info_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class CommonPdfPage extends StatefulWidget {
  final String name;
   final int index; // Add index as a parameter
  final List<SubmittalData>? submittalData;
  const CommonPdfPage({super.key, required this.name, this.submittalData, required this.index,});

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
        body: SfPdfViewer.asset(widget.submittalData![widget.index].urlPdf.toString()));
  }
}

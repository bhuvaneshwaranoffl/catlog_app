import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ChemicalResistance extends StatefulWidget {
  const ChemicalResistance({super.key});

  @override
  State<ChemicalResistance> createState() => _ChemicalResistanceState();
}

class _ChemicalResistanceState extends State<ChemicalResistance> {
   String pdfPath = 'assets/pdf/proposal.pdf'; // Path to your PDF file

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Chemical Resistance"),
        ),
        body: SfPdfViewer.asset(pdfPath.toString()));
  }
}
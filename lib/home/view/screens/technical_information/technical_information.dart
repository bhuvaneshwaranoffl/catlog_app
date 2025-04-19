
import 'dart:convert';
import 'package:catalogue/home/model/technical_info_model.dart';
import 'package:catalogue/home/view/screens/technical_information/node_page.dart';
import 'package:catalogue/home/view/screens/technical_information/pdf_viewer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';




class TechnicalInformation extends StatefulWidget {
  const TechnicalInformation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TechnicalInformationState createState() => _TechnicalInformationState();
}

class _TechnicalInformationState extends State<TechnicalInformation> {
  List<Node> nodes = [];
  Node? currentNode;
  int currentIndex = 0;

 Future<List<Node>> loadJsonData() async {
    String jsonString = await rootBundle.loadString('assets/json/technical_info.json');
    final jsonResponse = json.decode(jsonString);
    return (jsonResponse['technicalInfo'] as List)
        .map((i) => Node.fromJson(i))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    loadJsonData().then((data) {
      setState(() {
        nodes = data;
        currentNode = nodes.isNotEmpty ? nodes[0] : null;
      });
    });
  }
  void openPdf(String pdfPath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PdfViewerPage(pdfPath: pdfPath, name:'',),
      ),
    );
  }

  void navigateToNode(Node node) {
   
   if (node.name == "Frequently Asked Questions") {
      context.pushNamed('/faq');
    }
   
   else if (node.value.isEmpty && node.url != null && node.url!.isNotEmpty) {
      openPdf(node.url!);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NodePage(node: node),
        ),
      );
    }
  }

  Widget buildNode(Node node) {
    return LayoutBuilder(
      builder: (context,constraints){
        double height;
        double padding;
        double  paddingVertical;
        if(constraints.maxWidth>600&& MediaQuery.of(context).orientation ==  Orientation.landscape){
         height=100.h;
         padding=130;
         paddingVertical=18.h;
        }else{
          height=50.h;
          padding=10.0;
          paddingVertical=10.h;
        }
      return Padding(
        padding:  EdgeInsets.symmetric(vertical: paddingVertical,horizontal: padding),
        child: Container(
          height: height,
           decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(9.r),
            boxShadow: [
              BoxShadow(
                 color: Colors.grey.shade500,
                spreadRadius: 2.r,
                blurRadius: 5.r,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: ListTile(
              title: Text(node.name),
              leading: Image.asset(node.img, width: 50, height: 50),
              onTap: () => navigateToNode(node),
            ),
          ),
        ),
      );
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Technical Information'),
      ),
      body: nodes.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: nodes.map(buildNode).toList(),
            ),
    );
  }
}


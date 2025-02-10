
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






















// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class TechnicalInformation extends StatefulWidget {
//   const TechnicalInformation({super.key});

//   @override
//   State<TechnicalInformation> createState() => _TechnicalInformationState();
// }

// class _TechnicalInformationState extends State<TechnicalInformation> {
//   // ignore: prefer_final_fields
//   bool _isLoading = true;

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   // Fetch data asynchronously
//   //   fetchData();
//   // }

//   // Future<void> fetchData() async {
//   //  // final getData = Provider.of<TechnicalInfoProvider>(context, listen: false);

//   //   try {
//   //     await getData.fetchTechnicalInfo();
//   //   } catch (error) {
//   //     // Handle error if any
//   //     print('Error fetching data: $error');
//   //   } finally {
//   //     // Set isLoading to false once data is fetched
//   //     setState(() {
//   //       _isLoading = false;
//   //     });
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//    // final getData = Provider.of<TechnicalInfoProvider>(context, listen: true);

//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           "Technical  Information",
//           style: TextStyle(fontSize: 17.sp),
//         ),
//       ),
//       body: _isLoading
//           ? const Center(
//               child: CircularProgressIndicator()) // Show loading indicator
//           : LayoutBuilder(builder: (context, constraints) {
//               double height;
//               double paddingValue; // Default padding value
//               double fontSize;
//               double paddingValue2;
//               if (constraints.maxWidth > 600 &&
//                   MediaQuery.of(context).orientation == Orientation.landscape) {
//                 height = 70;
//                 paddingValue2 = 20;
//                 paddingValue =
//                     50.0; // Adjusted padding value for landscape mode
//                 fontSize = 8.sp;
//               } else {
//                 paddingValue = 10;
//                 paddingValue2 = 10;
//                 height = 60.h;
//                 fontSize = 17.sp;
//               }
//               return ListView.builder(
//                 itemCount:10,
//                 itemBuilder: (BuildContext context, index) {
//                   return Padding(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: paddingValue.w, vertical: paddingValue2.h),
//                     child: GestureDetector(
//                       onTap: () {
//                         // if (getData.technicalInfo[index].name ==
//                         //     "Frequently Asked Questions") {
//                         //    context.pushNamed('/faq');
//                         // } else {
//                         //   // Navigator.push(
//                         //   //     context,
//                         //   //     MaterialPageRoute(
//                         //   //         builder: (context) => SecondCommonScreen(
//                         //   //               submittalCategory:
//                         //   //                   getData.technicalInfo[index].value,
//                         //   //               name: getData.technicalInfo[index].name,
//                         //   //             )));
//                         // }
//                       },
//                       child: Container(
//                         height: height,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(9.r),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.5),
//                               spreadRadius: 2.r,
//                               blurRadius: 5.r,
//                               offset: const Offset(0, 2),
//                             ),
//                           ],
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               // Container(
//                               //   height: 70.h,
//                               //   width: 70.w,
//                               //   decoration: BoxDecoration(
//                               //     borderRadius: BorderRadius.circular(8.r),
//                               //     color: const Color.fromARGB(245, 254, 14, 14),
//                               //   ),
//                               //   child: const Icon(
//                               //     Icons.person_2_outlined,
//                               //     size: 30,
//                               //     color: Colors.white,
//                               //   ),
//                               // ),
//                               // SizedBox(width: 20.w),
//                               Text(
//                                 "getData.technicalInfo[index].name",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: fontSize,
//                                 ),
//                               ),
//                               // const Icon(
//                               //   Icons.folder,
//                               //   size: 35,
//                               //   color: Constant.scaffoldBackground,
//                               // ),
//                               // Image.asset(getData.technicalInfo[index].img,
//                               // height: 40,
//                               // width: 40,),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }),
           
//     );
//   }
// }

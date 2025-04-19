import 'package:catalogue/home/provider/faq_provider.dart';
import 'package:catalogue/home/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  @override
  void initState() {
    final getData = Provider.of<FaqProvider>(context, listen: false);
    getData.readjson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final getData = Provider.of<FaqProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constant.scaffoldBackground,
        title: const Text(
          "Frequently Asked Questions",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: ListView.builder(
          itemCount: getData.getfAQ.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Material(
                color: Colors.transparent,
                elevation: 4, // Adjust elevation for shadow
                borderRadius: BorderRadius.circular(
                    15.r), // Apply rounded corners to shadow
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: ExpansionTile(
                    title: Text(
                      getData.getfAQ[index]['question'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: Constant.scaffoldBackground,
                      ),
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.h),
                        child: Text(
                          getData.getfAQ[index]['answer'],
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black87,
                          ),
                        ).animate().fadeIn(duration: 300.ms).scale(),
                      ),
                    ],
                  ).animate().slide(duration: 500.ms),
                ),
              ).animate().fadeIn(duration: 500.ms).scale(),
            );
          },
        ),
      ),
    );
  }
}




// import 'package:catalogue/home/provider/faq_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';

// class FAQPage extends StatefulWidget {
//   const FAQPage({super.key});

//   @override
//   State<FAQPage> createState() => _FAQPageState();
// }

// class _FAQPageState extends State<FAQPage> {
//   @override
//   void initState() {
//     final getData = Provider.of<FaqProvider>(context, listen: false);
//     getData.readjson();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final getData = Provider.of<FaqProvider>(context, listen: true);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("FAQ"),
//       ),
//       body: ListView.builder(
//           itemCount: getData.getfAQ.length,
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(9.r),
//                   boxShadow: [
//                     BoxShadow(
//                        color: Colors.grey.shade500,
//                       spreadRadius: 2.r,
//                       blurRadius: 5.r,
//                       offset: const Offset(0, 2),
//                     ),
//                   ],
//                 ),
//                 child: ExpansionTile(
//                   title: Text(
//                     getData.getfAQ[index]['question'],
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         getData.getfAQ[index]['answer'],
//                         style: const TextStyle(
//                           fontSize: 16.0,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }),
//     );
//   }
// }

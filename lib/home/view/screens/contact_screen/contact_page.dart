import 'package:catalogue/home/model/home_page_model.dart';
import 'package:catalogue/home/view/widget/custom_appbar.dart';
import 'package:catalogue/home/view/widget/custom_contact_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  List<Item> items = [
    Item("", "Customer Service"),
    Item("", "Manufacturing Representatives"),
    Item("", "Regional Managers"),
    Item("", "Technical Support"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints){
           double height;
        double fontSize;
        if (constraints.maxWidth > 600 &&
            MediaQuery.of(context).orientation == Orientation.landscape) {
          height = 100;
          fontSize = 11.3.sp;
        } else {
          height = 163;
          fontSize = 17.sp;
        }
        return Stack(
          children: [
            CustomPaint(
               size: const Size.fromHeight(220.0),
              painter: CurvedTickAppBarPainter(),
              child: Container(
                height:height, // Height of your AppBar
              ),
            ),
            Column(
              children: [
                SizedBox(
                 // height: 120.h, // Height of your AppBar
                  child: AppBar(
                    title: Text("CONTACT ",
                    style: TextStyle(fontSize:fontSize,
                    fontWeight: FontWeight.w600),),
                    centerTitle: true,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                ),
                Expanded(
                  child: OrientationBuilder(
                    builder: (context, orientation) {
                      return ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (BuildContext context, index) {
                          return ContactItem(
                            onTap: () {
                              if (items[index].name == "Customer Service") {
                                context.pushNamed("/customer");
                               // context.pushNamed('/faq');
                              }
                              if (items[index].name ==
                                  "Manufacturing Representatives") {
                                context.pushNamed("/rep");
                              }
                              if (items[index].name == "Regional Managers") {
                                context.pushNamed("/region");
                              }
                              if (items[index].name == "Technical Support") {
                                context.pushNamed("/techsupport");
                              }
                            },
                            itemName: items[index].name,
                            isLandscape: orientation == Orientation.landscape,
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        );
        }
      ),
    );
  }
}

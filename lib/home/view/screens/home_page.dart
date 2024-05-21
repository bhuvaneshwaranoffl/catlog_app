import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../model/home_page_model.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   
  List<Item> items = [
    Item("assets/pic22.jpeg", "NO-HUB FITTINGS"),
    Item("assets/pic1.png", "SV-HUB&SPIGOT FITTINGS"),
    Item("assets/pic3.webp", "CHEMICAL RESISTANCE"),
    Item("assets/pic4.webp", "TECHNICAL INFORMATION"),
    Item("assets/pic6.jpg", "ENGINEERING CALCULATOR"),
    Item("assets/pic5.jpg", "PRODUCT WARRENTY ISSUES"),
  ];
  // ignore: unused_field
  //int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
    //  backgroundColor: const Color.fromARGB(255, 137, 24, 16),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          centerTitle: true,
          title: Text(
            "ABC FOUNDRY",
            style: TextStyle(
              color: Colors.white,
              fontSize: 19.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                context.pushNamed("/aboutus");
              },
              icon: const Icon(Icons.report_gmailerrorred),
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.r),
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Calculate crossAxisCount dynamically based on screen width and orientation
            double mainAxisheight;
            int crossAxisCount;
            double height;
            if (constraints.maxWidth > 600 &&
                MediaQuery.of(context).orientation == Orientation.landscape) {
              crossAxisCount = 2;
              mainAxisheight = 150;
              height = 50;
            } else {
              crossAxisCount = constraints.maxWidth > 600 ? 2 : 2;
              mainAxisheight = 130;
              height = 40;
            }

            return GridView.builder(
              itemCount: items.length,
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisExtent: mainAxisheight,
                crossAxisSpacing: 20.h,
                mainAxisSpacing: 20.h,
              ),
              itemBuilder: (BuildContext context, index) {
                return GestureDetector(
                  onTap: () {
                    if (items[index].name == "NO-HUB FITTINGS") {
                       context.pushNamed("/nohub");
                    }
                    if (items[index].name == "SV-HUB&SPIGOT FITTINGS") {
                       context.pushNamed("/svhub");
                    }
                    if (items[index].name == "CHEMICAL RESISTANCE") {
                       context.pushNamed("/chemical");
                    }
                    if (items[index].name == "TECHNICAL INFORMATION") {
                       context.pushNamed("/technical");
                    }
                    if (items[index].name == "ENGINEERING CALCULATOR") {
                      context.pushNamed("/calcimain");
                    }
                    if (items[index].name == "PRODUCT WARRENTY ISSUES") {
                      context.pushNamed("/warrenty");
                    }
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.7),
                              spreadRadius: 6,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                          image: DecorationImage(
                            image: AssetImage(items[index].image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0.h,
                        left: 0.w,
                        right: 0.w,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.8),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20.r),
                                  bottomRight: Radius.circular(20.r))),
                          height: height,
                          padding: EdgeInsets.all(8.r),
                          child: Text(
                            items[index].name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

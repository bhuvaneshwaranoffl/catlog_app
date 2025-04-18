import 'package:catalogue/home/view/widget/custom_appbar.dart';
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
    Item("assets/illustration/water-pipe.png", "NO-HUB FITTINGS"),
    Item("assets/illustration/tubes.png", "SV-HUB & SPIGOT FITTINGS"),
    Item("assets/illustration/chemical-reaction.png", "CHEMICAL RESISTANCE"),
    Item("assets/illustration/troubleshooting.png", "TECHNICAL INFORMATION"),
    Item("assets/illustration/3d-calculator.png", "ENGINEERING CALCULATOR"),
    Item("assets/illustration/online-survey.png", "WARRANTY ISSUES"),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double height;
          double fontSize;
          int flex;
          if (constraints.maxWidth > 600 &&
              MediaQuery.of(context).orientation == Orientation.landscape) {
            height = 120;
            fontSize = 11.3.sp;
            flex = 3;
          } else {
            height = 163;
            fontSize = 17.sp;
            flex = 6;
          }
          return Stack(
            children: [
              CustomPaint(
                size: const Size.fromHeight(220.0),
                painter: CurvedTickAppBarPainter(),
                child: Container(
                  height: height,
                ),
              ),
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                title: Text(
                  "PRODUCT INFORMATIONS",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w600,
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
              Column(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: flex,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double mainAxisheight;
                        int crossAxisCount;
                        double height;
                        double width;
                        double imgHeight;
                        double imgwidth;
                        double font;
                      //  double padding;
                        if (constraints.maxWidth < 600) {
                          // Mobile layout
                          crossAxisCount = 2;
                          mainAxisheight = 148;
                          height = 130;
                          width = 300;
                          imgwidth = 35.w;
                          imgHeight = 35.h;
                          font = 12.sp;
                        //  padding = 40.h;
                        } else if (constraints.maxWidth > 1280 &&
                            MediaQuery.of(context).orientation ==
                                Orientation.landscape) {
                          // Tablet/Large screen in Landscape
                          crossAxisCount = 3;
                          mainAxisheight = 130;
                          height = 110;
                          width = 370;
                          imgwidth = 45.w;
                          imgHeight = 45.h;
                          font = 3.sp;
                        //  padding = 10.h;
                        } else {
                          // Default case (Medium screens, portrait tablets, etc.)
                          crossAxisCount = 3;
                          mainAxisheight = 130;
                          height = 100;
                          width = 170;
                          imgwidth = 75.w;
                          imgHeight = 75.h;
                          font = 4.sp;
                         // padding = 10.h;
                        }

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                            itemCount: items.length,
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              mainAxisExtent: mainAxisheight,
                              crossAxisSpacing: 2.h,
                              mainAxisSpacing: 2.h,
                            ),
                            itemBuilder: (BuildContext context, index) {
                              return GestureDetector(
                                onTap: () {
                                  switch (items[index].name) {
                                    case "NO-HUB FITTINGS":
                                      context.pushNamed("/nohub");
                                      break;
                                    case "SV-HUB & SPIGOT FITTINGS":
                                      context.pushNamed("/svhub");
                                      break;
                                    case "CHEMICAL RESISTANCE":
                                      context.pushNamed("/chemical");
                                      break;
                                    case "TECHNICAL INFORMATION":
                                      context.pushNamed("/technical");
                                      break;
                                    case "ENGINEERING CALCULATOR":
                                      context.pushNamed("/calcimain");
                                      break;
                                    case "WARRANTY ISSUES":
                                      context.pushNamed("/warrenty");
                                      break;
                                  }
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: height,
                                      width: width,
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Color.fromARGB(255, 154, 4, 4),
                                              Color.fromARGB(155, 207, 19, 19),
                                            ]),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20.r),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade500,
                                            spreadRadius: 3,
                                            blurRadius: 4,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        // image: DecorationImage(
                                        //   image: AssetImage(items[index].image),
                                        //   fit: BoxFit.cover,
                                        // ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: imgHeight,
                                            width: imgwidth,
                                            child:
                                                Image.asset(items[index].image),
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Text(
                                            items[index].name,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: font,
                                                fontWeight: FontWeight.w800),
                                            softWrap: true,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}

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
    Item("assets/illustration/tubes.png", "SV-HUB&SPIGOT FITTINGS"),
    Item("assets/illustration/chemical-reaction.png", "CHEMICAL RESISTANCE"),
    Item("assets/illustration/troubleshooting.png", "TECHNICAL INFORMATION"),
    Item("assets/illustration/3d-calculator.png", "ENGINEERING CALCULATOR"),
    Item("assets/illustration/list.png", "PRODUCT WARRANTY ISSUES"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            // size: const Size.fromHeight(200.0),
            painter: CurvedTickAppBarPainter(),
            child: Container(
              height: 230.h,
            ),
          ),
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              "ABC FOUNDRY",
              style: TextStyle(
                color: Colors.white,
                fontSize: 19.sp,
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
                flex: 5,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double mainAxisheight;
                    int crossAxisCount;
                    double height;
                    double width;
                    double imgHeight;
                    double imgwidth;
                    double font;
                    double padding;
                    if (constraints.maxWidth > 600 &&
                        MediaQuery.of(context).orientation ==
                            Orientation.landscape) {
                      crossAxisCount = 2;
                      mainAxisheight = 150;
                      height = 130;
                      width = 300;
                      imgwidth = 95.w;
                      imgHeight = 95.h;
                      font=7.sp;
                      padding=40.h;
                    } else {
                      crossAxisCount = 2;
                      mainAxisheight = 130;
                      height = 90;
                      width = 150;
                      imgwidth = 30.w;
                      imgHeight = 30.h;
                      font=9.sp;
                      padding=13.h;
                    }

                    return GridView.builder(
                      itemCount: items.length,
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        mainAxisExtent: mainAxisheight,
                        crossAxisSpacing: 20.h,
                        mainAxisSpacing: 10.h,
                      ),
                      itemBuilder: (BuildContext context, index) {
                        return GestureDetector(
                          onTap: () {
                            switch (items[index].name) {
                              case "NO-HUB FITTINGS":
                                context.pushNamed("/nohub");
                                break;
                              case "SV-HUB&SPIGOT FITTINGS":
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
                              case "PRODUCT WARRANTY ISSUES":
                                context.pushNamed("/warranty");
                                break;
                            }
                          },
                          child: Column(
                            children: [
                              Container(
                                height: height,
                                width: width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.7),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  // image: DecorationImage(
                                  //   image: AssetImage(items[index].image),
                                  //   fit: BoxFit.cover,
                                  // ),
                                ),
                                child: Padding(
                                  padding:EdgeInsets.only(top:padding),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: imgHeight,
                                        width: imgwidth,
                                        child: Image.asset(items[index].image),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Text(
                                        items[index].name,
                                        style: TextStyle(
                                            fontSize:font,
                                            fontWeight: FontWeight.w800),
                                        softWrap: true,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.h),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

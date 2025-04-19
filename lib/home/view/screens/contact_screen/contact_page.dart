import 'package:catalogue/home/provider/contact_provider.dart';
import 'package:catalogue/home/view/widget/custom_appbar.dart';
import 'package:catalogue/home/view/widget/custom_contact_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<ContactProvider>(context, listen: false).loadContacts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double height;
          double fontSize;
          final isLandscape =
              MediaQuery.of(context).orientation == Orientation.landscape;

          if (constraints.maxWidth > 600 && isLandscape) {
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
                child: Container(height: height),
              ),
              Column(
                children: [
                  AppBar(
                    title: Text(
                      "CONTACT",
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    centerTitle: true,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  SizedBox(height: 30.h),
                  Expanded(
                    child: Consumer<ContactProvider>(
                      builder: (context, provider, _) {
                        final categories = provider.categories;

                        if (categories.isEmpty) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        return ListView.builder(
                          itemCount: categories.length,
                          itemBuilder: (BuildContext context, int index) {
                            final title = categories[index].title;
                            return ContactItem(
                              onTap: () {
                                context.pushNamed("/detailedPage",extra: categories[index]);
                              },
                              itemName: title
                                  .replaceAll("_", " ")
                                  .toUpperCase(), // better visual
                              isLandscape: isLandscape,
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
        },
      ),
    );
  }
}


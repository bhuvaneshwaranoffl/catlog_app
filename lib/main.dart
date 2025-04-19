import 'package:catalogue/home/provider/contact_provider.dart';
import 'package:catalogue/home/provider/faq_provider.dart';
import 'package:catalogue/home/provider/home_item_provider.dart';
import 'package:catalogue/home/routes/router.dart';
import 'package:catalogue/home/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      child: MultiProvider(
        providers: [
         // ChangeNotifierProvider(create: (_)=>TechnicalInfoProvider()),
            ChangeNotifierProvider(create: (_) => FaqProvider()),
            ChangeNotifierProvider(create: (_) => ContactProvider()..loadContacts()),
             ChangeNotifierProvider(create: (_) => ItemProvider()..loadItems()),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Catalog app',
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
                titleTextStyle: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold
                ),
                color:Constant.scaffoldBackground,
                iconTheme: IconThemeData(color: Colors.white)),
           colorScheme:
                ColorScheme.fromSeed(seedColor:const Color.fromARGB(213, 172, 37, 27)),
            useMaterial3: true,
          ),
          routerConfig: router,
          //home: const MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }
}

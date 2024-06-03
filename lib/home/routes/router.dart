// router_config.dart
import 'package:catalogue/home/controller/bottom_nav_bar_controller.dart/home_bottom_bar.dart';
import 'package:catalogue/home/controller/bottom_nav_bar_controller.dart/tech_info_main.dart';
import 'package:catalogue/home/view/screens/about_us.dart';
import 'package:catalogue/home/view/screens/calculator/min_slope/min_slope.dart';
import 'package:catalogue/home/view/screens/calculator/thrust_forces/thrust_force.dart';
import 'package:catalogue/home/view/screens/chemical_resistance/chemical_resitance.dart';
import 'package:catalogue/home/view/screens/contact_screen/contact_page.dart';
import 'package:catalogue/home/view/screens/calculator/calci_main_screen.dart';
import 'package:catalogue/home/view/screens/contact_screen/customer_service.dart';
import 'package:catalogue/home/view/screens/contact_screen/manufacturing_rep.dart';
import 'package:catalogue/home/view/screens/contact_screen/regional_managers.dart';
import 'package:catalogue/home/view/screens/contact_screen/technical_support.dart';
import 'package:catalogue/home/view/screens/no_hub_fittings/no_hub_fittings.dart';
import 'package:catalogue/home/view/screens/sv_hub_fittings/sv_hub_fittings.dart';
import 'package:catalogue/home/view/screens/technical_information/faq_page.dart';
import 'package:catalogue/home/view/screens/warrenty_issue.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: "/home",
  errorPageBuilder: (context, state) =>
      const MaterialPage(child: Text('Page not found!')),
  routes: <RouteBase>[
    GoRoute(
      name: "/home",
      path: "/home",
      builder: (context, state) {
        //return const HomePage();
        return const BottomNavBarPage();
      },
    ),
    GoRoute(
      name: "/aboutus",
      path: "/aboutus",
      builder: (context, state) {
        return const AboutUsPage();
      },
    ),
    GoRoute(
      name: "/warrenty",
      path: "/warrenty",
      builder: (context, state) {
        return const WarrentyIssue();
      },
    ),
    GoRoute(
      name: "/calcimain",
      path: "/calcimain",
      builder: (context, state) {
        return const CalciMainPage();
      },
    ),
    GoRoute(
      name: "/contact",
      path: "/contact",
      builder: (context, state) {
        return const ContactPage();
      },
    ),
    GoRoute(
      name: "/thrustforce",
      path: "/thrustforce",
      builder: (context, state) {
        return const ThrustForce();
      },
    ),
    GoRoute(
      name: "/minslope",
      path: "/minslope",
      builder: (context, state) {
        return const MinSlope();
      },
    ),
    GoRoute(
      name: "/chemical",
      path: "/chemical",
      builder: (context, state) {
        return const ChemicalResistance();
      },
    ),
    GoRoute(
      name: "/technical",
      path: "/technical",
      builder: (context, state) {
        return const TechBottomMainNavBar();
      },
    ),
    GoRoute(
      name: "/nohub",
      path: "/nohub",
      builder: (context, state) {
        return const NoHubFittings();
      },
    ),
    GoRoute(
      name: "/svhub",
      path: "/svhub",
      builder: (context, state) {
        return const SvFittingsHub();
      },
    ),
    GoRoute(
      name: "/customer",
      path: "/customer",
      builder: (context, state) {
        return const CustomerService();
      },
    ),
    GoRoute(
      name: "/rep",
      path: "/rep",
      builder: (context, state) {
        return const ManufacturingRep();
      },
    ),
    GoRoute(
      name: "/region",
      path: "/region",
      builder: (context, state) {
        return const RegionalManagers();
      },
    ),
    GoRoute(
      name: "/techsupport",
      path: "/techsupport",
      builder: (context, state) {
        return const TechnicalSupport();
      },
    ),
    // GoRoute(
    //   name: "/secondscreen",
    //   path: "/secondscreen",
    //   builder: (context, state) {
    //     return const SecondCommonScreen();
    //   },
    // ),
    // GoRoute(
    //   name: "/thirdscreen",
    //   path: "/thirdscreen",
    //   builder: (context, state) {
    //     return const ThirdCommonScreen();
    //   },
    // ),
    GoRoute(
      name: "/faq",
      path: "/faq",
      builder: (context, state) {
        return const FAQPage();
      },
    ),
  ],
);

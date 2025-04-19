// router_config.dart
import 'package:catalogue/home/controller/bottom_nav_bar_controller.dart/home_bottom_bar.dart';
import 'package:catalogue/home/controller/bottom_nav_bar_controller.dart/tech_info_main.dart';
import 'package:catalogue/home/model/contact.dart';
import 'package:catalogue/home/view/screens/about_us.dart';
import 'package:catalogue/home/view/screens/calculator/min_slope/min_slope.dart';
import 'package:catalogue/home/view/screens/calculator/thrust_forces/thrust_force.dart';
import 'package:catalogue/home/view/screens/chemical_resistance/chemical_resitance.dart';
import 'package:catalogue/home/view/screens/contact_screen/contact_page.dart';
import 'package:catalogue/home/view/screens/calculator/calci_main_screen.dart';
import 'package:catalogue/home/view/screens/contact_screen/dynamic_contact_page.dart';
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
      name: "/faq",
      path: "/faq",
      builder: (context, state) {
        return const FAQPage();
      },
    ),
   GoRoute(
      name: '/detailedPage',
      path: '/detailedPage',
      builder: (context, state) {
        final category = state.extra as ContactCategory;
        return DynamicContactPage(
          category: category.title,
          entries: category.entries,
        );
      },
    ),


  ],
);

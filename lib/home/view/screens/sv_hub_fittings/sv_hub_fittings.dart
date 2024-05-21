import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SvFittingsHub extends StatefulWidget {
  const SvFittingsHub({super.key});

  @override
  State<SvFittingsHub> createState() => _SvFittingsHubState();
}

class _SvFittingsHubState extends State<SvFittingsHub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("SV-HUB & Spigot Fittings",style: TextStyle(
          fontSize: 17.sp
        ),),
      ),
    );
  }
}
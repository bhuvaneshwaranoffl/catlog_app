import 'package:catalogue/home/view/widget/custom_customer_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerService extends StatefulWidget {
  const CustomerService({super.key});

  @override
  State<CustomerService> createState() => _CustomerServiceState();
}

class _CustomerServiceState extends State<CustomerService> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Customer service",
          style: TextStyle(fontSize: 17.sp),
        ),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        return CustomCustomerSerice(isLandscape: orientation == Orientation.landscape);
      }),
    );
  }
}

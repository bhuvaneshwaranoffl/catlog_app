import 'package:catalogue/home/model/home_page_model.dart';
import 'package:catalogue/home/view/widget/custom_contact_page.dart';
import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: const Text("Contact"),
        centerTitle: true,
      ),
      body: OrientationBuilder(
          builder: (context, orientation){
          return ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, index) {
            return ContactItem( 
              onTap: (){
                 if (items[index].name == "Customer Service") {
                  context.pushNamed("/customer");
                }
                if (items[index].name == "Manufacturing Representatives") {
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
        }
      ),
    );
  }
}

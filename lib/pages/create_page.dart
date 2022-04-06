import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pattern_getx_methods/controllers/create_controller.dart';

import '../views/widget_textfield.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);
  static String id = "/create_page";

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final createController = CreatePageController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Post"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              createController.apiCreatePost(context);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Obx(()=>itemOfTextField(),)
    );
  }

  Container itemOfTextField() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          texformField(
              hintext: 'Title', controller: createController.titleController()),
          texformField(
              hintext: 'Body', controller: createController.bodyController()),
        ],
      ),
    );
  }
}

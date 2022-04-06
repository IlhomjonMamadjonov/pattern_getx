import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pattern_getx_methods/controllers/edit_controller.dart';
import 'package:pattern_getx_methods/models/post_model.dart';
import 'package:pattern_getx_methods/views/widget_textfield.dart';

class EditPage extends StatefulWidget {
  Post? post;
  static final String id = "/edit_page";

  EditPage({Key? key, required this.post}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final editController = EditPageController();

  @override
  void initState() {
    super.initState();
    editController.editPagePost(widget.post!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Post"),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              editController.apiEditData(context);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Obx(()=>Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            texformField(hintext: "Title", controller: editController.titleController()),
            texformField(hintext: "Body", controller: editController.bodyController()),
          ],
        ),
      ),)
    );
  }
}

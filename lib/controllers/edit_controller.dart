import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pattern_getx_methods/models/post_model.dart';

import '../services/http_service.dart';

class EditPageController extends GetxController{
  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> bodyController = TextEditingController().obs;
  Post? _post;

  void editPagePost(Post post) {
    _post = post;
    titleController.value.text =_post?.title ?? "No Data";
    bodyController.value.text = _post?.body ?? "No Data";
  }
  void apiEditData(BuildContext context) async{
    String title = titleController.value.text.toString().trim();
    String body = bodyController.value.text.toString().trim();
    if(_post != null){
      Post post = Post(id: _post!.id, title: title, body: body, userId: body.length);
      String? result = await Network.PUT(Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post));
      if(result != null) {
        Navigator.pop(context, result);
      } else {
      }
    }
  }
}
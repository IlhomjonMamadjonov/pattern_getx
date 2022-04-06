import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pattern_getx_methods/models/post_model.dart';

import '../services/http_service.dart';

class CreatePageController extends GetxController{
  bool isLoading = false;
  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> bodyController = TextEditingController().obs;


  void apiCreatePost(BuildContext context) async{
    isLoading = true;

    String title = titleController.value.text.toString().trim();
    String body = bodyController.value.text.toString().trim();
    Post post =Post(title: title, body: body, userId: body.hashCode);
    String? result = await Network.POST(Network.API_CREATE, Network.paramsCreate(post));
    if (kDebugMode) {
      print(result.toString());
    }
    if(result != null){
      Get.back(result:result);
    }
    else{
    }
  }
}
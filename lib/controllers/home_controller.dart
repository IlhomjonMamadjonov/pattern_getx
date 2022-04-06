import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pattern_getx_methods/models/post_model.dart';
import 'package:pattern_getx_methods/pages/create_page.dart';
import 'package:pattern_getx_methods/pages/edit_page.dart';
import 'package:pattern_getx_methods/services/http_service.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var items = [].obs;

  Future apiPostList() async {
    isLoading(true);

    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null) {
      items.value = Network.parsePostList(response);
    } else {
      items.value = [];
    }
    isLoading(false);
  }

  Future apiPostDelete(Post post) async {
    isLoading(true);

    var response = await Network.DEL(
        Network.API_DELETE + post.id.toString(), Network.paramsEmpty());

    if (response != null) {
      apiPostList();
    }
    isLoading(false);
  }

  Future goToEditPage(Post post, BuildContext context) async {
    String result = await Get.to(EditPage(
      post: post,
    ));
    Post newPost = Network.parsePost(result);
    items[items.indexWhere((element) => element.id == newPost.id)] = newPost;
  }

  Future goToCreatePage(BuildContext context) async {
    String? result = await Get.to(CreatePage());
    if (result == null) return;
    items.add(Network.parsePost(result));
  }
}

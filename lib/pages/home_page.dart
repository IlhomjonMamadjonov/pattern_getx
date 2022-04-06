import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pattern_getx_methods/controllers/home_controller.dart';
import 'package:pattern_getx_methods/views/item_of_post.dart';
import 'package:pattern_getx_methods/views/loading_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final String id = "/home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    _controller.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX Methods"),
      ),
      body: Obx(
        () => Stack(
          children: [
            ListView.builder(
                itemCount: _controller.items.length,
                itemBuilder: (ctx, index) {
                  return itemOfPost(_controller, _controller.items[index]);
                }),
            LoadingWidget(isLoading: _controller.isLoading.value,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        onPressed: () {
          _controller.goToCreatePage(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

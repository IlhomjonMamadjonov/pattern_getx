import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pattern_getx_methods/controllers/home_controller.dart';
import 'package:pattern_getx_methods/models/post_model.dart';


Widget itemOfPost(HomeController homeController, Post post) {
  return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.25,
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (BuildContext context) {
              homeController.apiPostDelete(post);
            },
            flex: 3,
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
          )
        ],
      ),
    startActionPane: ActionPane(
      extentRatio: 0.25,
      motion: ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (BuildContext context){
            homeController.goToEditPage(post,context);
          },
          flex: 3,
          backgroundColor: Colors.tealAccent,
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: 'Edit',
        )
      ],
    ),
      child:Container(
        padding: EdgeInsets.only(left: 20, right: 20, top:20,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.title!.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5,),
            Text(post.body!),
          ],
        ),
      ),);
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search_helper_example/view/home_screen.dart';

class SplashScreen extends StatelessWidget {

  String dotCoderLogo = 'https://raw.githubusercontent.com/OsamaQureshi796/MealMonkey/main/assets/dotcoder.png';

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5),()=> Get.offAll(()=>HomeScreen()));
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(width: Get.width,
                height: 150,
                child: Image.network(dotCoderLogo,fit: BoxFit.cover,),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            Text("Search by DOTCODER")

          ],
        ),
      ),
    );
  }
}

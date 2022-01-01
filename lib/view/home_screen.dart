import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search_helper/search_helper.dart';
import 'package:search_helper_example/controller/data_controller.dart';
import 'package:search_helper_example/model/post_model.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DataController dataController = Get.put(DataController(), permanent: true);
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          children: [
            TextField(
              onChanged: (input){

                print(input.isEmpty);
                if(input.isEmpty){
                  dataController.resetBack();
                }else{
                  print("Data is ${dataController.posts.length}");
                  var result = SearchHelper.searchModel(data: dataController.posts,properties: ['title'],searchWord: input);

                  print(result.length);

                  dataController.filteredPosts.value = [];

                  result.forEach((e){
                    dataController.filteredPosts.add(PostModel.fromJson(e));
                  });
                }



              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search here...'
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: Obx(() => dataController.isPostsLoading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemBuilder: (ctx, i) {
                          String title =
                              dataController.filteredPosts.value[i].title;
                          return Card(
                            child: ListTile(
                              title: Text(title),
                            ),
                          );
                        },
                        itemCount: dataController.filteredPosts.length,
                      ))),
          ],
        ),
      ),
    ));
  }
}

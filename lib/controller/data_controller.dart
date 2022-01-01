import 'dart:convert';

import 'package:get/get.dart';
import 'package:search_helper_example/Service/network_service.dart';
import 'package:search_helper_example/model/post_model.dart';

class DataController extends GetxController {
  var posts = [].obs;
  var isPostsLoading = false.obs;
  var filteredPosts = [].obs;


  getPosts() async {

    try {
      isPostsLoading(true);
      var response = await NetworkHandler.getMethodCall(
          url: 'https://jsonplaceholder.typicode.com/posts');

      if (response!.statusCode == 200) {
        var result = json.decode(response.body);
        posts.clear();
        filteredPosts.clear();
        result.forEach((e){
          posts.add(PostModel.fromJson(e));
        });

        filteredPosts.value = posts;

      }
    } catch (e) {
      posts.value = [];
      filteredPosts.value = [];
    } finally{
      isPostsLoading(false);
    }
  }

  resetBack(){
    print("POst in reset is ${posts.length}");
    filteredPosts.value = posts;

  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPosts();
  }
}

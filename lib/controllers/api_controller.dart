// api_controller.dart
import 'package:api/services/api_servicse.dart';
import 'package:get/get.dart';

class ApiController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<dynamic> posts = <dynamic>[].obs; // Holds list of posts
  var errorMessage = ''.obs; // Corrected typo from "erroeMessage"

  final ApiServicse apiService = ApiServicse();

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  // Fetch posts
  Future<void> fetchPosts() async {
    try {
      isLoading.value = true;
      var fetchedPosts = await apiService.fetchApi();
      posts.addAll(fetchedPosts); // Add fetched data to posts
      errorMessage.value = ''; // Clear previous error message
    } catch (e) {
      errorMessage.value = e.toString(); // Display error message
    } finally {
      isLoading.value = false; // Stop loading
    }
  }
}

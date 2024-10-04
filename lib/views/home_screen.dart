// HomeScreen.dart
import 'package:api/controllers/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiController _controller = Get.put(ApiController()); // Better to use Get.put

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Data"),
      ),
      body: Obx(() {
        if (_controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (_controller.errorMessage.isNotEmpty) {
          return Center(child: Text(_controller.errorMessage.value));
        } else {
          return ListView.builder(
            itemCount: _controller.posts.length,
            itemBuilder: (context, index) {
              final post = _controller.posts[index]; // Accessing post
              return ListTile(
                title: Text(post['title']),  // Assuming 'title' is a field in the post
                subtitle: Text(post['body']),  // Assuming 'body' is another field
              );
            },
          );
        }
      }),
    );
  }
}

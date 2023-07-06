import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:library_app/app/data/models/books.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Library App'),
        ),
        body: FutureBuilder<List<Books>>(
            future: controller.getBooks(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final books = snapshot.data;
                return ListView.builder(
                  itemCount: books!.length,
                  itemBuilder: (context, index) {
                    final book = books[index];
                    return ListTile(
                      title: Text("${book.data![index].title}"),
                      // subtitle: Text(book.author),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(child: Text("Failed to fetch book data"));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}

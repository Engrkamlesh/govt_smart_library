import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:govt_smart_library/controller/book_controller.dart';

import '../model/book_model.dart';
import '../util/book_card.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final controller = Get.put(BookController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
        centerTitle: true,
      ),
      body:MasonryGridView.count(
        padding: EdgeInsets.symmetric(horizontal: 10),
                        itemCount: controller.bookList.length,
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 15.0,
                        itemBuilder: (BuildContext context, int index) {
                          BookModel item = controller.bookList[index];
                          return BookCard(
                            onClick: () {},
                            title: item.title,
                            image: item.image,
                            author: item.author,
                            pdfPath:item.pdfUrl,
                            favorite: true,
                          );
                        },
                      ),
    );
  }
}
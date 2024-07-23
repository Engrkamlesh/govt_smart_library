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
      body:Obx(()=>controller.favoriteBooks.isEmpty?Center(child: Text("Favorite list is Empty...",style: TextStyle(color: Colors.black),),): MasonryGridView.count(
        padding: EdgeInsets.symmetric(horizontal: 10),
        itemCount: controller.favoriteBooks.length,
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 15.0,
        itemBuilder: (BuildContext context, int index) {
          BookModel item = controller.favoriteBooks[index];
          return BookCard(
            trailing: Obx(()=> IconButton(
                          icon: Icon(
                            item.favorite.value
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color:Theme.of(context).primaryColor ,
                          ),
                          onPressed: () => controller.toggleFavorite(item),
                        )),
            title: item.title,
            image: item.image,
            author: item.author,
            pdfPath: item.pdfUrl,
          );
        },
      ),)
    );
  }
}

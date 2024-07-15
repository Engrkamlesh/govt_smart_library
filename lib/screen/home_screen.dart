import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:govt_smart_library/controller/book_controller.dart';
import 'package:govt_smart_library/model/book_model.dart';
import '../util/book_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(BookController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Hello Books! 👋',
          style: TextStyle(
              fontSize: 20.sp,
              fontFamily: 'RacingSansOne',
              fontWeight: FontWeight.w600,
              color: Colors.black),
        ),
      ),
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).scaffoldBackgroundColor,
          statusBarIconBrightness: Theme.of(context).brightness,
          systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Ready to dive into a world of stories? Browse through your collection and immerse yourself in the magic of books.",
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: Theme.of(context).hintColor,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Your Library',
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.indigo,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(height: 15),
                Expanded(
                  child: MasonryGridView.count(
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
                        pdfPath: item.pdfUrl,
                        favorite: item.favorite,
                      );
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }
}

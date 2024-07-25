import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:govt_smart_library/screen/book_detail.dart';


class BookCard extends StatelessWidget {
  final String title;
  final String pdfPath;
  final String image;
  final String author;
  final bool favorite;
  final Widget? trailing;

  const BookCard({
    super.key,
    required this.title,
    required this.pdfPath,
    required this.image,
    required this.author,
    this.favorite = false,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(BookDetailScreen(title: title,url: pdfPath,));
        // Get.to(BookDetailScreen(
        //   title: title,
        //   pdfPath: pdfPath,
        // ));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              spreadRadius: 0,
              blurRadius: 12,
              color: Theme.of(context).shadowColor.withOpacity(0.25),
              offset: const Offset(0, 4),
            ),
          ],
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              height: Get.height * 0.18,
              width: Get.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image), 
                  fit: BoxFit.fill,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    
                    decoration: const BoxDecoration(
                      color: Colors.white, 
                      shape: BoxShape.circle,
                    ),
                    child: trailing
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  Text(
                    author,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: 4.3,
                        minRating: 1,
                        itemCount: 5,
                        itemSize: 10.sp,
                        itemPadding: const EdgeInsets.symmetric(vertical: 5),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          debugPrint(rating.toString());
                        },
                      ),
                      Text(
                        "4.5",
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// import '../screen/book_detail_screen.dart';

// class BookCard extends StatelessWidget {
//   final String title;
//   final String description;
//   final String image;
//   final String author;
//   final bool favorite;
//   final VoidCallback? onClick;

//   const BookCard({
//     super.key,
//     required this.title,
//     required this.description,
//     required this.image,
//     required this.author,
//     this.favorite = false,
//     this.onClick,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         print('object');
//         Get.to(const BookDetailScreen(
//           title: 'fsdkjl',
//           description: 'fkdjadklfjaf',
//           image: 'images/books.png',
//           author: 'f;af',
//         ));
//       },
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 4),
//         padding: const EdgeInsets.only(bottom: 5),
//         decoration: BoxDecoration(
//             boxShadow: [
//               BoxShadow(
//                   spreadRadius: 0,
//                   blurRadius: 12,
//                   color: Theme.of(context).shadowColor.withOpacity(0.25),
//                   offset: const Offset(0, 4))
//             ],
//             color: Theme.of(context).cardColor,
//             borderRadius: BorderRadius.circular(12)),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//               margin: const EdgeInsets.only(bottom: 5),
//               height: Get.height * 0.18,
//               width: Get.width,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage(image), fit: BoxFit.fill),
//                   borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(12),
//                       topRight: Radius.circular(12))),
//               child: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Align(
//                     alignment: Alignment.topRight,
//                     child: GestureDetector(
//                       onTap: onClick,
//                       child: Container(
//                           padding: const EdgeInsets.all(5),
//                           decoration: const BoxDecoration(
//                               color: Colors.white, shape: BoxShape.circle),
//                           child: Icon(
//                             favorite
//                                 ? Icons.favorite
//                                 : Icons.favorite_border_outlined,
//                             color: Theme.of(context).primaryColor,
//                             size: 20.sp,
//                           )),
//                     )),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 10),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: TextStyle(
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w500,
//                         color: Theme.of(context).primaryColor),
//                   ),
//                   Text(
//                     author,
//                     style: TextStyle(
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w400,
//                         color: Theme.of(context).hintColor),
//                   ),
//                   Row(
//                     children: [
//                       RatingBar.builder(
//                         initialRating: 4.3,
//                         minRating: 1,
//                         itemCount: 5,
//                         itemSize: 10.sp,
//                         itemPadding: const EdgeInsets.symmetric(vertical: 5),
//                         itemBuilder: (context, _) => const Icon(
//                           Icons.star,
//                           color: Colors.amber,
//                         ),
//                         onRatingUpdate: (rating) {
//                           debugPrint(rating.toString());
//                         },
//                       ),
//                       Text(
//                         "4.5",
//                         style: TextStyle(
//                             fontSize: 10.sp,
//                             fontWeight: FontWeight.w500,
//                             color: Colors.grey),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

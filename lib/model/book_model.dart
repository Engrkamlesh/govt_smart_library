import 'package:get/get.dart';

class BookModel {
  final String title;
  final String image;
  final String author;
  final String pdfUrl;
  final String category; 
  RxBool favorite;

  BookModel({
    required this.title,
    required this.image,
    required this.author,
    required this.pdfUrl,
    required this.category, 
    bool favorite = false,
  }) : favorite = RxBool(favorite);

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      title: json['title'],
      image: json['image'],
      author: json['author'],
      pdfUrl: json['pdfUrl'],
      category: json['category'], 
      favorite: json['favorite'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'image': image,
      'author': author,
      'pdfUrl': pdfUrl,
      'category': category, // Added to toJson
      'favorite': favorite.value,
    };
  }
}

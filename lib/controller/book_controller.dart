import 'package:get/get.dart';
import 'package:govt_smart_library/model/book_model.dart';

import 'local_database.dart';

class BookController extends GetxController {
  var bookList = <BookModel>[
    BookModel(
      category: "English",
      title: 'English Book 1',
      image: 'assets/images/eng1.PNG',
      author: 'Sindh TextBook Board',
      pdfUrl:
          'https://drive.google.com/file/d/1T4oTHTGOUHiU7PZIbArL2JK7P9rYobR1/view',
    ),
    BookModel(
      category: "English",
      title: 'English Book 2',
      image: 'assets/images/eng2.PNG',
      author: 'Sindh TextBook Board',
      pdfUrl:
          'https://drive.google.com/file/d/1TV-c9Xdc2oFNPGEYj6_tNr1-pGB22koD/view?pli=1',
    ),
    BookModel(
      category: "English",
      title: 'English Book 3',
      image: 'assets/images/eng3.PNG',
      author: 'Sindh TextBook Board',
      pdfUrl:
          'https://drive.google.com/file/d/1_rMW48E62qbAvwlEAbEh11VnRCqf7GWy/view',
    ),
    BookModel(
      category: "English",
      title: 'English Book 4',
      image: 'assets/images/eng4.PNG',
      author: 'Sindh TextBook Board',
      pdfUrl:
          'https://drive.google.com/file/d/1Hbk2GXhYiiBvS6VGjmQx4H1NHkLkYIAY/view',
    ),
    BookModel(
      category: "English",
      title: 'English Book 5',
      image: 'assets/images/eng5.PNG',
      author: 'Sindh TextBook Board',
      pdfUrl:
          'https://drive.google.com/file/d/1GyCYo16xClQwm7rMFlgAO59M-Mdv20DU/view',
    ),
    BookModel(
      category: "English",
      title: 'English Book 6',
      image: 'assets/images/eng6.PNG',
      author: 'Sindh TextBook Board',
      pdfUrl:
          'https://drive.google.com/file/d/1MOpRLhKodK5lDU5IvMakCX2ZsWAwtMSY/view',
    ),
    BookModel(
      category: "Math",
      title: 'Mathamatcis Book 1',
      image: 'assets/images/math1.PNG',
      author: 'Sindh TextBook Board',
      pdfUrl:
          'https://drive.google.com/file/d/1C7qidqyiyEpi_scHHMo7JFREW1D9gT0d/view',
    ),
    BookModel(
      category: "Math",
      title: 'Mathamatcis Book 2',
      image: 'assets/images/math2.PNG',
      author: 'Sindh TextBook Board',
      pdfUrl:
          'https://drive.google.com/file/d/1sO-6Owmmb1xx5XVmwgXputEL6a43YPMd/view',
    ),
    BookModel(
      category: "Math",
      title: 'Mathamatcis Book 3',
      image: 'assets/images/math3.PNG',
      author: 'Sindh TextBook Board',
      pdfUrl:
          'https://drive.google.com/file/d/1ddehU6V0fBkRslO7-g_8Txa3wMmmG8CA/view',
    ),
    BookModel(
      category: "Math",
      title: 'Mathamatcis Book 4',
      image: 'assets/images/math4.PNG',
      author: 'Sindh TextBook Board',
      pdfUrl:
          'https://drive.google.com/file/d/1vgd-VA3g6STtpVxq8tTBcSwnL3RzY2YR/view',
    ),
    BookModel(
      category: "Math",
      title: 'Mathamatcis Book 5',
      image: 'assets/images/math5.PNG',
      author: 'Sindh TextBook Board',
      pdfUrl:
          'https://drive.google.com/file/d/1-tf4bxpJhhQxx4IyC4HJMCVPxgBFLb44/view',
    ),
    BookModel(
      category: "Math",
      title: 'Mathamatcis Book 6',
      image: 'assets/images/math6.PNG',
      author: 'Sindh TextBook Board',
      pdfUrl:
          'https://drive.google.com/file/d/1JO0uqiTvqMNt8IRNNiWZhGfcrJLFK-dc/view',
    ),
    BookModel(
      category: "Sindhi",
      title: 'Sindhi Book 1',
      image: 'assets/images/sindh1.PNG',
      author: 'Sindh TextBook Board',
      pdfUrl:
          'https://drive.google.com/file/d/1EpSVC0fjPhpyfQB9W2LForQtxaqZwFA-/view',
    ),
    BookModel(
      category: "Sindhi",
      title: 'Sindhi Book 2',
      image: 'assets/images/sindh2.PNG',
      author: 'Sindh TextBook Board',
      pdfUrl:
          'https://drive.google.com/file/d/147Mh3vw5ahtLS_O3wj_hxTHR-bZItKvh/view',
    ),
    BookModel(
      category: "Sindhi",
      title: 'Sindhi Book 3',
      image: 'assets/images/sindh3.PNG',
      author: 'Sindh TextBook Board',
      pdfUrl:
          'https://drive.google.com/file/d/1KrXrimeYDgtCL7lX7FrWgnXBNd_GY85n/view',
    ),
    BookModel(
      category: "Sindhi",
      title: 'Sindhi Book 4',
      image: 'assets/images/sindh4.PNG',
      author: 'Sindh TextBook Board',
      pdfUrl:
          'https://drive.google.com/file/d/1slUUvPaTgUe8sD-RqDx3e2ITIHKo3Gij/view',
    ),
    BookModel(
      category: "Sindhi",
      title: 'Sindhi Book 5',
      image: 'assets/images/sindh5.PNG',
      author: 'Sindh TextBook Board',
      pdfUrl:
          'https://drive.google.com/file/d/1HwfMYXwjBYUwlgTXIxyhoJQXGyL52Mgg/view',
    ),
    BookModel(
      category: "Sindhi",
      title: 'Sindhi Book 6',
      image: 'assets/images/sindh6.PNG',
      author: 'Sindh TextBook Board',
      pdfUrl:
          'https://drive.google.com/file/d/1T-DtQpL3IGW3_e3wT0wvRm6ooMNEIiKs/view',
    ),
    BookModel(
      category: "General",
      title: 'General Knowledge 1',
      image: 'assets/images/general1.PNG',
      author: 'Sindh TextBook Board',
      pdfUrl:
          'https://drive.google.com/file/d/10uL9aVhIEcJFAW7J3OQFdLe_NGywvo_m/view',
    ),
    BookModel(
      category: "General",
      title: 'General Knowledge 2',
      image: 'assets/images/general2.PNG',
      author: 'Sindh TextBook Board',
      pdfUrl:
          'https://drive.google.com/file/d/1QCZOls-Jy92RvL75UtY7SHpcaw-AMC9z/view',
    ),
    BookModel(
      category: "General",
      title: 'General Knowledge 3',
      image: 'assets/images/general3.PNG',
      author: 'Sindh TextBook Board',
      pdfUrl:
          'https://drive.google.com/file/d/1Rz0u-F0Jz5leJ5ppRcBemZeFRsrdTHwD/view',
    ),
    BookModel(
      category: "General",
      title: 'General Knowledge 4',
      image: 'assets/images/general4.PNG',
      author: 'Sindh TextBook Board',
      pdfUrl:
          'https://drive.google.com/file/d/1uClIwjLPIEM2sTB9VDWhMIZ5zl1D71X8/view',
    ),
  ].obs;

  var categories = ["English", "Math", "Sindhi", "General"].obs;
  var selectedCategory = "English".obs;

  List<BookModel> get filteredBooks => bookList
      .where((book) => book.category == selectedCategory.value)
      .toList();

  void changeCategory(String category) {
    selectedCategory.value = category;
  }

  var favoriteBooks = <BookModel>[].obs;
  final SharedPreferencesHelper _prefsHelper = SharedPreferencesHelper();

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  void loadFavorites() async {
    favoriteBooks.value = await _prefsHelper.getFavoriteBooks();
  }

  void toggleFavorite(BookModel book) {
    book.favorite.value = !book.favorite.value;
    if (book.favorite.value) {
      favoriteBooks.add(book);
    } else {
      favoriteBooks.removeWhere((favBook) => favBook.title == book.title);
      // favoriteBooks.remove(book);
    }
    _prefsHelper.saveFavoriteBooks(favoriteBooks);
  }

  void clearFavorites() {
    for (var book in favoriteBooks) {
      book.favorite.value = false;
    }
    favoriteBooks.clear();
    _prefsHelper.clearFavoriteBooks();
  }
}

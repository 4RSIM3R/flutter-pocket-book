import 'package:pocket_books/model/book_model.dart';

class BookProps {
  final String title;
  final String description;
  final List<BookModel> books;

  BookProps({
    required this.title,
    required this.description,
    required this.books,
  });
}

import 'package:bloc/bloc.dart';
import 'package:book_app/bloc/book/book_event.dart';
import 'package:book_app/bloc/book/book_state.dart';
import 'package:book_app/model/book_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc() : super(BookInitial()) {
    on<FetchBookDetails>(_handleFetchBooks);
  }

  void _handleFetchBooks(
      FetchBookDetails event, Emitter<BookState> emit) async {
    emit(BookDetailsLoading());
    try {
      final List<Book> books = await _fetchBooks();
      emit(BookDetailsLoaded(books));
    } catch (e) {
      emit(BookDetailsErrorMessage("Failed to fetch books"));
    }
  }

  Future<List<Book>> _fetchBooks() async {
    final response = await http
        .get(Uri.parse('https://www.abibliadigital.com.br/api/books'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Book> books = [];
      for (var item in data) {
        books.add(Book.fromJson(item));
      }
      return books;
    } else {
      throw Exception('Failed to load books');
    }
  }
}

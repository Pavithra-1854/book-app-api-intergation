import 'package:book_app/bloc/book/book_bloc.dart';
import 'package:book_app/bloc/book/book_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookListScreen extends StatelessWidget {
  const BookListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 4,
        title: const Text('Book List'),
      ),
      body: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          if (state is BookDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is BookDetailsLoaded) {
            return ListView.builder(
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                final book = state.books[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      title: Text("Name: ${book.name}"),
                      subtitle: Text("Author: ${book.author}"),
                    ),
                  ),
                );
              },
            );
          } else if (state is BookDetailsErrorMessage) {
            return Center(
              child: Text(state.errormessage),
            );
          }
          return Container();
        },
      ),
    );
  }
}

import 'package:book_app/bloc/book/book_bloc.dart';
import 'package:book_app/bloc/book/book_event.dart';
import 'package:book_app/book_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Data',
      home: BlocProvider(
        create: (context) => BookBloc()..add(FetchBookDetails()),
        child: const BookListScreen(),
      ),
    );
  }
}

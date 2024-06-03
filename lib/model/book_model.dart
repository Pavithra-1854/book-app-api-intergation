class Book {
  final String name;
  final String author;

  Book({required this.name, required this.author});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      name: json['name'],
      author: json['author'],
    );
  }
}

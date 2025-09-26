class BookModel {
  final int number;
  final String title;
  final String originalTitle;
  final String releaseDate;
  final String description;
  final int pages;
  final String cover;
  final int index;

  BookModel({
    required this.number,
    required this.title,
    required this.originalTitle,
    required this.releaseDate,
    required this.description,
    required this.pages,
    required this.cover,
    required this.index,
  });

  factory BookModel.fromJson(Map<dynamic, dynamic> json) {
    return BookModel(
      number: json['number'],
      title: json['title'],
      originalTitle: json['originalTitle'],
      releaseDate: json['releaseDate'],
      description: json['description'],
      pages: json['pages'],
      cover: json['cover'],
      index: json['index'],
    );
  }
}
/** {
    "number": 1,
    "title": "Harry Potter and the Sorcerer's Stone",
    "originalTitle": "Harry Potter and the Sorcerer's Stone",
    "releaseDate": "Jun 26, 1997",
    "description": "On his birthday, Harry Potter discovers that he is the son of two well-known wizards, from whom he has inherited magical powers. He must attend a famous school of magic and sorcery, where he establishes a friendship with two young men who will become his companions on his adventure. During his first year at Hogwarts, he discovers that a malevolent and powerful wizard named Voldemort is in search of a philosopher's stone that prolongs the life of its owner.",
    "pages": 223,
    "cover": "https://raw.githubusercontent.com/fedeperin/potterapi/main/public/images/covers/1.png",
    "index": 0
  } */
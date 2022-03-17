
class Book {
  Book({
    required this.bookpic,
    required this.bookname,
    required this.bookdetail,
  });

  String? bookpic;
  String? bookname;
  String? bookdetail;

   Book.fromJson(Map<String, dynamic>json) {
      bookpic= json["bookpic"];
      bookname= json["bookname"];
      bookdetail= json["bookdetail"];
  }
}
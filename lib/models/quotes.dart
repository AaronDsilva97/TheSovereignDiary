class Quotes {
  String author;
  String text;

  Quotes({
    this.author,
    this.text,
  });

  factory Quotes.fromJson(Map<String, dynamic> json) => Quotes(
        text: json['text'],
        author: json['author'],
      );
}

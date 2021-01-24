class WallPaper {
  String imageUrl;
  String links;
  String name;

  WallPaper({
    this.imageUrl,
    this.links,
    this.name,
  });

  factory WallPaper.fromJson(Map<String, dynamic> json) => WallPaper(
        imageUrl: json['urls']['regular'],
      );
}

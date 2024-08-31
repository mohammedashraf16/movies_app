class MovieModel {
  String id;

  String image;
  String title;
  String date;
  String description;

  MovieModel({
    this.id = "",
    required this.image,
    required this.title,
    required this.date,
    required this.description,
  });

  MovieModel.fromJson(Map<String, dynamic>json) :
        this(
        id: json["id"],
        image: json["image"],
        title: json["title"],
        date: json["date"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() {
    return{
      "id": id,
      "image": image,
      "title": title,
      "date": date,
      "description": description,
    };
  }
}

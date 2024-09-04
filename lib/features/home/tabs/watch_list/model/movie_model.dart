
class MovieModel {
  String id;

  String image;
  String title;
  String date;
  String description;
  String averageRate;
  bool isSelected;

  MovieModel({
    this.id = "",
    required this.image,
    required this.title,
    required this.date,
    required this.description,
    required this.averageRate,
     this.isSelected = false,
  });

  MovieModel.fromJson(Map<String, dynamic>json) :
        this(
        id: json["id"],
        image: json["image"],
        title: json["title"],
        date: json["date"],
        description: json["description"],
        averageRate: json["averageRate"],
        isSelected: json["isSelected"],
      );

  Map<String, dynamic> toJson() {
    return{
      "id": id,
      "image": image,
      "title": title,
      "date": date,
      "description": description,
      "averageRate": averageRate,
      "isSelected": isSelected,
    };
  }
}


class NoteModel {
  NoteModel({
    this.id,
    required this.title,
    required this.date,
    required this.time,
    required this.image,
    required this.description,
  });
  String? id;
  String title;
  String date;
  String time;
  String image;
  String description;

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
    title: json["title"],
    date: json["date"],
    time: json["time"],
    image: json["image"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "date": date,
    "time": time,
    "image": image,
    "description": description,
  };
}


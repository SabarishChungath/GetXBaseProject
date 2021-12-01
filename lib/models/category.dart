List<Category> categoriesFromJson(json) {
  return List.from(json["categories"].map((cat) => Category.fromJson(cat)));
}

class Category {
  final String? id, name, description, image;
  Category({
    this.id,
    this.name,
    this.description,
    this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["idCategory"],
        name: json["strCategory"],
        image: json["strCategoryThumb"],
        description: json["strCategoryDescription"],
      );
}

class Menus {
  final List<Category> foods;
  final List<Category> drinks;

  Menus({required this.foods, required this.drinks});

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
    foods: List<Category>.from(json["foods"].map((x) => Category.fromJson(x))),
    drinks: List<Category>.from(
      json["drinks"].map((x) => Category.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
    "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
  };
}

class Category {
  final String name;

  Category({required this.name});

  factory Category.fromJson(Map<String, dynamic> json) =>
      Category(name: json["name"]);

  Map<String, dynamic> toJson() => {"name": name};
}

class Favorite {
  final String id;
  final String name;
  final String city;
  final double rating;
  final String pictureId;

  Favorite({
    required this.id,
    required this.name,
    required this.city,
    required this.rating,
    required this.pictureId,
  });

  // Convert object ke Map untuk db
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'city': city,
      'rating': rating,
      'pictureId': pictureId,
    };
  }

  // Convert Map dari db ke object
  factory Favorite.fromMap(Map<String, dynamic> map) {
    return Favorite(
      id: map['id'] as String,
      name: map['name'] as String,
      city: map['city'] as String,
      rating: map['rating'] as double,
      pictureId: map['pictureId'] as String,
    );
  }
}

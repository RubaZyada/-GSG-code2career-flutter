
class ProductModel {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  double rating;
  int ratingCount;
  

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
    required this.ratingCount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price:json['price'] *1.0,
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: json['rating']['rate'],
      ratingCount: json['rating']['count'],
    );
  }
}
// class RatingModel {
//   double rate;
//   int count;

//   RatingModel({required this.rate, required this.count});

//   factory RatingModel.fromJson(Map<String, dynamic> json) {
//     return RatingModel(
//       rate: (json['rate'] as num).toDouble(),
//       count: json['count'],
//     );
//   }
// }

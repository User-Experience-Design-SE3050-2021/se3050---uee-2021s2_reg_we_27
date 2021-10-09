

class Product {
  final String name;
  final String? image;
  final double? rating;
  final double? price;
  final String description;
  final bool wishList;

  Product({required this.name, this.image, this.rating, this.price, required this.description,
      required this.wishList});
}

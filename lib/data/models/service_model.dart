class ServiceModel {
  final String id;
  final String image; // local asset path
  final bool sponsored;
  final String title;
  final String subtitle;
  final String tag; // e.g., "Plants Shop"
  final double rating;
  final int reviews;
  final int level;
  final double price;
  final String description;
  final bool showPriceLabel;

  ServiceModel({
    required this.id,
    required this.image,
    this.sponsored = false,
    required this.title,
    required this.subtitle,
    required this.tag,
    required this.rating,
    required this.reviews,
    required this.level,
    required this.price,
    required this.description,
    this.showPriceLabel = true,
  });
}

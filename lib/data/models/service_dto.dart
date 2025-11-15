class PopularServices {
  final int id;
  final String title;
  final String slug;
  final String description;
  final String image;
  final bool isPromoted;
  final Price basicPrice;
  final int basicDeliveryDays;
  final Statistics statistics;
  final Freelancer freelancer;
  final Category category;

  PopularServices({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.image,
    required this.isPromoted,
    required this.basicPrice,
    required this.basicDeliveryDays,
    required this.statistics,
    required this.freelancer,
    required this.category,
  });

  factory PopularServices.fromJson(Map<String, dynamic> json) {
    return PopularServices(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      description: json['description'],
      image: json['image'],
      isPromoted: json['is_promoted'],
      basicPrice: Price.fromJson(json['basic_price']),
      basicDeliveryDays: json['basic_delivery_days'],
      statistics: Statistics.fromJson(json['statistics']),
      freelancer: Freelancer.fromJson(json['freelancer']),
      category: Category.fromJson(json['category']),
    );
  }
}

class Price {
  final double regular;
  final double? discount;
  final double finalPrice;

  Price({required this.regular, this.discount, required this.finalPrice});

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      regular: json['regular'].toDouble(),
      discount: json['discount']?.toDouble(),
      finalPrice: json['final'].toDouble(),
    );
  }
}

class Statistics {
  final int totalOrders;
  final int totalReviews;
  final double? averageRating;

  Statistics({
    required this.totalOrders,
    required this.totalReviews,
    this.averageRating,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) {
    return Statistics(
      totalOrders: json['total_orders'],
      totalReviews: json['total_reviews'],
      averageRating: json['average_rating']?.toDouble(),
    );
  }
}

class Freelancer {
  final int id;
  final String name;
  final String username;
  final String image;
  final String experienceLevel;
  final String country;
  final String freelancerLevel;
  final String levelImage;

  Freelancer({
    required this.id,
    required this.name,
    required this.username,
    required this.image,
    required this.experienceLevel,
    required this.country,
    required this.freelancerLevel,
    required this.levelImage,
  });

  factory Freelancer.fromJson(Map<String, dynamic> json) {
    return Freelancer(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      image: json['image'],
      experienceLevel: json['experience_level'],
      country: json['country'] ?? '',
      freelancerLevel: json['freelancer_level'],
      levelImage: json['level_image'],
    );
  }
}

class Category {
  final int id;
  final String name;
  final String slug;

  Category({required this.id, required this.name, required this.slug});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(id: json['id'], name: json['name'], slug: json['slug']);
  }
}

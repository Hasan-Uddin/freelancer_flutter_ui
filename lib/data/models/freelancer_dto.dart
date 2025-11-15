class FreelancerData {
  final int? id;
  final String? name;
  final String? title;
  final String? imageUrl;
  final Location? location;
  final Statistics? statistics;
  final int? hourly_rate;

  FreelancerData({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.hourly_rate,
    this.title,
    required this.location,
    required this.statistics,
  });

  factory FreelancerData.fromJson(Map<String, dynamic> json) {
    return FreelancerData(
      id: json['id'],
      name: json['name'],
      title: json['title'],
      location: Location.fromJson(json['location']),
      statistics: Statistics.fromJson(json['statistics']),
      imageUrl: json['image'],
      hourly_rate: json['hourly_rate'],
    );
  }
}

class Location {
  final String? country;
  final String? state;

  Location({this.country, this.state});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(country: json['country'], state: json['state']);
  }
}

class Statistics {
  final int totalReviews;
  final double? averageRating;

  Statistics({required this.totalReviews, this.averageRating});

  factory Statistics.fromJson(Map<String, dynamic> json) {
    return Statistics(
      totalReviews: json['total_reviews'],
      averageRating: json['average_rating'] != null
          ? (json['average_rating'] as num).toDouble()
          : null,
    );
  }
}

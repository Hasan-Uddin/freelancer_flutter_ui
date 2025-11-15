class FreelancerModel {
  final String id;
  final String name;
  final String title;
  final String avatar;
  final double rating;
  final int reviews;
  final double hourlyRate;
  final String location;
  final List<String> skills;
  final String levelTag;

  FreelancerModel({
    required this.id,
    required this.name,
    required this.title,
    required this.avatar,
    required this.rating,
    required this.reviews,
    required this.hourlyRate,
    required this.location,
    required this.skills,
    required this.levelTag,
  });
}

class TrainerRatingModel {
  final String name;
  final String image;
  final double rating;
  final int reliabilityScore;
  final int completedSessions;
  final int totalRatings;
  final String status;

  final double attendanceRate;
  final double punctualityRate;

  TrainerRatingModel({
    required this.name,
    required this.image,
    required this.rating,
    required this.reliabilityScore,
    required this.completedSessions,
    required this.totalRatings,
    required this.status,
    required this.attendanceRate,
    required this.punctualityRate,
  });
}

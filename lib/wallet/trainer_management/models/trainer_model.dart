class TrainerModel {
  final String name;

  final String image;

  final String verificationStatus;

  final double reliabilityScore;

  final double rating;

  final int completedSessions;

  final String availability;

  final bool isAvailable;

  TrainerModel({
    required this.name,

    required this.image,

    required this.verificationStatus,

    required this.reliabilityScore,

    required this.rating,

    required this.completedSessions,

    required this.availability,

    required this.isAvailable,
  });
}

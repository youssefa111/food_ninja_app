class Restaurant {
  final int restaurantID;
  final String restaurantImagePath;
  final String restaurantName;
  final String restaurantBrief;
  final double restaurantRating;
  final String restaurantLocation;
  final double distanceFromUserLocation;
  final double rate;
  final bool isPopular;
  final bool isLiked;
  Restaurant({
    required this.restaurantID,
    required this.restaurantImagePath,
    required this.restaurantName,
    required this.restaurantBrief,
    required this.restaurantRating,
    required this.restaurantLocation,
    required this.distanceFromUserLocation,
    this.isPopular = false,
    this.isLiked = false,
    this.rate = 0,
  });
}

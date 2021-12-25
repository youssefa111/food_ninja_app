import 'dart:convert';

class RestaurantModel {
  final int restaurantID;
  final String restaurantImagePath;
  final String restaurantName;
  final String restaurantBrief;
  var restaurantLocation;
  double distanceFromUserLocation;
  final double rate;
  final bool isPopular;
  final bool isLiked;
  RestaurantModel({
    required this.restaurantID,
    required this.restaurantImagePath,
    required this.restaurantName,
    required this.restaurantBrief,
    required this.restaurantLocation,
    this.distanceFromUserLocation = 0,
    this.isPopular = false,
    this.isLiked = false,
    this.rate = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'restaurantID': restaurantID,
      'restaurantImagePath': restaurantImagePath,
      'restaurantName': restaurantName,
      'restaurantBrief': restaurantBrief,
      'restaurantLocation': restaurantLocation,
      'distanceFromUserLocation': distanceFromUserLocation,
      'rate': rate,
      'isPopular': isPopular,
      'isLiked': isLiked,
    };
  }

  factory RestaurantModel.fromMap(Map<String, dynamic> map) {
    return RestaurantModel(
      restaurantID: map['restaurantID']?.toInt() ?? 0,
      restaurantImagePath: map['restaurantImagePath'] ?? '',
      restaurantName: map['restaurantName'] ?? '',
      restaurantBrief: map['restaurantBrief'] ?? '',
      restaurantLocation: map['restaurantLocation'],
      distanceFromUserLocation:
          map['distanceFromUserLocation']?.toDouble() ?? 0.0,
      rate: map['rate']?.toDouble() ?? 0.0,
      isPopular: map['isPopular'] ?? false,
      isLiked: map['isLiked'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory RestaurantModel.fromJson(String source) =>
      RestaurantModel.fromMap(json.decode(source));
}

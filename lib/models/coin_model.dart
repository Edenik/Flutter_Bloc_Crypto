import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Coin extends Equatable {
  final String name;
  final String fullName;
  final double price;
  final String imageUrl;

  const Coin({
    @required this.name,
    @required this.fullName,
    @required this.price,
    @required this.imageUrl,
  });

  //Todo: add ImageUrl

  @override
  List<Object> get props => [
        name,
        fullName,
        price,
        imageUrl,
      ];

  @override
  String toString() =>
      'Coin { name: $name, fullname: $fullName, price: $price, imageUrl: $imageUrl}';

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      name: json['CoinInfo']['Name'] as String,
      fullName: json['CoinInfo']['FullName'] as String,
      price: (json['RAW']['USD']['PRICE'] as num).toDouble(),
      imageUrl: json['CoinInfo']['ImageUrl'] as String,
    );
  }
}

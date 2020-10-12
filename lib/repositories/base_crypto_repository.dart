import 'package:flutter_bloc_crypto/models/coin_model.dart';

abstract class BaseCryptoRepository {
  Future<List<Coin>> getTopCoint({int page});
  void dispose();
}

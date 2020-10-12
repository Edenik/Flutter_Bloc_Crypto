import 'package:flutter/material.dart';
import 'package:flutter_bloc_crypto/models/coin_model.dart';
import 'package:flutter_bloc_crypto/repositories/crypto_repository.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _cryptoRepository = CryptoRepository();
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Coins'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.clamp,
            colors: [
              Theme.of(context).primaryColor,
              Colors.grey[900],
            ],
          ),
        ),
        child: FutureBuilder(
          future: _cryptoRepository.getTopCoint(page: _page),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation(Theme.of(context).accentColor),
                ),
              );
            }
            final List<Coin> coins = snapshot.data;
            return RefreshIndicator(
              color: Theme.of(context).accentColor,
              onRefresh: () async {
                setState(() {
                  _page = 0;
                });
              },
              child: ListView.builder(
                itemCount: coins.length,
                itemBuilder: (BuildContext context, int index) {
                  final coin = coins[index];
                  return ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '#${++index}',
                              style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CircleAvatar(
                              radius: 20.0,
                              backgroundImage: NetworkImage(
                                  'https://www.cryptocompare.com${coin.imageUrl}'),
                              backgroundColor: Colors.transparent,
                            ),
                          ],
                        )
                      ],
                    ),
                    title: Text(
                      coin.fullName,
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      coin.name,
                      style: TextStyle(color: Colors.white70),
                    ),
                    trailing: Text(
                      '\$${coin.price.toStringAsFixed(4)}',
                      style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.w600),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

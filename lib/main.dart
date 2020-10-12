import 'package:flutter/material.dart';
import 'package:flutter_bloc_crypto/repositories/crypto_repository.dart';
import 'package:flutter_bloc_crypto/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './blocs/crypto/crypto_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CryptoBloc>(
      create: (_) => CryptoBloc(
        cryptoRepository: CryptoRepository(),
      )..add(AppStarted()),
      child: MaterialApp(
        title: 'Flutter Crypto App',
        theme: ThemeData(
          primaryColor: Colors.black,
          accentColor: Colors.tealAccent,
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}

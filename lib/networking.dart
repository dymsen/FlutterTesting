import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

Future<http.Response> fetchBitcoinPrice() async{
  final response = await http.get(Uri.https("blockchain.info", 'ticker'));
  return response;
}

Widget buildBitcoinPrice() => FutureBuilder <http.Response>(
            future: fetchBitcoinPrice(),
            builder: (context, snapshot) {
              if (snapshot.hasData){
                int statusCode = snapshot.data.statusCode;
                if(statusCode == 200){
                  return Text("${BitcoinPrice.fromJson(jsonDecode(snapshot.data.body)).eur}");
                }
                return Text('$statusCode');
              } 
              else if (snapshot.error){
                return Text('${snapshot.error}');
              }
              return CircularProgressIndicator();            
            },
          );


class BitcoinPrice {
  final double eur;

  BitcoinPrice({this.eur});

  factory BitcoinPrice.fromJson(Map<String, dynamic> json){
    return BitcoinPrice(
      eur: json['EUR']['15m']
    );
  }
}
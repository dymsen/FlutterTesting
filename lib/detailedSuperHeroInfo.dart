
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_hero/super_hero.dart';

Widget superHeroDetails(String _superHeroName){
return Scaffold(
                appBar: AppBar(
                  title: Text(_superHeroName),
                ),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(_superHeroName),
                  Row(
                    children: [
                      Image.network('https://picsum.photos/300'),
                      Image.network('https://picsum.photos/300'),
                      Image.network('https://picsum.photos/300')
                    ]
                  ),
                  Row(
                    children: [
                      Image.network('https://picsum.photos/300'),
                      Image.network('https://picsum.photos/300'),
                      Image.network('https://picsum.photos/300')
                    ]
                  )
                  ]
                ),
                );
}
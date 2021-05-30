import 'dart:html';

import 'package:flutter/material.dart';
import 'package:new_project/detailedSuperHeroInfo.dart';
import 'package:new_project/layouts.dart';
import 'package:super_hero/super_hero.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MySuperheroPicker', home: SuperHeroNameGenerator());
  }
}

class SuperHeroNameGenerator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SuperHeroName();
}

class _SuperHeroName extends State<SuperHeroNameGenerator> {
  final _superHeroNames = <String>[];
  final _hearted = <String>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to me SuperHero Picker'),
      ),
      body: mainWidget(),//_buildBody(),
    );
  }

  Widget _buildBody() {
    return ListView.builder(
        padding: EdgeInsets.all(16),
        itemBuilder: (context, i) {
          if (i.isOdd) {
            return Divider();
          }
          if (i ~/ 2 >= _superHeroNames.length) {
            _superHeroNames.addAll(_generateSuperHerosNames());
          }
          return _buildRow(_superHeroNames[i ~/ 2]);
        });
  }

  Iterable<String> _generateSuperHerosNames() {
    List<String> myNames = [
      SuperHero.random(),
      SuperHero.random(),
      SuperHero.random(),
      SuperHero.random(),
      SuperHero.random(),
      SuperHero.random(),
      SuperHero.random(),
      SuperHero.random(),
      SuperHero.random(),
      SuperHero.random(),
    ];
    return myNames;
  }

  Widget _buildRow(String superHeroName) {
    final _markedFav = _hearted.contains(superHeroName);
    return ListTile(
      title: Text(superHeroName),
      trailing: Icon(
        _markedFav ? Icons.favorite :Icons.favorite_border ,
        color: _markedFav ? Colors.red :null,
      ),
      onTap: (){
        setState(() {
          _markedFav ? _hearted.remove(superHeroName) : _hearted.add(superHeroName);
        });
      },
      onLongPress: (){
        _pushExample(superHeroName);
        },
          );
        }
      
        void _pushExample(String superHeroName) {
          Navigator.of(context).push(
            MaterialPageRoute<void>(builder: (BuildContext context){
              return superHeroDetails(superHeroName);
            })
          );
  }
}

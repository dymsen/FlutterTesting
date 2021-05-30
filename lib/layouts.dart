import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/networking.dart';
import 'package:http/http.dart' as http;

Widget mainWidget() {
  return materialCard();
}

Widget materialCard() {
  return SizedBox(
    height: 240,
    child: Card(
      child: Column(
        children: [
         ListTile(
          title: Text('Ich bin ein Panda :)',
          style: TextStyle(fontWeight: FontWeight.w700)),
          subtitle: Text('Und ich mag Bambus'),
          leading: Icon(
            Icons.star_rate,
            color: Colors.blue[500],
          ),      
         ),
         Divider(),
         ListTile(
          title: Text('Bitcoin Preis in € :',
          style: TextStyle(fontWeight: FontWeight.w700)),
          subtitle: buildBitcoinPrice(),
          leading: Icon(
            Icons.star_rate,
            color: Colors.blue[500],
          ),      
         ),
        ],
        ),
      )
  );
}

Widget gridView() {
  return GridView.extent(
    maxCrossAxisExtent: 150,
    padding: const EdgeInsets.all(4),
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    children: _buildGridList(25),
  );
}

List<Widget> _buildGridList(int i) => List.generate(
    i,
    (index) => Stack (
      alignment: const Alignment(0, 0.4),
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage('https://picsum.photos/300/'),
          radius: 300,
        ),
        Container ( 
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.black38
          ),
          child: Text(
          'Schönes Bild',
          style: TextStyle(
            fontSize: 22,
            color: Colors.white70
              ),
            )
          )
      ]
    )
);

Widget container() {
  return Expanded(
      child: Container(
    decoration: BoxDecoration(
      color: const Color(0x85A02525),
      border: Border.all(
        color: Colors.black,
        width: 5,
      ),
      borderRadius: BorderRadius.circular(4),
    ),
    child: Image.network('https://picsum.photos/300'),
    margin: const EdgeInsets.all(4),
  ));
}

Widget container1() => Expanded(child: Container());

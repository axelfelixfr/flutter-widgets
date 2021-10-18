import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Cards Page')),
        body: ListView(padding: EdgeInsets.all(10.0), children: <Widget>[
          _cardTypeOne(),
          SizedBox(height: 30.0),
          _cardTypeTwo(),
          SizedBox(height: 30.0),
          _cardTypeOne(),
          SizedBox(height: 30.0),
          _cardTypeTwo(),
          SizedBox(height: 30.0),
          _cardTypeOne(),
          SizedBox(height: 30.0),
          _cardTypeTwo(),
          SizedBox(height: 30.0),
          _cardTypeOne(),
          SizedBox(height: 30.0),
          _cardTypeTwo(),
          SizedBox(height: 30.0),
          _cardTypeOne(),
          SizedBox(height: 30.0),
          _cardTypeTwo(),
          SizedBox(height: 30.0),
          _cardTypeOne(),
          SizedBox(height: 30.0),
          _cardTypeTwo(),
          SizedBox(height: 30.0),
          _cardTypeOne(),
          SizedBox(height: 30.0),
          _cardTypeTwo(),
          SizedBox(height: 30.0),
          _cardTypeOne(),
          SizedBox(height: 30.0),
          _cardTypeTwo(),
          SizedBox(height: 30.0),
          _cardTypeOne(),
          SizedBox(height: 30.0),
          _cardTypeTwo(),
          SizedBox(height: 30.0),
          _cardTypeOne(),
          SizedBox(height: 30.0),
          _cardTypeTwo(),
          SizedBox(height: 30.0),
          _cardTypeOne(),
          SizedBox(height: 30.0),
          _cardTypeTwo(),
          SizedBox(height: 30.0),
          _cardTypeOne(),
          SizedBox(height: 30.0),
          _cardTypeTwo(),
          SizedBox(height: 30.0),
          _cardTypeOne(),
          SizedBox(height: 30.0),
          _cardTypeTwo(),
          SizedBox(height: 30.0),
          _cardTypeOne(),
          SizedBox(height: 30.0),
          _cardTypeTwo(),
          SizedBox(height: 30.0)
        ]));
  }
}

Widget _cardTypeOne() {
  return Card(
    // Sombra (shadow)
    elevation: 10.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    child: Column(
      children: <Widget>[
        ListTile(
            leading: Icon(Icons.photo_library_rounded, color: Colors.blue),
            title: Text('Soy el título de esta card'),
            subtitle:
                Text('Soy el subtítulo de esta card shalalalalalalalalalala')),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          TextButton(onPressed: () {}, child: Text('Cancelar')),
          TextButton(onPressed: () {}, child: Text('Ok'))
        ])
      ],
    ),
  );
}

Widget _cardTypeTwo() {
  final card = Container(
      // Clip.antiAlias ayuda a que el contenido de la card, no se salga de la misma
      // clipBehavior: Clip.antiAlias,
      child: Column(
    children: <Widget>[
      FadeInImage(
        placeholder: AssetImage('assets/jar-loading.gif'),
        image: NetworkImage(
            'https://profucom.com.mx/wp-content/uploads/2019/04/travel-landscape-01.jpg'),
        fadeInDuration: Duration(milliseconds: 200),
        height: 300.00,
        // El BoxFit.cover es para que la imagen se adapte a todo el ancho posible
        fit: BoxFit.cover,
      ),
      // Image(image: NetworkImage('https://profucom.com.mx/wp-content/uploads/2019/04/travel-landscape-01.jpg'))
      Container(
          padding: EdgeInsets.all(10.0), child: Text('Texto de la imagen'))
    ],
  ));

  return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 1.5,
                offset: Offset(2.0, 10.0))
          ]),
      child: ClipRRect(borderRadius: BorderRadius.circular(30.0), child: card));
}

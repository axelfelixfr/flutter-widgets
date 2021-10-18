import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key? key}) : super(key: key);
  static const pageName = 'avatar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: [
          Container(
              padding: EdgeInsets.all(5.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    'https://cdn.icon-icons.com/icons2/1508/PNG/512/systemusers_104569.png'),
              )),
          Container(
              margin: EdgeInsets.only(right: 5.0),
              child: CircleAvatar(
                child: Text('US'),
                backgroundColor: Colors.deepOrange,
              ))
        ],
      ),
      body: Center(
          child: FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image: NetworkImage(
                  'https://profucom.com.mx/wp-content/uploads/2019/04/travel-landscape-01.jpg'),
              fadeInDuration: Duration(milliseconds: 200))),
    );
  }
}

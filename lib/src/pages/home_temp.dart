import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  HomePageTemp({Key? key}) : super(key: key);

  final options = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Componentes Temp')),
        body: ListView(children: _createItems()));
  }

  List<Widget> _createItems() {
    List<Widget> listItems = <Widget>[];

    for (String opt in options) {
      final tempWidget = ListTile(title: Text(opt));

      // Operador de cascada (..)
      // Agrega el tempWidget y después agrega el Divider
      listItems
        ..add(tempWidget)
        ..add(const Divider());
    }

    return listItems;
  }

  List<Widget> _createItemsShort() {
    return options
        .map((item) => Column(
              children: [
                ListTile(
                    title: Text(item + '!'),
                    subtitle: const Text('Subtitulo'),
                    leading: const Icon(Icons.account_box),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {}),
                const Divider()
              ],
            ))
        .toList();
  }
}

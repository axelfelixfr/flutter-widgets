import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utilities/icon_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Componentes App')), body: _list());
  }

  Widget _list() {
    // print(menuProvider.options);
    // menuProvider.getData().then((options) { print(options); });
    return FutureBuilder(
        future: menuProvider.getData(),
        initialData: const [],
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          // print(snapshot.data);
          // Podría llegar a pasar que sea un valor null, así que ponemos ?? []
          return ListView(children: _listItems(snapshot.data ?? [], context));
        });
  }

  List<Widget> _listItems(List<dynamic> data, BuildContext context) {
    final List<Widget> options = [];

    for (var opt in data) {
      final widgetTemp = ListTile(
          // Accedemos a la propiedad 'texto' con opt['texto']
          title: Text(opt['texto']),
          leading: getIcon(opt['icon']),
          trailing:
              Icon(Icons.keyboard_arrow_right_rounded, color: Colors.blue),
          onTap: () {
            Navigator.pushNamed(context, opt['ruta']);

            // Para navegar a una página (widget):
            // final route = MaterialPageRoute(builder: (context) => AlertPage());
            // Navigator.push(context, route);
          });

      options
        ..add(widgetTemp)
        ..add(Divider());
    }

    return options;

    // Lista hardcodeada:
    // return [
    //   ListTile(title: Text('Hola mundo')),
    //   ListTile(title: Text('Hola mundo')),
    //   ListTile(title: Text('Hola mundo'))
    // ];
  }
}

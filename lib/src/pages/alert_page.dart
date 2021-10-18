import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alert Page')),
      body: Center(
          child: ElevatedButton(
              child: Text('Mostrar Alerta'),
              onPressed: () => _showAlert(context))),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.home), onPressed: () => Navigator.pop(context)),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        // barrierDismissible es para que se salga la alerta cuando se de click afuera de la alerta
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text('Alerta Flutter'),
            content: Column(
                // Con MainAxisSize.min solo toma el tamaño mínimo que ocupa el contenido
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('Este es el contenido de la caja'),
                  FlutterLogo(size: 100.00)
                ]),
            actions: [
              ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cancelar')),
              ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Ok'))
            ],
          );
        });
  }
}

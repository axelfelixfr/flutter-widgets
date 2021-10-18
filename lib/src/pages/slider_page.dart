import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valueSlider = 100.0;
  bool _blockCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Slider')),
        body: Container(
            padding: EdgeInsets.only(top: 20.0),
            child: Column(children: [
              _createSlider(),
              _createChekbox(),
              _createSwitch(),
              Expanded(child: _createImage())
            ])));
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      value: _valueSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (_blockCheck ?? false)
          ? null
          : (value) {
              setState(() {
                _valueSlider = value;
              });
            },
    );
  }

  Widget _createChekbox() {
    // return Checkbox(
    //   value: _blockCheck,
    //   onChanged: (value) {
    //     setState(() {
    //       _blockCheck = value;
    //     });
    //   },
    // );

    return CheckboxListTile(
        title: Text('Bloquear Slide'),
        value: _blockCheck,
        onChanged: (value) {
          setState(() {
            _blockCheck = value!;
          });
        });
  }

  Widget _createSwitch() {
    return SwitchListTile(
        title: Text('Bloquear Slide'),
        value: _blockCheck,
        onChanged: (value) {
          setState(() {
            _blockCheck = value;
          });
        });
  }

  Widget _createImage() {
    return Image(
        image: NetworkImage(
            'https://programarfacil.com/wp-content/uploads/2015/07/js-logo.png'),
        width: _valueSlider,
        fit: BoxFit.contain);
  }
}

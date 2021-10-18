import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = "";
  String _email = "";
  String _password = "";
  String _date = "";
  String? _optionSelected = "JavaScript";
  final List<String> _lenguages = ['JavaScript', 'PHP', 'Dart', 'Python'];

  final TextEditingController _inputFieldDateController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Inputs de texto')),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: [
            _createInput(),
            Divider(),
            _createEmail(),
            Divider(),
            _createPassword(),
            Divider(),
            _createDate(context),
            Divider(),
            _createDropdown(),
            Divider(),
            _createPerson()
          ],
        ));
  }

  Widget _createInput() {
    return TextField(
      // autofocus: true,
      maxLength: 10,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          counter: Text('${_name.length}/10'),
          hintText: 'Neponusemo Gonzalo',
          labelText: 'Nombre',
          helperText: 'Sólo es el nombre',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_box)),
      onChanged: (value) {
        setState(() => _name = value);
      },
    );
  }

  Widget _createEmail() {
    return TextField(
      // autofocus: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          hintText: 'usuario@correo.com',
          labelText: 'Correo electrónico',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),
      onChanged: (value) => setState(() => _email = value),
    );
  }

  Widget _createPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          labelText: 'Contraseña',
          suffixIcon: Icon(Icons.lock),
          icon: Icon(Icons.password)),
      onChanged: (value) => setState(() => _password = value),
    );
  }

  Widget _createDate(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          hintText: 'Tu nacimiento',
          labelText: 'Fecha de nacimiento',
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDatePicker(context);
      },
    );
  }

  _selectDatePicker(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2025));

    if (picked != null) {
      setState(() {
        _date = picked.toString();
        _inputFieldDateController.text = _date;
      });
    }
  }

  List<DropdownMenuItem<String>> getOptionsDropdown() {
    List<DropdownMenuItem<String>> list = [];
    for (var lenguage in _lenguages) {
      list.add(DropdownMenuItem(child: Text(lenguage), value: lenguage));
    }

    return list;
  }

  Widget _createDropdown() {
    return Row(children: [
      Icon(Icons.select_all),
      SizedBox(width: 30.0),
      DropdownButton<String>(
          value: _optionSelected,
          items: getOptionsDropdown(),
          onChanged: (opt) {
            setState(() {
              _optionSelected = opt;
            });
          })
    ]);
  }

  Widget _createPerson() {
    return ListTile(
        title: Text('Nombre es: $_name'),
        subtitle: Text('Email: $_email'),
        trailing: Text(_optionSelected.toString()));
  }
}

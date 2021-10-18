import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final ScrollController _scrollController = ScrollController();
  final List<int> _listNumbers = [];
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _addTeenImages();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  // El método dispose nos ayuda a deshacernos del dispose cuando se destruya la página
  // El dispose se dispara cuando se destruye la página para evitar fugas de memoria
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Listas')),
        body: Stack(children: [_createList(), _createLoading()]));
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: getPageOne,
      child: ListView.builder(
          controller: _scrollController,
          itemCount: _listNumbers.length,
          // El context se crea en el mismo método con 'BuildContext context'
          itemBuilder: (BuildContext context, int index) {
            // Se realiza el _listNumbers[index] para que me el numero del arreglo, no la posición
            final imagen = _listNumbers[index];
            return FadeInImage(
                image: NetworkImage(
                    'https://picsum.photos/500/300/?image=$imagen'),
                placeholder: AssetImage('assets/jar-loading.gif'));
          }),
    );
  }

  Future getPageOne() async {
    final duration = Duration(seconds: 2);
    Timer(duration, () {
      _listNumbers.clear();
      _lastItem++;
      _addTeenImages();
    });

    return Future.delayed(duration);
  }

  void _addTeenImages() {
    for (var i = 0; i < 10; i++) {
      _lastItem++;
      _listNumbers.add(_lastItem);
    }

    setState(() {});
  }

  Future fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = Duration(seconds: 2);
    return Timer(duration, responseHTTP);
  }

  void responseHTTP() {
    _isLoading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 250));
    _addTeenImages();
  }

  Widget _createLoading() {
    if (_isLoading) {
      return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [CircularProgressIndicator()],
            ),
            SizedBox(height: 15.0)
          ]);
    } else {
      return Container();
    }
  }
}

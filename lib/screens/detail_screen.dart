import 'package:flutter/material.dart';
import 'package:nutrilife/repository/models/models.dart';

class Details extends StatefulWidget {
  final Post post;

  const Details({Key key, this.post}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  Post _post;
  double _screenWidth;

  @override
  void initState() {
    super.initState();
    _post = widget.post;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _screenWidth = MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_post.titulo}'),
        backgroundColor: _post.materialColor,
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Hero(
              tag: 'background' + _post.titulo,
              child: Container(
                color: _post.materialColor,
              ),
            ),
            Positioned(
                top: 0.0,
                left: 0.0,
                width: _screenWidth,
                height: 230.0,
                child: Hero(
                    tag: 'image' + _post.titulo,
                    child: Image.network(
                      _post.imagen,
                      fit: BoxFit.fitWidth,
                    ))),
            Positioned(
                top: 250.0,
                left: 32.0,
                width: _screenWidth - 64.0,
                child: Hero(
                    tag: 'text' + _post.titulo,
                    child: Material(
                        color: Colors.transparent,
                        child: Text(
                          '${_post.titulo}',
                          style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: _post.materialColor.shade900),
                        )))),
            Positioned(
                top: 280.0,
                left: 32.0,
                width: _screenWidth - 64.0,
                child: Hero(
                    tag: 'subtitle' + _post.titulo,
                    child: Material(
                        color: Colors.transparent,
                        child: Text(
                          _post.subTitulo,
                        )))),
          ],
        ),
      ),
    );
  }
}
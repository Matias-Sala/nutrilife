import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nutrilife/repository/models/models.dart';
import 'package:nutrilife/repository/repository.dart';

import 'detail_screen.dart';

class HoyScreen extends StatefulWidget {
  @override
  _HoyScreenState createState() => _HoyScreenState();
}

class _HoyScreenState extends State<HoyScreen> {
  PostRepository _postRepository = PostApiRepository();
  double _screenWidthAdjustment;

  @override
  initState() {
    super.initState();
  }

  Stream<List<Post>> getPost() async* {
    var post = await _postRepository.getPosts(1);
    yield post;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Left and Right margins 24 + 24 = 48.0 - Text Left and Right Padding 32 + 32 = 64
    _screenWidthAdjustment = MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Hero Animation'),
      // ),
      body: SafeArea(
        child: StreamBuilder<List<Post>>(
            stream: getPost(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                List<Post> _postList = snapshot.data;
                return ListView.builder(
                  itemExtent: 180.0,
                  itemCount: _postList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                              top: 0.0,
                              left: 0.0,
                              right: 0.0,
                              child: Hero(
                                  tag: 'image' + _postList[index].titulo,
                                  child: Image.network(
                                    _postList[index].imagen,
                                    fit: BoxFit.fitWidth,
                                    height: 180.0,
                                  ))),
                          Positioned(
                              height: 180,
                              width: _screenWidthAdjustment,
                              child: Hero(
                                tag: 'text' + _postList[index].titulo,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(0, 0, 0, 0.5)),
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 24),
                                      child: Text(
                                        '${_postList[index].titulo}',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                      onTap: () {
                        // MaterialPageRoute
//                Navigator.of(context).push(
//                  MaterialPageRoute(
//                      fullscreenDialog: true,
//                      builder: (BuildContext context) => Details(heroType: HeroType(title: _postList[index].title, subTitle: _postList[index].subTitle, image: _postList[index].image, materialColor: _postList[index].materialColor))
//                  ),
//                );

                        // PageRouteBuilder
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            fullscreenDialog: true,
                            transitionDuration: Duration(milliseconds: 500),
                            pageBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secondaryAnimation) {
                              return Details(
                                  post: Post(
                                      1,
                                      _postList[index].categoriaId,
                                      _postList[index].titulo,
                                      _postList[index].subTitulo,
                                      _postList[index].materialColor,
                                      _postList[index].imagen));
                            },
                            transitionsBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secondaryAnimation,
                                Widget child) {
                              return FadeTransition(
                                opacity:
                                    animation, // CurvedAnimation(parent: animation, curve: Curves.elasticInOut),
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}

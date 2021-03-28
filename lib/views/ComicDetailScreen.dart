import 'package:flutter/material.dart';
import 'package:marvel_flutter/models/ComicModel.dart';

class ComicDetailScreen extends StatefulWidget {
  static const String nameId = 'comic_detail_screen';

  @override
  _ComicDetailScreenState createState() => _ComicDetailScreenState();
}

class _ComicDetailScreenState extends State<ComicDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final ComicResults comic = ModalRoute.of(context).settings.arguments;

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 120.0),
        Container(
          width: 90.0,
          child: new Divider(color: Colors.white),
        ),
        SizedBox(height: 10.0),
        Text(
          comic.title,
          style: TextStyle(color: Colors.white, fontSize: 23.0),
        ),
        SizedBox(height: 30.0),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10.0),
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: new BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(comic.thumbnail.path +
                      "/portrait_fantastic." +
                      comic.thumbnail.extension),
                  fit: BoxFit.cover)),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.red.withOpacity(0.7)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    final bottomContentText = Text(
      comic.title,
      style: TextStyle(fontSize: 18.0),
    );

    final bottomContent = Container(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // color: Theme.of(context).primaryColor,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText],
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }
}

import 'package:flutter/material.dart';


class SlideItem extends StatefulWidget {
  final String img;
  final String title;
  final String creators;
  final String price;

  SlideItem({
    Key key,
    @required this.img,
    @required this.title,
    @required this.creators,
    @required this.price,
  }) : super(key: key);

  @override
  _SlideItemState createState() => _SlideItemState();
}

class _SlideItemState extends State<SlideItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height / 1,
          width: MediaQuery.of(context).size.width / 2,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(8.0),
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                      child: Image.network(
                        "${widget.img}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text("${widget.title}"+ '\n'+ '\n',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              SizedBox(height: 7.0),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Creator: "
                    "${widget.creators}"+ '\n',
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Print Price: "
                    "${widget.price}",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

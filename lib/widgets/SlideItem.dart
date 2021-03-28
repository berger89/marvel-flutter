import 'package:flutter/material.dart';
import 'package:marvel_flutter/widgets/LinkText.dart';

class SlideItem extends StatefulWidget {
  final String img;
  final String title;
  final int titleMaxLines;
  final String subTitle;
  final String subTitle2;
  final String detailsLink;

  SlideItem({
    Key key,
    @required this.img,
    @required this.title,
    @required this.titleMaxLines,
    @required this.subTitle,
    this.subTitle2,
    this.detailsLink,
  }) : super(key: key);

  @override
  _SlideItemState createState() => _SlideItemState();
}

class _SlideItemState extends State<SlideItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width / 3,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: Image.network(
                        "${widget.img}",
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text("${widget.title}" + '\n' + '\n',
                      maxLines: widget.titleMaxLines,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
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
                    widget.subTitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
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
                  child: widget.subTitle2 != null
                      ? Text(
                          widget.subTitle2,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      : LinkText(text: widget.detailsLink),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

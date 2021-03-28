import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkText extends StatelessWidget {
  final String text;

  const LinkText({this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: RichText(
        text: TextSpan(
          text: "Details: ",
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
          children: <TextSpan>[
            TextSpan(
              text: text,
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.blue,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w300),
            )
          ],
        ),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () => launch(text),
    );
  }
}

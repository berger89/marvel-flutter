import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:marvel_flutter/api/MarvelApi.dart';
import 'package:marvel_flutter/models/MarvelModel.dart';

final String URL = "gateway.marvel.com";

class ComicApi extends MarvelApi {

  @override
  Future<MarvelModel> getComics() async {
    String privateKey = await rootBundle.loadString("assets/privatekey");
    String publicKey = await rootBundle.loadString("assets/publickey");
    int ts = new DateTime.now().millisecondsSinceEpoch;

    var bytes = utf8.encode(ts.toString() + privateKey + publicKey);
    Digest hash = md5.convert(bytes);

    Map<String, String> qParams = {
      'ts': ts.toString(),
      'apikey': publicKey,
      'hash': hash.toString(),
      'orderBy': "-modified"
    };
    qParams.update('ts', (value) => ts.toString());
    qParams.update('apikey', (value) => publicKey);
    qParams.update('hash', (value) => hash.toString());
    qParams.update('orderBy', (value) => "-modified");

    final response =
        await http.get(Uri.http(URL, '/v1/public/comics', qParams));

    if (response.statusCode <= 299) {
      var marvel =
          MarvelModel.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      return marvel;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('error retrieving comics: ${response.statusCode}');
    }
  }

}

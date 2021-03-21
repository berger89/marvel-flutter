import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:marvel_flutter/api/IMarvelApi.dart';
import 'package:marvel_flutter/models/ComicModel.dart';
import 'package:marvel_flutter/models/character/Character.dart';
import 'package:marvel_flutter/models/creator/Creator.dart';
import 'package:marvel_flutter/models/generic/DataWrapper.dart';

class MarvelApi extends IMarvelApi {
  final String URL = "gateway.marvel.com";

  Future<Map<String, String>> getQparams() async {
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

    return qParams;
  }

  @override
  Future<ComicModel> getComics() async {
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

    var response = await http.get(Uri.http(URL, '/v1/public/comics', qParams));

    try {
      if (response.statusCode <= 299) {
        var marvel =
            ComicModel.fromJson(json.decode(utf8.decode(response.bodyBytes)));
        return marvel;
      } else {
        // If that call was not successful, throw an error.
        throw Exception('error retrieving comics: ${response.statusCode}');
      }
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<DataWrapper<Character>> getCharacters() async {
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

    var response =
        await http.get(Uri.http(URL, '/v1/public/characters', qParams));

    if (response.statusCode <= 299) {
      try {
        var marvel = DataWrapper<Character>.fromJson(
            json.decode(utf8.decode(response.bodyBytes)), new Character());
        return marvel;
      } catch (e) {
        throw e;
      }
    } else {
      // If that call was not successful, throw an error.
      throw Exception('error retrieving character: ${response.statusCode}');
    }
  }

  @override
  Future<DataWrapper<Creator>> getCreators() async {
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

    var response =
        await http.get(Uri.http(URL, '/v1/public/creators', qParams));

    if (response.statusCode <= 299) {
      var marvel = DataWrapper<Creator>.fromJson(
          json.decode(utf8.decode(response.bodyBytes)), new Creator());
      return marvel;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('error retrieving creators: ${response.statusCode}');
    }
  }
}

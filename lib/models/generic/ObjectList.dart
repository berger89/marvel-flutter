import 'package:marvel_flutter/models/generic/Summary.dart';

class ObjectList<T extends Summary> {
  int available;
  String collectionURI;
  List<T> items;
  int returned;

  ObjectList({this.available, this.collectionURI, this.items, this.returned});

  ObjectList fromJson(Map<String, dynamic> json, Summary item) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    if (json['items'] != null) {
      items = new List<T>();
      json['items'].forEach((v) {
        items.add(item.fromJson(v));
      });
    }
    returned = json['returned'];
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['available'] = this.available;
    data['collectionURI'] = this.collectionURI;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    data['returned'] = this.returned;
    return data;
  }
}

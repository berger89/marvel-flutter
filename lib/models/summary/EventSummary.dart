import 'package:marvel_flutter/models/generic/Summary.dart';

class EventSummary extends Summary {
  String resourceUri;
  String name;

  EventSummary({this.resourceUri, this.name});

  EventSummary fromJson(Map<String, dynamic> json) {
    resourceUri = json['resourceURI'];
    name = json['name'];
    return new EventSummary(resourceUri: resourceUri, name: name);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resourceUri'] = this.resourceUri;
    data['name'] = this.name;
    return data;
  }
}

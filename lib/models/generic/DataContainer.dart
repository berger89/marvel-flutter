import 'package:marvel_flutter/models/generic/Data.dart';

class DataContainer<T extends Data> {
  int offset;
  int limit;
  int total;
  int count;
  List<T> results;

  DataContainer(
      {this.offset, this.limit, this.total, this.count, this.results});

  DataContainer.fromJson(Map<String, dynamic> json, Data data) {
    offset = json['offset'];
    limit = json['limit'];
    total = json['total'];
    count = json['count'];
    if (json['results'] != null) {
      results = new List<T>();
      json['results'].forEach((v) {
        results.add(data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offset'] = this.offset;
    data['limit'] = this.limit;
    data['total'] = this.total;
    data['count'] = this.count;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

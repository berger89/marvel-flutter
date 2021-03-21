import 'package:marvel_flutter/models/generic/DataContainer.dart';

import 'Data.dart';

class DataWrapper<T extends Data> {
  int code;
  String status;
  String copyright;
  String attributionText;
  String attributionHTML;
  String etag;
  DataContainer<T> data;

  DataWrapper(
      {this.code,
      this.status,
      this.copyright,
      this.attributionText,
      this.attributionHTML,
      this.etag,
      this.data});

  DataWrapper.fromJson(Map<String, dynamic> json, Data data) {
    this.code = json['code'];
    this.status = json['status'];
    this.copyright = json['copyright'];
    this.attributionText = json['attributionText'];
    this.attributionHTML = json['attributionHTML'];
    this.etag = json['etag'];
    this.data = json['data'] != null
        ? new DataContainer<T>.fromJson(json['data'], data)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['copyright'] = this.copyright;
    data['attributionText'] = this.attributionText;
    data['attributionHTML'] = this.attributionHTML;
    data['etag'] = this.etag;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

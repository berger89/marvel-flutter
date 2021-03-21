import 'package:marvel_flutter/models/generic/Summary.dart';

class CharacterSummary extends Summary {
  String role;

  CharacterSummary({this.role});

  fromJson(Map<String, dynamic> json) {
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role'] = this.role;
    return data;
  }
}

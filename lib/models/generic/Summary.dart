class Summary {
  String resourceUri;
  String name;

  Summary({this.resourceUri, this.name});

  Summary fromJson(Map<String, dynamic> json) {
    resourceUri = json['resourceURI'];
    name = json['name'];
    return new Summary(resourceUri: resourceUri, name: name);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resourceUri'] = this.resourceUri;
    data['name'] = this.name;
    return data;
  }
}

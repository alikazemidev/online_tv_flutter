class Channel {
  String? name;
  String? url;
  String? logo;

  Channel({this.name, this.url, this.logo});

  Channel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    data['logo'] = this.logo;
    return data;
  }
}
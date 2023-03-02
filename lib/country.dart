class Country {
  int? id;
  String? region;
  String? cca2;
  String? imageURL;
  bool? unMember;
  List<dynamic>? capital;

  Country(
      {this.id,
      this.region,
      this.cca2,
      this.imageURL,
      this.unMember,
      this.capital});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    region = json['region'];
    cca2 = json['cca2'];
    imageURL = json['flags.png'];
    unMember = json['unMember'];
    capital = json['capital'];
  }
}

class Password {
  int? id;
  String? name;
  String? urlImage;
  String? email;
  String? password;
  String? selected;
  String? note;

  Password(
      {this.id,
      this.name,
      this.urlImage,
      this.email,
      this.password,
      this.note,
      this.selected});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "name": name ?? '',
      "urlImage": urlImage ?? '',
      "email": email ?? '',
      "password": password ?? '',
      "note": note ?? '',
      // "selected": selected ?? ''
    };
  }

  Password.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"];
    urlImage = map["urlImage"];
    email = map["email"];
    password = map["password"];
    note = map["note"];
    // selected = map["selected"];
  }
}

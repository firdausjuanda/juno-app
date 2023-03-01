class User {
  late int id;
  late String name;
  late String jobrole;
  late int active;
  User(
      {required this.id,
      required this.name,
      required this.jobrole,
      required this.active});

  User.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    jobrole = json['jobrole'];
    active = json['active'];
  }
}

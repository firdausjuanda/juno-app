class Material {
  late int id;
  late String materialCode;
  late String unit;
  late String description;
  late String category;
  Material(
      {required this.id,
      required this.materialCode,
      required this.unit,
      required this.description,
      required this.category});

  Material.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    materialCode = json['materialCode'];
    unit = json['unit'];
    description = json['description'];
    category = json['category'];
  }
}

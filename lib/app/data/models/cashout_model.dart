import 'package:motowash/app/data/models/user_model.dart';
import 'package:motowash/app/data/models/material_model.dart';

class CashOut {
  late int id;
  late int type;
  late String createdAt;
  late Material material;
  late int amount;
  late int qty;
  late String currency;
  late String status;
  late User user;
  CashOut(
      {required this.id,
      required this.createdAt,
      required this.material,
      required this.amount,
      required this.qty,
      required this.user,
      required this.status,
      required this.currency});

  CashOut.fromJSON(Map<String, dynamic> json) {
    id = json['matId'];
    createdAt = json['createdAt'];
    material = json['material'];
    amount = json['amount'];
    qty = json['qty'];
    currency = json['currency'];
    status = json['status'];
    user = json['user'];
    material = json['material'];
  }
}

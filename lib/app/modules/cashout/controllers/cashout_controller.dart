import 'package:get/get.dart';

class CashoutController extends GetxController {
  final count = 0.obs;
  final data = [
    {
      "type": "consumable",
      "createdAt": "2023-01-27 11:30:21",
      "material": {
        "id": 1,
        "materialCode": "C02.023.092",
        "unit": "gr",
        "description": "Sabun Ekonomi",
        "category": "soap",
      },
      "amount": 5000,
      "currency": "idr",
      "user": {
        "id": 2,
        "name": "Rusdimanto",
        "jobrole": "OPR",
        "active": 1,
      },
      "qty": 5,
      "status": "approved",
      "approval": {
        "approvalId": 1,
        "approvedBy": 1,
        "approvedAt": "2023-01-27 13:30:21",
      },
    },
    {
      "type": "consumable",
      "createdAt": "2023-01-27 11:31:43",
      "material": {
        "id": 2,
        "materialCode": "C02.023.090",
        "unit": "L",
        "description": "Bensin",
        "category": "fuel",
      },
      "amount": 16000,
      "currency": "idr",
      "user": {
        "id": 2,
        "name": "Rusdimanto",
        "jobrole": "OPR",
        "active": 1,
      },
      "qty": 1.5,
      "status": "approved",
      "approval": {
        "approvalId": 1,
        "approvedBy": 1,
        "approvedAt": "2023-01-27 13:31:04",
      },
    },
    {
      "type": "salary",
      "createdAt": "2023-01-27 11:31:43",
      "material": {
        "id": 3,
        "materialCode": "C02.023.090",
        "unit": "L",
        "description": "Bensin",
        "category": "fuel",
      },
      "amount": 50000,
      "currency": "idr",
      "user": {
        "id": 2,
        "name": "Rusdimanto",
        "jobrole": "OPR",
        "active": 1,
      },
      "qty": 1,
      "status": "approved",
      "approval": {
        "approvalId": 1,
        "approvedBy": 1,
        "approvedAt": "2023-01-27 13:31:04",
      },
    },
    {
      "type": "salary",
      "createdAt": "2023-01-27 11:31:43",
      "material": null,
      "amount": 100000,
      "currency": "idr",
      "user": {
        "id": 2,
        "name": "Rusdimanto",
        "jobrole": "OPR",
        "active": 1,
      },
      "qty": 1,
      "status": "approved",
      "approval": {
        "approvalId": 1,
        "approvedBy": 1,
        "approvedAt": "2023-01-27 13:31:04",
      },
    },
  ].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}

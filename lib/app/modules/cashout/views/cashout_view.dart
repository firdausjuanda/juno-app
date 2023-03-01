import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:motowash/app/data/models/material_model.dart' as mat_model;
import 'package:motowash/app/data/models/user_model.dart';

import '../controllers/cashout_controller.dart';

class CashoutView extends GetView<CashoutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Cashout'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: controller.data.length,
          itemBuilder: (context, i) {
            var data = controller.data.value[i];
            var material = data['material'] != null
                ? mat_model.Material.fromJSON(
                    data['material'] as Map<String, dynamic>)
                : null;
            var user = User.fromJSON(data['user'] as Map<String, dynamic>);
            return ListTile(
              leading: Text("${i + 1}"),
              title: Row(
                children: [
                  Text(data['type'] != 'salary'
                      ? material!.description
                      : "Salary"),
                  SizedBox(
                    width: 8,
                  ),
                  Chip(
                    label: Text(data['status'].toString()),
                    padding: EdgeInsets.all(1),
                  )
                ],
              ),
              subtitle: Text(user.name),
              trailing: Text(
                  "${data['currency'].toString().toUpperCase()} ${data['amount'].toString()}"),
              onTap: () => print(data['amount'].toString()),
            );
          }),
    );
  }
}

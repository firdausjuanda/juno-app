import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motowash/app/data/constants/plat_list.dart';
import 'package:motowash/app/modules/home/controllers/home_controller.dart';
import 'package:motowash/app/modules/result/views/result_view.dart';

class SelectView extends GetView<HomeController> {
  const SelectView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        title: Text(data['name']),
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(18),
          child: ListView(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Plat Nomor Kendaraan'),
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          DropdownButton(
                            hint: const Text('Region'),
                            itemHeight: 74,
                            menuMaxHeight: 250.0,
                            value: controller.policeNumberRegion.value,
                            onChanged: (value) {
                              controller.policeNumberRegion.value =
                                  value.toString();
                            },
                            items: PlatList.list
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e['code'].toString(),
                                    child: Text(e['code'].toString()),
                                  ),
                                )
                                .toList(),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  labelStyle:
                                      Theme.of(context).textTheme.labelLarge,
                                  labelText: "Nomor"),
                              controller: controller.policeNumberSerial,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: "Seri",
                                labelStyle:
                                    Theme.of(context).textTheme.labelLarge,
                              ),
                              controller: controller.policeNumberSuffix,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Promo'),
                      DropdownButton(
                        hint: const Text('Region'),
                        isExpanded: true,
                        itemHeight: 74,
                        value: controller.promoCode.value,
                        onChanged: (value) {
                          controller.promoCode.value = value.toString();
                        },
                        items: const [
                          DropdownMenuItem(
                            value: "NA",
                            child: Text("Belum dipilih"),
                          ),
                          DropdownMenuItem(
                            value: "5service1free",
                            child: Text("5x Cuci 1x Free"),
                          ),
                          DropdownMenuItem(
                            value: "cucigratis50%",
                            child: Text("Grand Opening (off 50%)"),
                          ),
                          DropdownMenuItem(
                            value: "promoakhirtahun",
                            child: Text("Promo Akhir Tahun (hanya Rp.5000)"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Reference'),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Customer ID",
                          labelStyle: Theme.of(context).textTheme.labelLarge,
                        ),
                        controller: controller.customerId,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Obx(
                () => ElevatedButton(
                  onPressed: controller.storingService.isTrue
                      ? null
                      : () async {
                          controller.storingService.value = true;
                          var response = await controller.storeService(
                              data?['name'],
                              int.parse(data?['price']),
                              1,
                              "done");
                          controller.storingService.value = false;
                          if (response == null) {
                            Get.off(() => ResultView(), arguments: {
                              "type": "success",
                              "title": "Sukses",
                              "message": "Berhasil menyimpan",
                              "data": response
                            });
                            controller.flush();
                          } else {
                            Get.off(() => ResultView(), arguments: {
                              "type": "error",
                              "title": "Gagal",
                              "message": "Gagal menyimpan"
                            });
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: controller.storingService.isTrue
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text('SIMPAN'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

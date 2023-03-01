import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:motowash/app/widgets/dialog.dart' as my_dialog;
import 'package:motowash/app/widgets/snackbar.dart';

import '../controllers/services_controller.dart';

class ServicesView extends GetView<ServicesController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Summary'),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size(20, 35),
            child: Container(
              color: Theme.of(context).secondaryHeaderColor,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, bottom: 10, top: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rp. ${NumberFormat("#,###", "en_US").format(controller.total.value)}",
                        style: TextStyle(color: Colors.blueGrey[900]),
                      ),
                      Text(
                        "${controller.count.value} Unit",
                        style: TextStyle(color: Colors.blueGrey[900]),
                      ),
                      GestureDetector(
                        onTap: () async {
                          DateTimeRange? pickedDate = await showDateRangePicker(
                            context: context,
                            initialDateRange: DateTimeRange(
                              end: DateFormat('y-MM-dd')
                                  .parse(controller.dateEnd.text),
                              start: DateFormat('y-MM-dd')
                                  .parse(controller.dateStart.text),
                            ),

                            firstDate: DateTime(
                                2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101),
                          );
                          // DateTime? pickedDate = await showDatePicker(
                          //   context: context,
                          //   initialDate: DateFormat('y-MM-dd')
                          //       .parse(controller.date.text),
                          //   firstDate: DateTime(
                          //       2000), //DateTime.now() - not to allow to choose before today.
                          //   lastDate: DateTime(2101),
                          // );
                          if (pickedDate != null) {
                            //pickedDate output format => 2021-03-10 00:00:00.000
                            String startDate = DateFormat('yyyy-MM-dd').format(
                                pickedDate
                                    .start); //formatted date output using intl package =>  2021-03-16
                            String endDate = DateFormat('yyyy-MM-dd').format(
                                pickedDate
                                    .end); //formatted date output using intl package =>  2021-03-16
                            //you can implement different kind of Date Format here according to your requirement
                            controller.dateStart.text = startDate;
                            controller.dateEnd.text = endDate;
                            controller.onInit();
                          }
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              color: Colors.blueGrey[900],
                              size: 14,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              // controller.date.text
                              DateFormat.MMMd().format(
                                  DateTime.parse(controller.dateStart.text)),
                              style: TextStyle(color: Colors.blueGrey[900]),
                            ),
                            (controller.dateStart.text ==
                                    controller.dateEnd.text)
                                ? const SizedBox.shrink()
                                : Text(
                                    ' - ',
                                    style:
                                        TextStyle(color: Colors.blueGrey[900]),
                                  ),
                            (controller.dateStart.text ==
                                    controller.dateEnd.text)
                                ? const SizedBox.shrink()
                                : Text(
                                    // controller.date.text
                                    DateFormat.MMMd().format(DateTime.parse(
                                        controller.dateEnd.text)),
                                    style:
                                        TextStyle(color: Colors.blueGrey[900]),
                                  ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ),
        body: controller.obx(
          (data) {
            if (data?.length == 0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Tidak ada data"),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () => controller.onInit(),
                      child: const Text('REFRESH'),
                    ),
                  ],
                ),
              );
            }
            return RefreshIndicator(
              onRefresh: () async {
                controller.onInit();
                Snackbar()
                    .show(message: "Berhasil memuat", title: "Kerja bagus!");
              },
              child: ListView.builder(
                  itemCount: data?.length,
                  itemBuilder: (_, i) {
                    var originalDate = DateTime.parse(data?[i]['created_at']);
                    return ListTile(
                      leading: Text("${i + 1}"),
                      title: Text(
                          "${data?[i]['unit_type']} - ${data?[i]['transaction_code']} "),
                      subtitle: Text(DateFormat("MMM d, y (H.mm)")
                          .format(DateTime(
                              originalDate.year,
                              originalDate.month,
                              originalDate.day,
                              originalDate.hour + 7,
                              originalDate.minute))
                          .toString()),
                      trailing: Text(
                          "Rp. ${NumberFormat("#,###", "en_US").format(int.parse(data?[i]['price']))}"),
                    );
                  }),
            );
          },
          onLoading: const Center(
            child: Text('Loading'),
          ),
          onEmpty: const Center(
            child: Text('Tidak ada data'),
          ),
          onError: (error) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  error.toString(),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                  onPressed: () => controller.getData(),
                  icon: const Icon(Icons.refresh),
                  label: const Text('RELOAD'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

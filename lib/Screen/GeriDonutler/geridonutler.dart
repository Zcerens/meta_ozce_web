import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../const/constant.dart';

class GeriDonutler extends StatefulWidget {
  const GeriDonutler({super.key});

  @override
  State<GeriDonutler> createState() => _GeriDonutlerState();
}

class _GeriDonutlerState extends State<GeriDonutler> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [Text("hello"), buildTabloOlusturma()]),
          ),
        ),
      ),
    );
  }

  buildTabloOlusturma() => Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Geri Dönütler",
                    style: TextStyle(fontSize: 42, color: kPrimaryColor),
                  ),
                ],
              ),
            ),
            new Divider(
              color: kPrimaryColor,
            ),
            DataTable(
                columnSpacing: 30.0,
                headingRowColor: MaterialStateProperty.resolveWith(
                    (states) => Colors.grey.shade200),
                columns: [
                  const DataColumn(
                      label: Text(
                    "Yorum Sayısı",
                  )),
                  const DataColumn(label: Text("Otel Puanı (0-5)")),
                  const DataColumn(label: Text("Otel Değerlendirme Notu")),
                  const DataColumn(label: Text("Uygulama Puanı (0-5)")),
                  const DataColumn(label: Text("Uygulama Değerlendirme Notu")),
                ],
                rows: [
                  DataRow(cells: [
                    const DataCell(Text("0")),
                    const DataCell(Text("How to build a Flutter Web App")),
                    DataCell(Text("${DateTime.now()}")),
                    const DataCell(Text("2.3K Views")),
                    const DataCell(Text("102Comments")),
                  ]),
                  DataRow(cells: [
                    const DataCell(Text("1")),
                    const DataCell(Text("How to build a Flutter Mobile App")),
                    DataCell(Text("${DateTime.now()}")),
                    const DataCell(Text("21.3K Views")),
                    const DataCell(Text("1020Comments")),
                  ]),
                  DataRow(cells: [
                    const DataCell(Text("2")),
                    const DataCell(Text("Flutter for your first project")),
                    DataCell(Text("${DateTime.now()}")),
                    const DataCell(Text("2.3M Views")),
                    const DataCell(Text("10K Comments")),
                  ]),
                ]),
            //Now let's set the pagination
            const SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "1",
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "2",
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "3",
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "See All",
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                ),
              ],
            )
          ],
        ),
      );
}

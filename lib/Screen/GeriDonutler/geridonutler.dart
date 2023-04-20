import 'package:cloud_firestore/cloud_firestore.dart';
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

  buildTabloOlusturma() {
    late final _firestore = FirebaseFirestore.instance;

    CollectionReference geriDonutlerRef = _firestore.collection("feedbacks");
    return Padding(
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
          StreamBuilder<QuerySnapshot>(
              stream: geriDonutlerRef.snapshots(),
              builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
                List<DocumentSnapshot> listOfDocumentSnap =
                    asyncSnapshot.data.docs;
                print(listOfDocumentSnap[0].get('mobil'));
                return ListView.builder(
                    itemCount: listOfDocumentSnap.length,
                    itemBuilder: (context, index) {
                      return DataTable(
                          columnSpacing: 30.0,
                          headingRowColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.grey.shade200),
                          columns: [
                            const DataColumn(
                                label: Text(
                              "Yorum Sayısı",
                            )),
                            const DataColumn(label: Text("Otel Puanı (0-5)")),
                            const DataColumn(
                                label: Text("Otel Değerlendirme Notu")),
                            const DataColumn(
                                label: Text("Uygulama Puanı (0-5)")),
                            const DataColumn(
                                label: Text("Uygulama Değerlendirme Notu")),
                          ],
                          rows: [
                            DataRow(cells: [
                              DataCell(
                                  Text(listOfDocumentSnap[index].get('mobil'))),
                              const DataCell(
                                  Text("How to build a Flutter Web App")),
                              //DataCell(Text("${DateTime.now()}")),
                              const DataCell(Text("2.3K Views")),
                              const DataCell(Text("102Comments")),
                            ]),
                          ]);
                    });
              }),

          const SizedBox(
            height: 40.0,
          ),

          //Now let's set the pagination

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
}

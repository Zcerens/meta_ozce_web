import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AnaEkran extends StatefulWidget {
  const AnaEkran({super.key});

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 60.0, left: 60.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //let's add the navigation menu for this project
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              //Now let's start with the dashboard main rapports
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.article,
                                  size: 26.0,
                                ),
                                const SizedBox(
                                  width: 15.0,
                                ),
                                const Text(
                                  "Personeller",
                                  style: TextStyle(
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            const Text(
                              "6 Personel",
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.comment,
                                  size: 26.0,
                                  color: Colors.red,
                                ),
                                const SizedBox(
                                  width: 15.0,
                                ),
                                const Text(
                                  "Comments",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            const Text(
                              "+32 Comments",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.people,
                                  size: 26.0,
                                  color: Colors.amber,
                                ),
                                const SizedBox(
                                  width: 15.0,
                                ),
                                const Text(
                                  "Müşteriler",
                                  style: TextStyle(
                                    fontSize: 26.0,
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            const Text(
                              "3.142 Müşteri",
                              style: TextStyle(
                                fontSize: 36,
                                color: Colors.amber,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.monetization_on_outlined,
                                  size: 26.0,
                                  color: Colors.green,
                                ),
                                const SizedBox(
                                  width: 15.0,
                                ),
                                const Text(
                                  "Revenue",
                                  style: TextStyle(
                                    fontSize: 26.0,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            const Text(
                              "2.300 \$",
                              style: TextStyle(
                                fontSize: 36,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //Now let's set the article section
              const SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text(
                        "6 Articles",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        "3 new Articles",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Container(
                    width: 300.0,
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: "Type Article Title",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black26,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 40.0,
              ),

              //let's set the filter section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.deepPurple.shade400,
                    ),
                    label: Text(
                      "2022, July 14, July 15, July 16",
                      style: TextStyle(
                        color: Colors.deepPurple.shade400,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      DropdownButton(
                          hint: const Text("Filter by"),
                          items: [
                            const DropdownMenuItem(
                              value: "Date",
                              child: Text("Date"),
                            ),
                            const DropdownMenuItem(
                              value: "Comments",
                              child: Text("Comments"),
                            ),
                            const DropdownMenuItem(
                              value: "Views",
                              child: Text("Views"),
                            ),
                          ],
                          onChanged: (value) {}),
                      const SizedBox(
                        width: 20.0,
                      ),
                      DropdownButton(
                          hint: const Text("Order by"),
                          items: [
                            const DropdownMenuItem(
                              value: "Date",
                              child: Text("Date"),
                            ),
                            const DropdownMenuItem(
                              value: "Comments",
                              child: Text("Comments"),
                            ),
                            const DropdownMenuItem(
                              value: "Views",
                              child: Text("Views"),
                            ),
                          ],
                          onChanged: (value) {}),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 40.0,
              ),
              //Now let's add the Table
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DataTable(
                      headingRowColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.grey.shade200),
                      columns: [
                        const DataColumn(label: Text("ID")),
                        const DataColumn(label: Text("Article Title")),
                        const DataColumn(label: Text("Creation Date")),
                        const DataColumn(label: Text("Views")),
                        const DataColumn(label: Text("Comments")),
                      ],
                      rows: [
                        DataRow(cells: [
                          const DataCell(Text("0")),
                          const DataCell(
                              Text("How to build a Flutter Web App")),
                          DataCell(Text("${DateTime.now()}")),
                          const DataCell(Text("2.3K Views")),
                          const DataCell(Text("102Comments")),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text("1")),
                          const DataCell(
                              Text("How to build a Flutter Mobile App")),
                          DataCell(Text("${DateTime.now()}")),
                          const DataCell(Text("21.3K Views")),
                          const DataCell(Text("1020Comments")),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text("2")),
                          const DataCell(
                              Text("Flutter for your first project")),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

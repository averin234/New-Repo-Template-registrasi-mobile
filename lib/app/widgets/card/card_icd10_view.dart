import 'dart:math';

import 'package:flutter/material.dart';

class CardICD10 extends StatefulWidget {
  final dynamic icd10;
  const CardICD10({Key? key, required this.icd10}) : super(key: key);

  @override
  State<CardICD10> createState() => _CardICD10State();
}

class _CardICD10State extends State<CardICD10> {
  final DataTableSource _data = MyData();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          PaginatedDataTable(
            source: _data,
            header: const Text('ICD 10'),
            columns: const [
              DataColumn(label: Text('No')),
              DataColumn(label: Text('KELOMPOK ICD-10')),
              DataColumn(label: Text('NAMA KELOMPOK')),
              DataColumn(label: Text('KODE ICD-10')),
              DataColumn(label: Text('NAMA ICD-10')),
              DataColumn(label: Text('KODE ASTERIK')),
              DataColumn(label: Text('NAMA ASTERIK')),
              DataColumn(label: Text('DIAGNOSA')),
            ],
            columnSpacing: 20,
            horizontalMargin: 10,
            rowsPerPage: 8,
            showCheckboxColumn: false,
          ),
        ],
      ),
    );
  }
}

// The "soruce" of the table
class MyData extends DataTableSource {
  // Generate some made-up data
  final List<Map<String, dynamic>> _data = List.generate(
      200,
      (index) => {
            "id": index,
            "title": "Item $index",
            "price": Random().nextInt(10000)
          });

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(_data[index]['id'].toString())),
      DataCell(Text(_data[index]["title"])),
      DataCell(Text(_data[index]["price"].toString())),
      DataCell(Text(_data[index]["price"].toString())),
      DataCell(Text(_data[index]["price"].toString())),
      DataCell(Text(_data[index]["price"].toString())),
      DataCell(Text(_data[index]["price"].toString())),
      DataCell(Text(_data[index]["price"].toString())),
    ]);
  }
}

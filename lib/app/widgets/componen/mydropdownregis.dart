import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../data/model/dropdown_model.dart';
import '../color/custom_color.dart';

class MyDropDown extends StatelessWidget {
  final List<Dropdowns> items;
  final String labelText;
  final String? selectedItem;
  final TextEditingController controller;
  const MyDropDown(
      {super.key,
      required this.items,
      required this.controller,
      required this.labelText,
      this.selectedItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: const Color(0xffeaeaea)),
        color: Theme.of(context).brightness == Brightness.light
            ? CustomColors.warnaputih
            : CustomColors.darkmode1,
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: DropdownSearch<Dropdowns>(
        popupProps: const PopupProps.menu(
          fit: FlexFit.loose,
        ),
        items: items,
        itemAsString: (item) => item.kategori,
        dropdownDecoratorProps: const DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          ),
        ),
        onChanged: (value) => controller.text = value!.initialValue,
      ),
    );
  }
}

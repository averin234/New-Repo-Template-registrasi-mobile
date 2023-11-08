import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../data/model/dropdown_model.dart';
import '../color/custom_color.dart';

class MyDropDown1 extends StatelessWidget {
  final List<Dropdowns> items;
  final String labelText;
  final Dropdowns? selectedItem;
  final TextEditingController controller;
  const MyDropDown1(
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
        color: CustomColors.warnaputih,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        border: Border.fromBorderSide(
          BorderSide(color: CustomColors.warnaputih),
        ),
      ),
      child: DropdownSearch<Dropdowns>(
        popupProps: const PopupProps.menu(
          fit: FlexFit.loose,
        ),
        selectedItem: selectedItem,
        items: items,
        itemAsString: (item) => item.kategori,
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Color(0xffeaeaea),
              ),
              borderRadius: BorderRadius.circular(10.0), //<-- SEE HERE
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
          ),
        ),
        onChanged: (value) {
          controller.text = value!.initialValue;
          print(controller.text);
        },
      ),
    );
  }
}

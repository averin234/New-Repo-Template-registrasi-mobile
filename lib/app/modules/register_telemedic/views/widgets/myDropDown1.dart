import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../../../data/model/dropdown_model.dart';
import '../../../../widgets/color/custom_color.dart';

class MyDropDown2 extends StatelessWidget {
  final List<Dropdowns> items;
  final String labelText;
  final Dropdowns? selectedItem;
  final TextEditingController controller;
  final TextEditingController controller1;
  const MyDropDown2(
      {super.key,
      required this.items,
      required this.controller,
      required this.controller1,
      required this.labelText,
      this.selectedItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      decoration: const BoxDecoration(
        color: CustomColors.warnaputih,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
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
            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Color(0xffeaeaea),
              ),
              borderRadius: BorderRadius.circular(10.0), //<-- SEE HERE
            ),
            border:
                const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          ),
        ),
        onChanged: (value) {
          controller1.text = value!.kategori;
          controller.text = value.initialValue;
        },
      ),
    );
  }
}

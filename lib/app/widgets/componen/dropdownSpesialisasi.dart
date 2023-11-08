import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rskgcare/app/widgets/endpoint/fetch_data.dart';
import 'package:rskgcare/app/data/model/homepage/poli.dart';
import 'package:rskgcare/app/modules/register_rs/controllers/register_rs_controller.dart';

import '../color/custom_color.dart';

class DropDownListExample extends StatefulWidget {
  const DropDownListExample({
    Key? key,
  }) : super(key: key);

  @override
  _DropDownListExampleState createState() => _DropDownListExampleState();
}

class _DropDownListExampleState extends State<DropDownListExample> {
  final TextEditingController _cityTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          FutureBuilder(
              future: API.getPoli(),
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState != ConnectionState.waiting &&
                    snapshot.data != null) {
                  final data = snapshot.data!;
                  return AppTextField(
                    textEditingController: _cityTextEditingController,
                    hint: "Spesialisasi",
                    isCitySelected: true,
                    lists: data.list!,
                    title: '',
                  );
                } else {
                  return Container();
                }
              }),
        ],
      ),
    );
  }
}

/// This is Common App textfiled class.
class AppTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String title;
  final String hint;
  final bool isCitySelected;
  final List<Lists> lists;

  const AppTextField({
    required this.textEditingController,
    required this.title,
    required this.hint,
    required this.isCitySelected,
    required this.lists,
    Key? key,
  }) : super(key: key);

  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTap() {
    final controller = Get.put(RegisterRsController());
    showModalBottomSheet<void>(
      enableDrag: false,
      context: Get.context!,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return Column(
          children: [
            Expanded(
              child: ListView(
                children: lists
                    .map(
                      (e) => TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: CustomColors.warnahitam,
                            padding: const EdgeInsets.symmetric(vertical: 20)),
                        child: Text(
                          e.namaBagian!,
                          style: GoogleFonts.nunito(
                            fontSize: 17.0,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? CustomColors.warnahitam
                                    : CustomColors.warnaputih,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        onPressed: () {
                          textEditingController.text = e.namaBagian!;
                          controller.namaBagian.value = e.kodeBagian!;
                          Get.back();
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        );
      },
    );
  }

  void showSnackBar(String message) {
    Get.snackbar(title, message);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          readOnly: true,
          controller: textEditingController,
          cursorColor: CustomColors.warnahitam,
          onTap: onTextFieldTap,
          style: TextStyle(color: CustomColors.warnahitam),
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).brightness == Brightness.light
                ? CustomColors.warnaputih
                : CustomColors.darkmode1,
            suffixIcon: const Icon(Icons.arrow_drop_down_circle,
                color: CustomColors.warnabiru),
            contentPadding:
                const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
            hintText: hint,
            hintStyle: TextStyle(
              color: Theme.of(context).brightness == Brightness.light
                  ? CustomColors.warnahitam
                  : CustomColors.warnaputih,
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}

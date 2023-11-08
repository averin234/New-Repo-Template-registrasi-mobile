import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rskgcare/app/widgets/endpoint/fetch_data.dart';
import 'package:rskgcare/app/data/componen/images.dart';
import 'package:rskgcare/app/widgets/componen/calender.dart';
import 'package:rskgcare/app/widgets/componen/entry_field.dart';
import 'package:rskgcare/app/routes/app_pages.dart';
import '../../data/model/dropdown_model.dart';
import '../color/custom_color.dart';
import '../../modules/edit-profile/controllers/edit_profile_controller.dart';
import '../componen/mydropdown.dart';

class MyRegister1 extends GetView<EditProfileController> {
  const MyRegister1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding:
              const EdgeInsets.only(right: 125, left: 125, top: 20, bottom: 20),
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.light
                ? CustomColors.background
                : CustomColors.darkmode1,
          ),
          child: Stack(
            children: [
              GestureDetector(
                onTap: () async {
                  XFile? image = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    controller.fileImage.value = image.path;
                    final base64 = base64Encode(
                        File(controller.fileImage.value).readAsBytesSync());
                    final decode = base64Decode(base64);
                    final s = String.fromCharCodes(decode);
                    controller.fotoController.text = s;
                  }
                },
                child: Obx(() {
                  return Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      border:
                          Border.all(width: 4, color: CustomColors.warnabiru),
                      shape: BoxShape.circle,
                      image: controller.fileImage.value.isEmpty
                          ? DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                controller.dataPasien.value.fotoPasien != 'null'
                                    ? controller.dataPasien.value.fotoPasien!
                                    : controller.dataPasien.value
                                                .jenisKelamin ==
                                            'L'
                                        ? Avatar.lakiLaki
                                        : Avatar.perempuan,
                              ),
                            )
                          : DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(
                                File(controller.fileImage.value),
                              ),
                            ),
                    ),
                  );
                }),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 4,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      color: CustomColors.warnabiru,
                    ),
                    child: const Icon(
                      Icons.edit,
                      color: CustomColors.warnaputih,
                    ),
                  )),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.light
                ? CustomColors.warnaputih
                : CustomColors.darkmode2,
            borderRadius: BorderRadius.circular(10),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withOpacity(0.1),
            //     spreadRadius: 5,
            //     blurRadius: 4,
            //     offset: Offset(0, 0), // changes position of shadow
            //   ),
            // ],
          ),
          child: Column(
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 375),
              childAnimationBuilder: (widget) => ScaleAnimation(
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyEntryField(
                  "NIK Pasien",
                  maxLength: 16,
                  controller: controller.nikPasienController,
                  keyboardType: TextInputType.number,
                  readonly: true,
                ),
                MyEntryField(
                  "Nama Lengkap",
                  controller: controller.namaController,
                  keyboardType: TextInputType.name,
                ),
                MyEntryField(
                  "Alamat Email",
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                MyEntryField(
                  "Nomer Ponsel",
                  maxLength: 13,
                  controller: controller.noTelpController,
                  keyboardType: TextInputType.phone,
                ),
                MyCalender(
                  "Tanggal Lahir",
                  controller: controller.tglLhrController,
                ),
                MyEntryField(
                  "Tempat Lahir",
                  controller: controller.tempatLhrController,
                ),
                MyEntryField(
                  "Alamat",
                  controller: controller.alamatController,
                ),
                _myDropDown(
                  "Jenis Kelamin",
                  items: controller.gender,
                  selectedItem: controller.selectedItemGender,
                  controller: controller.jenisKelaminController,
                ),
                MyEntryField(
                  "Alergi",
                  controller: controller.alergiController,
                ),
                _myDropDown(
                  "Golongan Darah",
                  items: controller.golDar,
                  selectedItem: controller.selectedItemGolDar,
                  controller: controller.golDarahController,
                ),
                const SizedBox(
                  height: 20,
                ),
                _submitButton(),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 60,
        ),
      ],
    );
  }

  Widget _submitButton() {
    final controller = Get.put(EditProfileController());
    return InkWell(
      onTap: () async {
        if (controller.fileImage.value.isNotEmpty) {
          await API.editFotoPasien(
            noKtp: controller.dataPasien.value.noKtp ?? '',
            fotoProfile: controller.fotoController.text,
          );
        }
        final editPasien = await API.editPasienLama(
          noKtp: controller.nikPasienController.text,
          namaPasien: controller.namaController.text,
          noHP: controller.noTelpController.text,
          email: controller.emailController.text,
          umurPasien:
              controller.umur(controller.tglLhrController.text).toString(),
          golDarah: controller.golDarahController.text,
          tanggalLahir: controller.tglLhrController.text,
          tempatLahir: controller.tempatLhrController.text,
          gender: controller.jenisKelaminController.text,
          alergi: controller.alergiController.text,
          alamat: controller.alamatController.text,
        );
        if (editPasien.code == 200) {
          final getData = await API.getDataPasien(
              noKtp: controller.nikPasienController.text);
          print(getData.toJson());
          Get.offNamed(Routes.RUBAH_PASSWORD);
        }

        print(editPasien);
      },
      child: Container(
        width: 300,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: CustomColors.warnaputih,
                  offset: Offset(2, 1),
                  blurRadius: 1,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  CustomColors.warnabiru,
                  CustomColors.warnabiru
                ])),
        child: Text(
          'Simpan',
          style: GoogleFonts.nunito(
              fontSize: 20,
              color: CustomColors.warnaputih,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _myDropDown(
    String title, {
    required TextEditingController controller,
    Dropdowns? selectedItem,
    required List<Dropdowns> items,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
                GoogleFonts.nunito(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          MyDropDown1(
            items: items,
            labelText: title,
            controller: controller,
            selectedItem: selectedItem,
          ),
        ],
      ),
    );
  }
}

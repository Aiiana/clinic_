import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lesson/core/config/app_colors.dart';
import 'package:flutter_lesson/core/config/app_consts.dart';
import 'package:flutter_lesson/core/config/app_fonts.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? name;
  String? sureName;
  String? phone;
  File? image;
  File? file;

  Future<void> getDataFromStorage() async {
    const storage = FlutterSecureStorage();
    name = await storage.read(key: AppConsts.name);
    sureName = await storage.read(key: AppConsts.sureName);
    phone = await storage.read(key: AppConsts.phone);

    print('$name $sureName $phone asdasd');

    setState(() {});
  }

  void _openFile() async {
FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);

if (result != null) {
   List<File> files = result.paths.map((path) => File(path!)).toList();


  // print(file.name);
  // print(file.bytes);
  // print(file.size);
  // print(file.extension);
  // print(file.path);
} else {
  // User canceled the picker
}
  }

  List<Widget> tabs = [
    Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(40),
              child: Image.asset(
                "assets/images/pngs/clipboard_1f4cb.png",
                width: 105.0,
                height: 105.0,
              ),
            ),
            Text(
              "У вас пока нет добавленных результатов \n                              анализов",
              style: AppFonts.w400s17.copyWith(color: AppColors.grey),
            ),
          ],
        ),
      ),
    ),
    Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(40),
            child: Image.asset(
              "assets/images/pngs/243e4682b4ca04ced0235e7a90f21cc4.png",
              width: 105.0,
              height: 105.0,
            ),
          ),
          Text(
            "У вас пока нет добавленных диагнозов",
            style: AppFonts.w400s17.copyWith(color: AppColors.grey),
          ),
        ],
      ),
    ),
    Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(40),
            child: Image.asset(
              "assets/images/pngs/b5f7ba8b8d799d6cc703d0e6e7007be9.png",
              width: 105.0,
              height: 105.0,
            ),
          ),
          Text(
            "У вас пока нет добавленных диагнозов",
            style: AppFonts.w400s17.copyWith(color: AppColors.grey),
          ),
        ],
      ),
    ),
  ];

  int currentIdex = 0;
  @override
  void initState() {
    getDataFromStorage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Мой профиль',
            style: TextStyle(
              fontSize: 34,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.start,
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.settings,
                size: 24,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ],
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1.0),
            child: Divider(
              color: Colors.grey,
              height: 1.0,
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.blue,
                      child: image != null
                          ? ClipOval(
                              child: Image.file(
                                image!,
                                fit: BoxFit.cover,
                                width: 100,
                                height: 100,
                              ),
                            )
                          : Text(
                              '${name?.isNotEmpty == true ? name![0] : ''} ${sureName?.isNotEmpty == true ? sureName![0] : ''}',
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: CircleAvatar(
                        radius: 16,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () async {
                            final ImagePicker imagePicker = ImagePicker();
                            final pickedImage = await imagePicker.pickImage(
                              source: ImageSource.gallery,
                            );

                            try {
                              image = File(pickedImage!.path);
                              setState(() {});
                            } catch (e) {}
                          },
                          icon: const Icon(
                            Icons.camera,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text('$name $sureName'),
              Text('${phone ?? ''}'),
              DefaultTabController(
                initialIndex: 0,
                length: 3,
                child: TabBar(
                  onTap: (value) {
                    currentIdex = value;
                    setState(() {});
                  },
                  tabs: [
                    Tab(
                      icon: Image.asset(
                          "assets/images/pngs/icons8-пипетка-24.png",
                          color: AppColors.blue),
                      child: Text(
                        'Анализы',
                        style: AppFonts.w400s15.copyWith(color: AppColors.blue),
                      ),
                    ),
                    Tab(
                      icon: const Icon(Icons.book_online_rounded,
                          color: AppColors.blue),
                      child: Text(
                        'Диагнозы',
                        style: AppFonts.w400s15.copyWith(color: AppColors.blue),
                      ),
                    ),
                    Tab(
                      icon: const Icon(Icons.comment, color: AppColors.blue),
                      child: Text(
                        'Рекомендации',
                        style: AppFonts.w400s15.copyWith(color: AppColors.blue),
                      ),
                    ),
                  ],
                ),
              ),
              tabs[currentIdex],
             
              TextButton(
                  onPressed: () {
                    _openFile();
                  },
                  child: Center(
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left:100),
                          child: Icon(
                            Icons.file_download,
                            color: AppColors.blue2,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Добавить документ',
                          style: AppFonts.w400s15.copyWith(color: AppColors.blue2),
                        ),
                      ],
                    ),
                  ),
                
              ),
            ],
          ),
        ));
  }
}

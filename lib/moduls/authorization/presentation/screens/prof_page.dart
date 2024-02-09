import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lesson/core/config/app_colors.dart';
import 'package:flutter_lesson/core/config/app_consts.dart';
import 'package:flutter_lesson/core/config/app_fonts.dart';
import 'package:flutter_lesson/core/config/routes/app_router.dart';
import 'package:flutter_lesson/moduls/authorization/presentation/screens/info_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

@RoutePage()
class ProfPage extends StatelessWidget {
  const ProfPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controllerName = TextEditingController();
    final TextEditingController controllerSureName = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 11, left: 60),
          child: Text(
            "Создание профиля",
            style: AppFonts.w600s17.copyWith(color: AppColors.black),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(top: 11),
          child: IconButton(
            icon: Icon(
              Icons.clear,
              color: AppColors.iconClose.withOpacity(0.54),
            ),
            onPressed: () {
              context.router.push(const LoginRoute());
            },
          ),
        ),
      ),
      body: Column(
        children: [
      ProfileButton(
            text: "Имя",
            hintText: "Введите ваше имя",
          ),
          const SizedBox(
            height: 32,
          ),
     ProfileButton(
            text: "Фамилия",
            hintText: "Введите вашу фамилию",
          ),
          const SizedBox(
            height: 120,
          ),
          AppButton(
              onPressed: () async {
               
                const storage = FlutterSecureStorage();
                await storage.write(
                  
                  key: AppConsts.name,
                  value: controllerName.text,
                );
                await storage.write(
                  key: AppConsts.sureName,
                  value: controllerSureName.text,
                );
                 context.router.push(const ProfileRoute());
              },
              text: "Далее")
        ],
      ),
    );
  }
}

class ProfileButton extends StatelessWidget {
 ProfileButton({super.key, required this.text, required this.hintText});
  final String text;
  final String hintText;
  final TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 34, left: 31),
          child: Text(
            text,
            style: AppFonts.w400s15.copyWith(color: AppColors.grey),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12, left: 31, right: 31),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppFonts.w400s17.copyWith(
                color: AppColors.lightGrey,
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.grey),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.grey),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

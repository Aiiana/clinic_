import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lesson/core/config/app_colors.dart';
import 'package:flutter_lesson/core/config/app_consts.dart';
import 'package:flutter_lesson/core/config/app_fonts.dart';
import 'package:flutter_lesson/core/config/routes/app_router.dart';

import 'package:flutter_lesson/moduls/authorization/presentation/screens/info_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    int code = 0;
    final TextEditingController controller = TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Divider(),
          ),
          centerTitle: true,
          elevation: 3,
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.only(top: 11),
            child: Center(
              child: Text("Вход",
                  style: AppFonts.w600s17.copyWith(color: AppColors.black)),
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.close,
              color: AppColors.iconClose.withOpacity(0.54),
            ),
            onPressed: () {
              
              context.router.pop();
            },
          ),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 15, left: 20, right: 253),
              child: Text(
                "Войти",
                style: AppFonts.w700s34,
                selectionColor: AppColors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 49, left: 31, right: 55),
              child: TextField(
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  MaskTextInputFormatter(mask: " ### ## ## ##")
                ],
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.grey,
                      width: 2,
                    ),
                  ),
                  prefix: Text(
                    "0",
                  ),
                  hintText: "___ __ __ __",
                  labelText: "Номер телефона",
                  labelStyle: AppFonts.w400s15,
                  helperText:
                      "На указанный вами номер придет \nоднократное СМС-сообщение с кодом \nподтверждения.",
                  helperStyle: AppFonts.w400s15,
                ),
              ),
            ),
            const SizedBox(
              height: 108,
            ),
            AppButton(
              onPressed: () async {
                const storage = FlutterSecureStorage();
                await storage.write(
                    key: AppConsts.phone, value: controller.text);
                print("${await storage.read(key: AppConsts.phone)} ");

                code = Random().nextInt(8999) + 1000;

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(code.toString()),
                  ),
                );
                context.router.push(
                  CodeRoute(code: code),
                );
              },
              text: 'Далее',
            ),
          ],
        ),
      ),
    );
  }
}

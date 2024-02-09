import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lesson/core/config/app_colors.dart';
import 'package:flutter_lesson/core/config/app_fonts.dart';
import 'package:flutter_lesson/core/config/routes/app_router.dart';
import 'package:flutter_lesson/moduls/authorization/presentation/screens/info_page.dart';

@RoutePage()
class CodePage extends StatefulWidget {
  const CodePage({super.key, required this.code});

  final int code;

  @override
  State<CodePage> createState() => _CodePageState();
}

class _CodePageState extends State<CodePage> {
  TextEditingController controller = TextEditingController();
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.only(top: 11, left: 44),
            child: Text(
              "Подтверждение номера",
              style: AppFonts.w600s17.copyWith(color: AppColors.black),
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.blue2,
            ),
            onPressed: () {
              context.router.push(
                const LoginRoute() as PageRouteInfo,
              );
            },
          ),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Text(
                "Введите код из смс",
                style: AppFonts.w500s22.copyWith(color: AppColors.grey),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 40, right: 45, bottom: 14, top: 143),
                child: TextField(
                  focusNode: FocusNode(),
                  obscureText: true,
                  maxLength: 4,
                  controller: controller,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    errorText: errorText,
                    prefixText: "Код",
                    prefixStyle:
                        AppFonts.w600s18.copyWith(color: AppColors.grey),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.grey,
                        width: 2,
                      ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.grey),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.grey),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            "assets/Ellipse 6.jpg", // Замените на ваш путь к изображению
                            width: 35,
                            height: 35,
                          ),
                          IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              controller.clear();
                            },
                            color: AppColors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(AppColors.blue3),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: const Text(
                  'Получить код повторно',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.blue3,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: "SF Pro Text"),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              AppButton(
                  onPressed: () {
                    if (controller.text == '${widget.code}') {
                      context.router.push(
                        const ProfRoute(),
                      );
                    } else {
                      errorText = 'error';
                      setState(() {});
                    }
                  },
                  text: "Далее")
            ],
          ),
        ),
      ),
    );
  }
}

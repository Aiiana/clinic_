import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lesson/core/config/app_colors.dart';
import 'package:flutter_lesson/core/config/app_consts.dart';
import 'package:flutter_lesson/core/config/app_fonts.dart';
import 'package:flutter_lesson/core/config/routes/app_router.dart';

import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<InfoPageDataModel> data = [
      InfoPageDataModel(
        image: "assets/images/pngs/hospital_1f3e5.png",
        text: "Записывайтесь на прием к самым лучшим\nспециалистам",
      ),
         InfoPageDataModel(
        image: "assets/images/pngs/clipboard_1f4cb.png",
        text: "Сохраняйте результаты ваших анализов,\nдиагнозы и рекомендации от врачей в \nсобственную библиотеку",
      ),   
      InfoPageDataModel(
        image: "assets/images/pngs/speech-balloon_1f4ac (1).png",
        text: "Просматривайте отзывы о врачах и \nдополняйте собственными комментариями",
      ),  
       InfoPageDataModel(
        image: "assets/images/pngs/bellhop-bell_1f6ce.png",
        text: "Получайте уведомления о \nприеме или о поступивших сообщениях",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.only(top: 11, left: 149, right: 100),
          child: Text(
            "Профиль",
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 19,
          right: 19,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {
                context.router.push(
                  const LoginRoute(),
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 18, left: 19, bottom: 25),
                child: Text(
                  "Зачем нужен профиль?",
                  style: TextStyle(
                    fontSize: 22,
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 25,
            ),
           Column(children: data.map((e) => InfoPageText(model: e,)).toList(),),
            AppButton(onPressed: () async { 
               context.router.push(
                const LoginRoute(),

               );
               final SharedPreferences prefs =
               await SharedPreferences.getInstance();
               await prefs.setBool(
               AppConsts.isFirstEnter, false,
               );
             },
             text:"Войти"

            ),
          ],
        ),
      ),
    );
  }
}


class InfoPageDataModel {
  InfoPageDataModel({required this.image, required this.text});
  final String text;
  final String image;
}

class InfoPageText extends StatelessWidget {
  const InfoPageText({
    super.key,
    required this.model,
  });
  final  InfoPageDataModel model;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 13, bottom: 30),
          child: Image.asset(
            model.image,
            width: 32,
            height: 32,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Text(
            model.text,
            style: AppFonts.w400s15,
          ),
        ),
      ],
    );
  }
}


class AppButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  const AppButton({
    super.key,
    required this.onPressed,
    required this.text,
  });
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 121,
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            AppColors.blue,
          ),
        ),
        child: const Text(
          "Далее",
          style: AppFonts.w600s18,
          selectionColor: AppColors.white,
      ),
    );
  }
}


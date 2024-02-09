import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lesson/core/config/app_colors.dart';
import 'package:flutter_lesson/core/config/app_fonts.dart';
import 'package:flutter_lesson/moduls/home_page/feature/doctors/data/doctors_data.dart';

@RoutePage()
class DoctorsScreen extends StatefulWidget {
  const DoctorsScreen({super.key});

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  String selctedDoctor = '';
  List<Doctors> doctorsData = DoctorsData.data;
  List<Doctors> data = [];
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(
              'Доктора',
              style: AppFonts.w700s34.copyWith(color: AppColors.black),
            ),
           
          ],

        ),
        
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
     
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    
                    controller: controller,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      prefixStyle: TextStyle(
                        color:  Color.fromARGB(255, 119, 117, 117)
                      ),
                      hintText: 'Поиск врача',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15,),),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 211, 212, 211),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15,),),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 211, 212, 211),
                        ),
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 211, 212, 211),
                    ),
                    
                  ),
                ),
                TextButton(
                  onPressed: () {
                    controller.clear();
                  },
                  child: const Text("очистить",
                  style: TextStyle(color: Color.fromARGB(255, 119, 117, 117)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 36,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: DoctorsData.categories.length,
              itemBuilder: (context, index) => DoctorsPageChip(
                onTap: () {
                  selctedDoctor = DoctorsData.categories[index];
                  data = [];
                  for (var i in doctorsData) {
                    if (i.category == selctedDoctor) {
                      data.add(i);
                    }
                  }
                  setState(() {});
                },
                title: DoctorsData.categories[index],
                isSelected: selctedDoctor == DoctorsData.categories[index],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                          data[index].image,
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Column(
                        children: [
                          Text(data[index].category),
                          Text(data[index].name,),
                        ],
                      ),
                      const SizedBox(width:80,),
                      Column(
                        children: [
                          const Icon(
                            Icons.star,
                          ),
                          Text(
                            data[index].rate,
                          ),
                        ],
                      ),
                      const SizedBox(width: 20,),
                      Column(
                        children: [
                          const Icon(
                            Icons.comment,
                          ),
                          Text(
                            data[index].comments.length.toString(),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DoctorsPageChip extends StatelessWidget {
  const DoctorsPageChip({
    super.key,
    this.isSelected = true,
    required this.onTap,
    required this.title,
  });

  final bool isSelected;
  final Function() onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 10,
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Colors.white,
            borderRadius: BorderRadius.circular(
              4,
            ),
            border: Border.all(
              color: Colors.black,
            ),
          ),
          height: 34,
          width: 109,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

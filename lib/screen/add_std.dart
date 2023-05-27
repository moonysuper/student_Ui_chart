import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:testa/controller/cubitapp_cubit.dart';
import 'package:testa/core/com.dart';
import 'package:testa/screen/show_std.dart';

class AddStd extends StatelessWidget {
  AddStd({Key? key}) : super(key: key);
  final nameController = TextEditingController();
  final numController = TextEditingController();
  final ageController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "اضافة طالب",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, .2),
                            blurRadius: 20.0,
                            offset: Offset(0, 10))
                      ]),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[100]!))),
                        child: TextFormField(
                          textDirection: TextDirection.rtl,
                          keyboardType: TextInputType.number,
                          controller: nameController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "اسم الطالب",
                              hintStyle: TextStyle(color: Colors.grey[400])),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          textDirection: TextDirection.rtl,
                          keyboardType: TextInputType.number,
                          controller: numController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "رقم الطالب",
                              hintStyle: TextStyle(color: Colors.grey[400])),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          textDirection: TextDirection.rtl,
                          controller: ageController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "العمر",
                              hintStyle: TextStyle(color: Colors.grey[400])),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          textDirection: TextDirection.rtl,
                          keyboardType: TextInputType.number,
                          controller: passwordController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "الرقم السري",
                              hintStyle: TextStyle(color: Colors.grey[400])),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    AppCubit.get(context).insertData(
                        name: nameController.text,
                        num: int.parse(numController.text),
                        age: int.parse(ageController.text),
                        password: passwordController.text).then((value) {
                      toastFlutter(
                          msg: "تمت اضافة الطالب بنجاح", color: Colors.green);
                      // AppCubit.get(context).reset();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
                        return ShowSTD();
                      }));
                    });



                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(colors: [
                          Color.fromRGBO(143, 148, 251, 1),
                          Color.fromRGBO(143, 148, 251, .6),
                        ])),
                    child: const Center(
                      child: Text(
                        "اضافة",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

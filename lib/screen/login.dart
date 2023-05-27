import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:testa/controller/cubitapp_cubit.dart';
import 'package:testa/core/com.dart';
import 'package:testa/screen/show_std.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
    final numController = TextEditingController();
    final passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
        body: Center(
          child: SingleChildScrollView(
      child: Column(
          children: [
            const Text(
              "واجهة تسجيل الطلاب",
              style: TextStyle(
                color: Colors.black,
                fontSize: 35,
              ),
            ),
            Column(
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
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
                                      bottom: BorderSide(
                                          color: Colors.grey[100]!))),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: numController,

                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "رقم الطالب",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: passController,
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "الرقم السري",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () async {
                          bool auth = await AppCubit.get(context).login(numController.text, passController.text);
                        if(auth)
                          {
                            Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: ShowSTD()));
                          }else{
                          toastFlutter(msg: "الرقم او كلمة المرور خطا", color: Colors.red);
                        }
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
                              "دخول",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
      ),
    ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:testa/controller/cubitapp_cubit.dart';
import 'package:testa/controller/cubitapp_state.dart';
import 'package:testa/screen/add_std.dart';
import 'package:testa/screen/data_show.dart';
import 'package:testa/screen/login.dart';

class ShowSTD extends StatelessWidget {
  const ShowSTD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var data = AppCubit.get(context).data;
    return Scaffold(
      appBar: AppBar(

        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    8.0), // Set your desired border radius value
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRight,
                      child: LoginScreen()),(route) => false,
                );
              },
              color: Colors.red,
              child: Text(
                "تسجيل خروج",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    8.0), // Set your desired border radius value
              ),
              onPressed: () {
                AppCubit.get(context).drawModelAge().then((value) {
                  Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        child:  DataShow()),
                  );
                }  );

              },
              color: Colors.green,
              child: Icon(Icons.data_usage,color: Colors.white,)
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.separated(

              itemBuilder: (context, index) {
                return BlocBuilder<AppCubit, AppState>(
                  builder: (context, state) {
                    return Dismissible(
                      onDismissed: (DismissDirection ind){
                        AppCubit.get(context).deleteDatabase(id: AppCubit.get(context).data[index]["id"]);
                        AppCubit.get(context).reset();
                      },
                      key: Key(AppCubit.get(context).data[index].toString()),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.lightBlueAccent,
                            radius: 45,
                            child: Center(
                              child: Text(
                                "${AppCubit.get(context).data[index]["name"].toString().substring(0, 1)}",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(AppCubit.get(context)
                                  .data[index]["name"]
                                  .toString()),
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "رقم الطالب : ${AppCubit.get(context).data[index]["num"]}"),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                      "عمر الطالب : ${AppCubit.get(context).data[index]["age"]}",
                                      style: TextStyle(color: Colors.grey)),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (context, index) => Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
              itemCount: AppCubit.get(context).data.length),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              PageTransition(type: PageTransitionType.fade, child: AddStd()));
        },
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

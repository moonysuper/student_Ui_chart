
import '../model/agemodel.dart';
import '../model/pieModel.dart';
import 'cubitapp_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';


class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);
  Database? database;
  void createDatabase() {
    openDatabase("deta.db", version: 1, onCreate: (database, version) async {
      await database
          .execute(
          "Create table std (id INTEGER PRIMARY KEY ,name TEXT,num TEXT,password TEXT,age INTEGER )")
          .then((value) {
        print("database created successfully");
      }).catchError((ex) {
        print("Some error founded ${ex.toString()}");
      });
    }, onOpen: (database) {
      getdata(database);
      print("database is opended");
    }).then((value) {
      database = value;
      emit(AppCreateDataBaseState());
    });
  }

  Future<bool> login(String num, String password) async {
    Database? dbClient = await database;
    List<Map<String, dynamic>> result = await dbClient!.rawQuery('''
    SELECT * FROM std
    WHERE num = ? AND password = ?
  ''', [num, password]);

    return result.isNotEmpty;
  }


  Future insertData({
    required String name,
    required int num,
    required String password,
    required int age,
  }) async {
    database!.transaction((txn) {
      return txn
          .rawInsert(
          "insert into std (name,num,password,age) values ('$name','$num','$password','$age')")
          .then((value) {
        print("$value record successfully");
        emit(AppInsertDataBaseState());

        getdata(database);
      }).catchError((error) {
        print("you have Error : $error");
      });


    });
  }


  List<Map> data = [];
  bool isLoaded = false;
Future<void> clear()async{
  data.clear();
  isLoaded = true;
  emit(NewState());

}
reset()async{
 await clear();

 await getdata(database);
}

  Future<void> getdata(database)async {
    print("getted");
    isLoaded = true;
    emit(AppGetDataBaseLoadingState());

    data = [];
 var result =   await database.rawQuery("select * from std");
    //   value.forEach((element) {
    //     data.add(element);
    //
    // });
    data.addAll(result);

    print(data.toString());
    print(data.length);

    isLoaded = false;
    emit(NewState());

  }

  List<AgeModel> ageModels = [];
  List<ChartData> pieModels = [];

  Future drawModelAge()async {
    ageModels.clear();
    pieModels.clear();

    for (final result in data) {
      final name = result['name'] as String;
      final age = result['age'] as int;
      final ageModel = AgeModel(name, age);
      ageModels.add(ageModel);

    }
    for (final result2 in data) {
      final name = result2['name'] as String;
      final age = double.parse(result2['num'] as String);
      final ageModel = ChartData(name, age);
      pieModels.add(ageModel);

    }
  }

  void updateDatabase({
    required String status,
    required int id,
  }) {
    database!.rawUpdate('UPDATE std SET status = ? WHERE id = ?',
        ['$status', id]).then((value) {
      emit(AppUpdateDataBaseState());
      getdata(database);
    });
  }

  void deleteDatabase({
    required int id,
  }) {
    database!.rawDelete('DELETE FROM std WHERE id = ?', [id]).then((value) {
      // getdata(database);
      emit(AppDeleteDataBaseState());



    });
  }
}

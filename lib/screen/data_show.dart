import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:testa/controller/cubitapp_cubit.dart';
import 'package:testa/controller/cubitapp_state.dart';

import '../model/agemodel.dart';
import '../model/pieModel.dart';

class DataShow extends StatelessWidget {
  DataShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = AppCubit.get(context).data;
    return Scaffold(
      appBar: AppBar(

      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              const TabBar(
                tabs: [
                  Tab(text: 'ارقام الطلاب'),
                  Tab(text: 'اعمار الطلاب'),
                ],
              ),
              BlocBuilder<AppCubit, AppState>(
                builder: (context, state) {
                  return ConditionalBuilder(
                    condition: AppCubit.get(context).ageModels.isNotEmpty,
                    builder: (context) {
                      return Expanded(
                        child: TabBarView(
                          children: [
                            Center(
                              child: SfCircularChart(
                                title: ChartTitle(text: "Hello"),
                                series: <CircularSeries>[

                                  PieSeries<ChartData, String>(
                                    dataSource: AppCubit.get(context).pieModels,
                                    xValueMapper: (ChartData sales, _) => sales.name,
                                    yValueMapper: (ChartData sales, _) => sales.deg,
                                    dataLabelSettings: const DataLabelSettings(isVisible: true)
                                  ),
                                ],
                              ),
                            ),
                            Center(
                                child: Container(
                                    child: SfCartesianChart(
                                        primaryXAxis: CategoryAxis(),
                                        // Chart title
                                        title: ChartTitle(
                                            text: "مخطط اعمار الطلاب"),
                                        // Enable legend
                                        // legend: Legend(isVisible: true),
                                        // Enable tooltip
                                        //tooltipBehavior: tooltipBehavior,

                                        series: <LineSeries<AgeModel, String>>[
                                  LineSeries<AgeModel, String>(
                                      dataSource:
                                          AppCubit.get(context).ageModels,
                                      xValueMapper: (AgeModel sales, _) =>
                                          sales.name,
                                      yValueMapper: (AgeModel sales, _) =>
                                          sales.age,
                                      // Enable data label
                                      dataLabelSettings:
                                          const DataLabelSettings(
                                              isVisible: true))
                                ]))),
                          ],
                        ),
                      );
                    },
                    fallback: (context) => Platform.isAndroid
                        ? const CircularProgressIndicator()
                        : const CupertinoActivityIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}



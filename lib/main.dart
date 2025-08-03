import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:periodic_table/core/constants/app_colors.dart';
import 'package:periodic_table/core/constants/app_text.dart';
import 'package:periodic_table/data/datasources/api_service.dart';
import 'package:periodic_table/data/repository/remote_data_source_implemantation.dart';
import 'package:periodic_table/presentation/screens/bloc/hover_effect_bloc.dart';
import 'package:periodic_table/presentation/screens/bloc/periodic_table_bloc.dart';
import 'package:periodic_table/presentation/screens/bloc/periodic_table_event.dart';
import 'package:periodic_table/presentation/screens/bloc/periodic_table_state.dart';
import 'package:periodic_table/presentation/screens/data_shows.dart/landscape.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      title: AppText.periodicDemo,
      // ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<PeriodicTableBloc>(
            create: (context) =>
                PeriodicTableBloc(RemoteDataSourceImplemantation(ApiService()))
                  ..add(PeriodicTableLoadEvent()),
          ),
          BlocProvider(create: (context) => HoverBloc()),
        ],
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocBuilder<PeriodicTableBloc, PeriodicTableState>(
        builder: (context, state) {
          if (state is PeriodicTableInitialState) {
            return Text(AppText.fetchData);
          }
          if (state is PeriodicTableLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is PeriodicTableErrorState) {
            return Text(state.error);
          }
          if (state is PeriodicTableSuccessState) {
            return LandScapeMode(
              periodicTableElements: state.periodicTableModel.elements,
            );
          } else {
            return Text(AppText.nothingText);
          }
        },
      ),
    );
  }
}

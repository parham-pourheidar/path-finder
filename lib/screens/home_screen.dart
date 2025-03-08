import 'package:flutter/material.dart';
import 'package:path_finder/blocs/tile/tile_bloc.dart';
import 'package:path_finder/screens/mission_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 15, 20, 1),
      appBar: AppBar(
        title: Text(
          'Path Finder',
          style: TextStyle(
              color: Colors.white70, fontSize: 24, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(18, 15, 20, 1),
      ),
      body: Center(
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            missionWidget(context: context, rows: 4, columns: 4, text: 'Easy'),
            missionWidget(
                context: context, rows: 6, columns: 6, text: 'Medium'),
            missionWidget(context: context, rows: 8, columns: 8, text: 'Hard'),
            missionWidget(
                context: context, rows: 11, columns: 11, text: 'Very Hard'),
            missionWidget(
                context: context, rows: 15, columns: 15, text: 'Extreme'),
          ],
        ),
      ),
    );
  }

  Widget missionWidget(
      {required BuildContext context,
      required int rows,
      required int columns,
      required String text}) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(25)),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => TileBloc(rows: rows, columns: columns),
            child: MissionScreen(
              rowAmount: rows,
              columnAmount: columns,
            ),
          ),
        ));
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.085,
        width: MediaQuery.of(context).size.width * 0.75,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            border: Border.all(color: Color.fromRGBO(140, 40, 40, 0.7)),
            color: Color.fromRGBO(38, 33, 41, 1)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: Color.fromRGBO(140, 40, 40, 1),
                fontSize: 22,
                fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_finder/blocs/tile/tile_bloc.dart';
import 'package:path_finder/screens/win_screen.dart';
import 'package:path_finder/screens/lose_screen.dart';
import 'package:just_audio/just_audio.dart';

class MissionScreen extends StatelessWidget {
  final int rowAmount;
  final int columnAmount;
  const MissionScreen(
      {required this.rowAmount, required this.columnAmount, super.key});

  @override
  Widget build(BuildContext context) {
    double mediaSize = MediaQuery.of(context).size.width;
    double tileSize = (mediaSize * 0.95) / columnAmount;
    return Scaffold(
        appBar: AppBar(
          leading: BlocBuilder<TileBloc, TileState>(
            builder: (context, state) {
              if (state is PlayingState) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${3 - state.wrongSelections} / 3 ',
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    Icon(
                      Icons.heart_broken,
                      color: Colors.redAccent,
                      size: 32,
                    )
                  ],
                );
              }
              return SizedBox();
            },
          ),
          leadingWidth: 100,
          backgroundColor: Color.fromRGBO(18, 15, 20, 1),
        ),
        backgroundColor: Color.fromRGBO(18, 15, 20, 1),
        body: Column(
            spacing: 25,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocListener<TileBloc, TileState>(
                listener: (context, state) async {
                  final player = AudioPlayer();
                  if (state is WinState) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => WinScreen()));
                    await player.setAsset('assets/sounds/correct.mp3');
                    await player.play();
                  } else if (state is LoseState) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => LoseScreen()));
                    await player.setAsset('assets/sounds/wrong.mp3');
                    await player.play();
                  }
                },
                child: SizedBox(),
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: mediaSize * 0.0016,
                  children: List.generate(rowAmount, (int columnIndex) {
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: mediaSize * 0.0016,
                        children: List.generate(columnAmount, (int rowIndex) {
                          int id = (rowIndex + (columnIndex * columnAmount));
                          return BlocSelector<TileBloc, TileState, Color>(
                            selector: (state) {
                              return context
                                  .read<TileBloc>()
                                  .determineColor(id);
                            },
                            builder: (context, color) {
                              return Container(
                                decoration: BoxDecoration(
                                    color: color,
                                    border: Border.all(color: Colors.black)),
                                width: tileSize,
                                height: tileSize,
                                child: InkWell(
                                  onTap: () async {
                                    if (!BlocProvider.of<TileBloc>(context)
                                        .isCorrectTile(id)) {
                                      HapticFeedback.heavyImpact();
                                    } else {
                                      HapticFeedback.lightImpact();
                                    }
                                    BlocProvider.of<TileBloc>(context)
                                        .add(SelectTile(id));
                                  },
                                  child: SizedBox(),
                                ),
                              );
                            },
                          );
                        }));
                  })),
              BlocBuilder<TileBloc, TileState>(
                builder: (context, state) {
                  if (state is PreviewState) {
                    return SizedBox(
                      height: 45,
                      child: InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        onTap: () {
                          BlocProvider.of<TileBloc>(context).add(StartGame());
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.55,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              border: Border.all(color: Colors.white70),
                              color: Color.fromRGBO(38, 33, 41, 1)),
                          child: Center(
                            child: Text(
                              'Start',
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return SizedBox(
                    height: 45,
                  );
                },
              )
            ],
          ),
        );
  }
}

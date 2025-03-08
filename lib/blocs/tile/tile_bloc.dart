import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'tile_event.dart';
part 'tile_state.dart';

class TileBloc extends Bloc<TileEvent, TileState> {
  List<int> predefinedTiles;
  List<int> selectedTiles = [];
  int wrongSelections = 0;
  final int rows;
  final int columns;
  TileBloc({required this.rows, required this.columns})
      : predefinedTiles = _generatePath(rows, columns),
        super(PreviewState()) {
    on<StartGame>((event, emit) {
      emit(PlayingState([], 0));
    });

    on<SelectTile>((event, emit) {
      selectedTiles.add(event.id);

      if (!predefinedTiles.contains(event.id)) {
        wrongSelections++;
      }
      if (wrongSelections >= 3) {
        emit(LoseState());
        return;
      }
      if (selectedTiles.toSet().containsAll(predefinedTiles)) {
        emit(WinState());
        return;
      }

      emit(PlayingState(selectedTiles, wrongSelections));
    });
  }

  static List<int> _generatePath(int rows, int columns) {
    Random random = Random();

    int startCol = random.nextInt(columns);
    int startTile = startCol;

    List<int> path = [startTile];

    int currentRow = 0;
    int currentCol = startCol;

    while (currentRow < rows - 1) {
      List<int> possibleMoves = [];

      if (currentRow < rows - 1) possibleMoves.add(columns);
      if (currentCol > 0) possibleMoves.add(-1);
      if (currentCol < columns - 1) possibleMoves.add(1);

      possibleMoves.removeWhere((move) => path.contains(path.last + move));

      if (possibleMoves.isEmpty) break;

      int move = possibleMoves[random.nextInt(possibleMoves.length)];
      int newTile = path.last + move;

      currentRow = newTile ~/ columns;
      currentCol = newTile % columns;

      path.add(newTile);
    }

    return path;
  }

  bool isCorrectTile(int id) {
    return predefinedTiles.contains(id);
  }

  Color determineColor(int id) {
    if (state is PreviewState && predefinedTiles.contains(id)) {
      return Colors.green;
    }

    if (state is PlayingState) {
      if (selectedTiles.contains(id) && predefinedTiles.contains(id)) {
        return Colors.blue;
      } else if (selectedTiles.contains(id)) {
        return Colors.red;
      }
    }
    return Colors.grey;
  }
}

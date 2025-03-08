part of 'tile_bloc.dart';

@immutable
sealed class TileState {}

class PreviewState extends TileState {}

class PlayingState extends TileState {
  final List<int> selectedTiles;
  final int wrongSelections;

  PlayingState(this.selectedTiles, this.wrongSelections);
}

class WinState extends TileState {}

class LoseState extends TileState {}

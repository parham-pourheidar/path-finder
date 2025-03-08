part of 'tile_bloc.dart';

@immutable
sealed class TileEvent {}

class SelectTile extends TileEvent {
  final int id;

  SelectTile(this.id);
}

class ShowPreview extends TileEvent {}

class StartGame extends TileEvent {}

class CheckWinCondition extends TileEvent {}

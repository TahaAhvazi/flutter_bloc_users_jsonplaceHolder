import 'package:bloc/bloc.dart';
import 'package:bloc_usersjson/services/albumServices.dart';
import 'package:equatable/equatable.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final getAlbums _albums;
  AlbumBloc(this._albums) : super(AlbumLoadingState()) {
    on<FetchAlbumEvent>((event, emit) async {
      AlbumLoadingState();
      final myAlbums = await _albums.getFetchedAlbums();
      emit(
        AlbumLoadedState(albums: myAlbums),
      );
    });
  }
}

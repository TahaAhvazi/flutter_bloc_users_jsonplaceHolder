// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'album_bloc.dart';

abstract class AlbumState extends Equatable {
  const AlbumState();

  @override
  List<Object> get props => [];
}

class AlbumLoadingState extends AlbumState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AlbumLoadedState extends AlbumState {
  @override
  final List<Albums> albums;
  const AlbumLoadedState({
    required this.albums,
  });
  List<Object> get props => [albums];
}

import 'package:bloc_usersjson/albums/bloc/album_bloc.dart';
import 'package:bloc_usersjson/services/albumServices.dart';
import 'package:bloc_usersjson/widgets/usersItemList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumPage extends StatelessWidget {
  const AlbumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AlbumBloc>(
          create: (context) =>
              AlbumBloc(RepositoryProvider.of<getAlbums>(context))
                ..add(
                  FetchAlbumEvent(),
                ),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Users Data'),
          centerTitle: true,
        ),
        body: BlocBuilder<AlbumBloc, AlbumState>(
          builder: (context, state) {
            if (state is AlbumLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is AlbumLoadedState) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return AlbumListItem(albums: state.albums[index]);
                },
                itemCount: state.albums.length,
              );
            }
            return const Center(
              child: Text('AN UNKNOWN ERROR OCCURED'),
            );
          },
        ),
      ),
    );
  }
}

import 'package:bloc_usersjson/services/albumServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AlbumListItem extends StatelessWidget {
  const AlbumListItem({Key? key, required this.albums}) : super(key: key);
  final Albums albums;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(albums.title),
        Text(albums.id.toString()),
        Text(albums.userId.toString()),
      ],
    );
  }
}

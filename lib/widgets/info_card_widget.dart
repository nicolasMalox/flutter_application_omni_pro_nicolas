import 'package:flutter/material.dart';
import '../models/album.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key, required this.currentAlbum}) : super(key: key);
  final Album currentAlbum;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.network(
              currentAlbum.thumbnailUrl!,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 100,
            height: 70,
            child: Text(
              currentAlbum.title!,
              softWrap: true,
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }
}

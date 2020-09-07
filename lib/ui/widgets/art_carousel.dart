import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:artcarousel/data/model/art_model.dart';
import 'package:artcarousel/data/model/user_model.dart';

class ArtCarousel extends StatefulWidget {
  final bool fetchingArts;
  final List<Art> arts;
  final User user;

  ArtCarousel({
    @required this.fetchingArts,
    @required this.arts,
    @required this.user,
  });

  @override
  _ArtCarouselState createState() => _ArtCarouselState();
}

class _ArtCarouselState extends State<ArtCarousel> {
  @override
  Widget build(BuildContext context) {
    // TODO: your code goes here feel free to edit everything in art_carousel.dart
    //    return Center(
    //        child: Text(
    //      "Your code goes here",
    //      style: Theme.of(context).textTheme.headline6,
    //    ));
    return ListView(
      scrollDirection: Axis.horizontal,
      children: widget.arts.map(_generateArtCard).toList(),
    );
  }

  Widget _generateArtCard(Art e) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              children: [
                Text(e.title),
                Text(e.subtitle),
              ],
            ),
            Text(e.price.toString()),
          ],
        ),
        SizedBox(height: 16),
        Container(
          height: 300,
          width: 200,
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: CachedNetworkImage(
              imageUrl: e.imageUrl,
              imageBuilder: (context, imageProvider) {
                return Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  )),
                );
              },
              placeholder: (context, url) => Align(
                alignment: Alignment.bottomCenter,
                child: Container(child: LinearProgressIndicator()),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        )
      ],
    );
  }
}

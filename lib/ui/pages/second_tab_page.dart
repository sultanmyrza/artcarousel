import 'package:flutter/material.dart';
import 'package:artcarousel/data/model/art_model.dart';
import 'package:artcarousel/data/model/user_model.dart';
import 'package:artcarousel/data/repository/art_repository.dart';
import 'package:artcarousel/ui/widgets/art_carousel.dart';

class SecondTabPage extends StatefulWidget {
  @override
  _SecondTabPageState createState() => _SecondTabPageState();
}

class _SecondTabPageState extends State<SecondTabPage>
    with AutomaticKeepAliveClientMixin<SecondTabPage> {
  bool _fetchingArts = false;
  List<Art> _arts = [];
  ArtRepository _artRepository = ArtRepository();

  User _user = User(uid: "12345", email: "example.com", username: "example");

  @override
  void initState() {
    super.initState();
    _fetchArts();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ArtCarousel(
      fetchingArts: _fetchingArts,
      arts: _arts,
      user: _user,
    );
  }

  @override
  bool get wantKeepAlive => true;

  Future<void> _fetchArts() async {
    try {
      setState(() => _fetchingArts = true);

      var data = await _artRepository.fetchArts();

      setState(() => _arts = data);
    } catch (_) {
      // TODO: do nothing
    } finally {
      setState(() => _fetchingArts = false);
    }
  }
}

import 'package:artcarousel/data/model/art_model.dart';

class ArtRepository {
  Future<List<Art>> fetchArts() async {
    await Future.delayed(Duration(seconds: 3));

    return testData;
  }

  Future<List<Art>> fetchArtsOnlyOne() async {
    // This is intentional in case we got list of card with one item
    await Future.delayed(Duration(seconds: 3));

    return [testData[0]];
  }
}

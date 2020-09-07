# artcarousel flutter ui challenge

This is [inspired ui](https://imgur.com/PfJzMg8) but you only need to implement [this](https://imgur.com/SeYAvHj) part.
This final result should look something like [this](https://imgur.com/9t10ypy)

## Getting Started

This project is a starting point for a flutter ui challenge.
It is container for your code. Starting app look like [this](https://imgur.com/rjmIvEG)

A few resources to get you started: Just use them as knowledgebase (hint)
- https://www.youtube.com/watch?v=5KbiU-93-yU&t=2s
- https://pub.dev/packages/stacked_card_carousel
- https://www.youtube.com/watch?v=A8dvbFby-s0

# Starting widget
your starting widget will be `lib/ui/widgets/art_carousel.dart`
```
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
    return Center(
        child: Text(
      "Your code goes here",
      style: Theme.of(context).textTheme.headline6,
    ));
  }
}
```

# Specifications
 - [ ] scrolling cards are not lagging during scroll
 - [ ] Carousel works for 1 card `if (arts.length == 1) => card must be centered`


    you can use method `fetchArtsOnlyOne()` from `lib/data/repository/art_repository.dart`
 - [ ] Carousel should work for 2, 3, 4 cards (same as [ design](https://imgur.com/SeYAvHj))
 - [ ] Carousel should work for 15 cards max (without lagging)


 		you can use method `fetchArts()` from `lib/data/repository/art_repository.dart`
 - [ ] Card size must be adjustable (at least for these [screens](https://www.paintcodeapp.com/news/ultimate-guide-to-iphone-resolutions))
 Cards will have specific dimension for each screen
 The point is if I want for
 iPhone SE card `heigh = h1, width = w1` and for
 iPhone X card `height = h2, width = w2` we should do somehting like
 ```
 @override
  Widget build(BuildContext context) {
    if (isIphoneSE(MediaQuery.of(context).size)) => Card(height = h1, width = w1)
    if (isiPhoneX(MediaQuery.of(context).size)) => Card(height = h2, width = w2)
}
 ```
 I prepared `lib/constans.dart` which look like
 ```
class IPhoneSe {
  // 5, 5s, 5c, SE
  static Size size = Size(320, 568);
}

class IPhone8 {
  //  6, 6s, 7, 8
  static Size size = Size(375, 667);
}

class IPhone8Plus {
  //  6+, 6s+, 7+, 8+
  static Size size = Size(414, 736);
}

class IPhone11Pro {
  // 11 Pro, X, Xs
  static Size size = Size(375, 812);
}
...
 ```

 - [ ] Important cards must be tappable (at least `onTap: () => print("$cardIndex")`)

 # For tappable thing
If you use `PageView.builder` on top of `Stack` than you need to reed this ["**allow all gestures detections to go through**"](https://stackoverflow.com/questions/57466767/how-to-make-a-gesturedetector-capture-taps-inside-a-stack)
Example code can be found [here](https://github.com/grihlo/stacked_card_carousel/blob/master/lib/stacked_card_carousel.dart)

### Feel free to email sultanmyrza@gmail.com
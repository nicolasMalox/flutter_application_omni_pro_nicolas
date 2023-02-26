import 'package:flutter/material.dart';
import '../models/album.dart';
import '../service/album_service.dart';

/// Our class [HomeProvider] extends from [ChangeNotifier] which makes it
/// possible to communicate state changes with the other widgets in our tree.
///
class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    /// the class constructor is created and calls the first
    /// method that loads the data from the server
    loadAlbums();
  }

  AlbumService albumservice = AlbumService();

  /// [albumservice] points to the service that fetches
  /// the data from the server
  ///

  final loading = ValueNotifier(false);

  /// [loading] Creates a [ChangeNotifier] that wraps this value.
  ///

  List<Album> albums = [];
  List<Album> totalalbums = [];

  ///
  ///

  int startIndex = 0;
  int endIndex = 15;

  /// when the service responds to us with the complete list of data we
  /// use [startIndex] to start taking the first 10 elements from the
  /// #0 to #10, [endIndex] the extent to which it will take elements,
  /// this symbolizes 1 page
  ///

  /// We use this method to keep the "loading" icon for a
  /// comfortable time for the user
  Future _delay() {
    return Future.delayed(const Duration(seconds: 2));
  }

  /// This is the method that brings all the data from the server and
  /// filters taking the first 10 elements that symbolize 1 page and
  /// send them to be displayed on the screen
  ///

  /// We use [loading] in "true" to indicate when the data request
  /// to the server begins and in "false" when it is completed
  ///

  /// When we have the filtered list we assign those values ​​to
  /// [albums] to be displayed on the screen
  ///
  /// NOTE: Since it is the first time that the server is called,
  /// [totalalbums] is used to fetch all the elements JUST ONCE.

  void loadAlbums() async {
    loading.value = true;
    notifyListeners();

    await _delay();
    totalalbums = await albumservice.getListalbums();
    albums = totalalbums.sublist(startIndex, endIndex);
    endIndex += 10;

    loading.value = false;
    notifyListeners();
  }

  /// The next time this method is
  /// called, 10 new elements will be taken and so on until
  /// all the data is displayed from the server
  ///

  ///

  void loadNewPage() async {
    loading.value = true;
    notifyListeners();

    await _delay();
    albums = totalalbums.sublist(startIndex, endIndex);
    endIndex += 10;

    loading.value = false;
    notifyListeners();
  }
}

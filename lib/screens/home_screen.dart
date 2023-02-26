import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/home_provider.dart';
import '../widgets/info_card_widget.dart';
import '../widgets/loading_widget.dart';

/// We need a stateful widget since we will be tracking state data and
/// need the ability to track state changes
///
class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

/// The main Widget of our UI
///
class _MyHomeScreenState extends State<MyHomeScreen> {
  /// This is the controller that we will use to track data changes
  ///
  late final ScrollController _scrollController = ScrollController();

  late double maxScroll;
  late double currentPosition;

  /// We use this method to know when the user has reached the end of the page.
  /// [maxScroll] represents the maximum scroll possible
  /// [currentPosition] represents the position of the user
  ///

  late HomeProvider state;

  /// the variable [state] points to provider, something needed
  /// to request the new data load
  ///

  void _onScroll() {
    maxScroll = _scrollController.position.maxScrollExtent;
    currentPosition = _scrollController.position.pixels;

    if (currentPosition == maxScroll) {
      state = Provider.of<HomeProvider>(context, listen: false);
      state.loadNewPage();
    }
  }

  /// When the current position is equal to the maximum, it means that we
  /// have reached the end of the page, so provider is called and
  /// the state.loadObjects() function is loaded.
  ///
  @override

  /// Initialize our state scroll controller which will track the changes
  ///
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override

  /// We need to dispose of the Controller and all the streams when the Widget
  /// is being disposed of.
  ///
  void dispose() {
    /// this triggers our dispose code in the controller
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Omni.Pro'),
      ),
      body: Consumer<HomeProvider>(
        builder: (context, value, child) {
          return Stack(
            children: [
              ListView.builder(
                controller: _scrollController,
                itemCount: value.albums.length,
                itemBuilder: (BuildContext context, int index) {
                  return InfoCard(
                    currentAlbum: value.albums[index],
                  );
                },
              ),
              value.loading.value ? const LoadingWidget() : Container()
            ],
          );
        },
      ),
    );
  }
}

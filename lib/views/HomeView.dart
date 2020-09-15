import 'package:flutter/material.dart';
import 'package:marvel_flutter/widgets/SlideItem.dart';
import 'package:marvel_flutter/models/MarvelModel.dart';
import 'package:marvel_flutter/viewModels/ComicViewModel.dart';
import 'package:marvel_flutter/views/GradientContainer.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();

    onStart();
  }

  Future<void> onStart() async {
    // any init in here ?
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ComicViewModel>(
      builder: (context, model, child) => Scaffold(
        body: GradientContainer(
            color: Colors.blueGrey, child: buildHomeView(context)),
      ),
    );
  }

  Widget buildHomeView(BuildContext context) {
    return Consumer<ComicViewModel>(
        builder: (context, comicViewModel, child) => Container(
            height: MediaQuery.of(context).size.height,
            child: RefreshIndicator(
                color: Colors.transparent,
                backgroundColor: Colors.transparent,
                onRefresh: () => refreshComicList(comicViewModel, context),
                child: ListView(
                  children: <Widget>[
                    comicViewModel.comicList == null ||
                            comicViewModel.isRequestPending
                        ? buildBusyIndicator()
                        : comicViewModel.isRequestError
                            ? buildReqError()
                            : buildComicList(context),
                  ],
                ))));
  }

  Widget buildBusyIndicator() {
    return Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.white)),
          SizedBox(
            height: 20,
          ),
          Text('Please Wait...',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ))
        ]));
  }

  Widget buildReqError() {
    return Center(
        child: Text('Ooops...something went wrong',
            style: TextStyle(fontSize: 21, color: Colors.white)));
  }

  buildComicList(BuildContext context) {
    return Consumer<ComicViewModel>(
        builder: (context, comicViewModel, child) => Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: comicViewModel.comicList == null
                    ? 0
                    : comicViewModel.comicList.length,
                itemBuilder: (BuildContext context, int index) {
                  Results comic = comicViewModel.comicList[index];

                  return Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: SlideItem(
                      img: comic.thumbnail.path +
                          "/portrait_fantastic." +
                          comic.thumbnail.extension,
                      title: comic.title,
                      creators: comic.creators.items.length > 0
                          ? comic.creators.items[0].name
                          : "",
                      price: comic.prices[0].price,
                    ),
                  );
                },
              ),
            ));
  }

  Future<void> refreshComicList(
      ComicViewModel comicViewModel, BuildContext context) {
    return comicViewModel.getLatestComics();
  }
}

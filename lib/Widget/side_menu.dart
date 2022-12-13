
import 'package:flutter/material.dart';
import 'package:spotify_window/data/data.dart';


class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: double.infinity,
        width: 280,
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                    child: Image.asset('assets/spotify_logo.png', height: 55.0, filterQuality: FilterQuality.high,)),
              ],
            ),
            _SideMenuIconTap(
              title: 'Home',
              iconData: Icons.home,
              onTap: (){},
            ),
            _SideMenuIconTap(
              title: 'Search',
              iconData: Icons.search,
              onTap: (){},
            ),
            _SideMenuIconTap(
              title: 'Radio',
              iconData: Icons.radio,
              onTap: (){},
            ),
            const SizedBox(height: 5,),
            _LibraryPlayLists(),
          ],
        )
      );
  }
}

class _SideMenuIconTap extends StatelessWidget {
  const _SideMenuIconTap({
    Key? key, required this.iconData, required this.title, required this.onTap,
  }) : super(key: key);

  final IconData iconData;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: Theme.of(context).iconTheme.color,
        size: 28,
      ),
      title: Text(title, style: Theme.of(context).textTheme.bodyText2,),
      onTap: onTap,
    );
  }
}

class _LibraryPlayLists extends StatefulWidget {
  const _LibraryPlayLists({Key? key}) : super(key: key);

  @override
  State<_LibraryPlayLists> createState() => _LibraryPlayListsState();
}

class _LibraryPlayListsState extends State<_LibraryPlayLists> {
  ScrollController? _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Scrollbar(
        thumbVisibility: true,
        trackVisibility: true,
        controller: _scrollController,
        child: ListView(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          physics: const ClampingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 16),
                  child: Text(
                    'Your library',
                    style: Theme.of(context).textTheme.headline4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...yourLibrary.map(
                  (e) => ListTile(
                    dense: true,
                    title: Text(
                      e,
                      style: Theme.of(context).textTheme.bodyText2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: (){},
                  ),
                ).toList(),
              ],
            ),
            const SizedBox(height: 5,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 16),
                  child: Text(
                    'Play List',
                    style: Theme.of(context).textTheme.headline4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...playlists.map(
                      (e) => ListTile(
                    dense: true,
                    title: Text(
                      e,
                      style: Theme.of(context).textTheme.bodyText2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: (){},
                  ),
                ).toList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

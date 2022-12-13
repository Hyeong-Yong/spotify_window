
import 'package:flutter/material.dart';

import '../Widget/playlist_header.dart';
import '../Widget/tracks_list.dart';
import '../data/data.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({Key? key, required this.playlist}) : super(key: key);

  final Playlist playlist;


  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {

  ScrollController? _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ScrollController _scrollController = new ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController?.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: 140,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  customBorder: const CircleBorder(),
                  onTap: (){},
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(color: Colors.black26,
                    shape: BoxShape.circle),
                    child: const Icon(Icons.chevron_left, size: 28,),
                  ),
                ),
                const SizedBox(width: 16.0,),
                InkWell(
                  customBorder: const CircleBorder(),
                  onTap: (){},
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(color: Colors.black26,
                        shape: BoxShape.circle),
                    child: const Icon(Icons.chevron_right, size: 28,),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton.icon(
              style: TextButton.styleFrom(foregroundColor: Theme.of(context).iconTheme.color,),
                onPressed: () {},
                icon: const Icon(Icons.account_circle_outlined, size: 30.0,),
                label: const Text("marcus Ng"),
            ),
            const SizedBox(width: 8,),
            IconButton(
                padding: const EdgeInsets.only(),
                onPressed: (){}, icon: const Icon(Icons.keyboard_arrow_down, size: 30,)),
            const SizedBox(width: 20,)
          ],
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xFFAF1018),
                Theme.of(context).backgroundColor
              ],
              stops: const [0, 0.5],
            )
          ),
          child: Scrollbar(
            trackVisibility: true,
            thumbVisibility: true,
            controller: _scrollController,
            child: ListView(
              controller: _scrollController,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 60,
                ),
              children: [
                PlaylistHeader(playlist: widget.playlist),
                TracksList(tracks: widget.playlist.songs),

              ],
            ),

          ),
        ),
      ),
    );
  }
}

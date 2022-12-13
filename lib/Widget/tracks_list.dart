import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_window/data/data.dart';
import 'package:spotify_window/models/current_track_model.dart';

class TracksList extends StatelessWidget {
  const TracksList({Key? key, required this.tracks }) : super(key: key);
  final List<Song> tracks;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      dataRowHeight: 54,
        headingTextStyle: Theme.of(context).textTheme.overline!.copyWith(fontSize: 12),
        showCheckboxColumn: false,
        columns: const [
          DataColumn(label: Text('Title', style: TextStyle(color: Colors.white70)),),
          DataColumn(label: Text('ARTIST', style: TextStyle(color: Colors.white70)),),
          DataColumn(label: Text('ALBUM', style: TextStyle(color: Colors.white70)),),
          DataColumn(label: Icon(Icons.access_time)),
        ],
      rows: tracks.map((e) {
        final selected = context.watch<CurrentTrackModel>().selected?.id == e.id;
        final textStyle = selected ? TextStyle(color: Colors.amber) : TextStyle(color: Colors.white);
        return DataRow(cells: [
          DataCell(Text(e.title,
               style: textStyle)),
           DataCell(Text(e.artist,
               style: textStyle)),
           DataCell(Text(e.album,
               style: textStyle)),
           DataCell(Text(e.duration,
               style: textStyle)),
         ],
          selected: selected,
          onSelectChanged: (_) => context.read<CurrentTrackModel>().selectTrack(e),
        );
      }).toList(),
    );
  }
}

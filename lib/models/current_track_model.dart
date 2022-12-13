import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_window/data/data.dart';

class CurrentTrackModel extends ChangeNotifier{
  Song? selected;

  void selectTrack(Song track){
    selected = track;
    notifyListeners();
  }
}
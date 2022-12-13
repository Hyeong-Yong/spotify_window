
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_window/models/current_track_model.dart';

class CurrentTrack extends StatelessWidget {
  const CurrentTrack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84.0,
      width: double.infinity,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            _TrackInfo(),
            const Spacer(),
            _PlayerControls(),
            const Spacer(),
            if (MediaQuery.of(context).size.width > 800) _MoreControls(),
          ],
        ),
      ),
    );
  }
}



class _TrackInfo extends StatelessWidget {
  const _TrackInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    if(selected== null) return const SizedBox.shrink();
    return Row(
      children: [
        Image.asset('assets/lofigirl.jpg',
        height: 60,
            width: 60,
            fit: BoxFit.cover,),
        const SizedBox(width: 12,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(selected.title, style: Theme.of(context).textTheme.bodyText1,),
            const SizedBox(height: 4,),
            Text(selected.artist, style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.grey[300], fontSize: 12),)
          ],
        ),
        const SizedBox(width: 12,),
        IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border))
      ],
    );
  }
}

class _PlayerControls extends StatelessWidget {
  const _PlayerControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;

    return Column(children: [
      Row(
        children: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.shuffle, size: 20,), padding: const EdgeInsets.only(),),
          IconButton(onPressed: (){}, icon: const Icon(Icons.skip_previous, size: 20,), padding: const EdgeInsets.only(),),
          IconButton(onPressed: (){}, icon: const Icon(Icons.play_circle, size: 34,), padding: const EdgeInsets.only(),),
          IconButton(onPressed: (){}, icon: const Icon(Icons.skip_next, size: 20,), padding: const EdgeInsets.only(),),
          IconButton(onPressed: (){}, icon: const Icon(Icons.repeat, size: 20,), padding: const EdgeInsets.only(),),
        ],
      ),
      const SizedBox(height: 1,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('0:00', style: TextStyle(color: Colors.white70),),
          const SizedBox(width: 8,),
          Container(
            height: 3,
              width: MediaQuery.of(context).size.width*0.3,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(2.5),
            ),
          ),
          const SizedBox(width: 8,),
          Text(selected?.duration ?? '0:00', style: TextStyle(color: Colors.white70),)
        ],
      )
    ],);
  }
}


class _MoreControls extends StatelessWidget {
  const _MoreControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: (){}, icon: const Icon(Icons.devices_outlined, size: 20.0,)),
        Row(
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.volume_up_outlined)),
            Container(
              height: 5,
              width: 70,
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(2.5)),
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.fullscreen_exit_outlined))
          ],
        )
      ],
    );
  }
}

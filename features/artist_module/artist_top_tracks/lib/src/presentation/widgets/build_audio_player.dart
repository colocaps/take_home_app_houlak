// import 'package:core/core.dart';
// import 'package:flutter/material.dart';

// class BuildAudioPlayer extends StatelessWidget {
//   final AudioManager _audioManager;

//   const BuildAudioPlayer({
//     Key? key,
//     required AudioManager audioManager,
//   })  : _audioManager = audioManager,
//         super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Row(
//         children: [
//           ElevatedButton(
//             onPressed: () async => await _audioManager.pause(),
//             child: Icon(Icons.pause),
//           ),
//           ElevatedButton(
//             onPressed: () async => await _audioManager.play(),
//             child: Icon(Icons.play_arrow),
//           ),
//           ElevatedButton(
//             onPressed: () async => await _audioManager.stop(),
//             child: Icon(Icons.stop),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:core/src/abstractions/audio_manager.dart';
import 'package:just_audio/just_audio.dart';

class AudioManagerImpl implements AudioManager {
  final player = AudioPlayer();

  @override
  Future<void> pause() async {
    await player.pause();
  }

  @override
  Future<void> play() async {
    await player.play();
  }

  @override
  Future<void> setUrl(String url) async {
    await player.setUrl(url);
  }

  @override
  Future<void> stop() async {
    await player.stop();
  }
}

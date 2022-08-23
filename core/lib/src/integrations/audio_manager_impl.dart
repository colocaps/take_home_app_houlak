import 'package:core/src/abstractions/audio_manager.dart';
import 'package:just_audio/just_audio.dart';

class AudioManagerImpl implements AudioManager {
  Future<AudioPlayer> _audioPlayerInstance() async {
    final AudioPlayer player = AudioPlayer();
    return player;
  }

  @override
  Future<void> pause() async {
    AudioPlayer player = await _audioPlayerInstance();
    player.pause();
  }

  @override
  Future<void> play() async {
    AudioPlayer player = await _audioPlayerInstance();
    player.play();
  }

  @override
  Future<void> setUrl(String url) async {
    AudioPlayer player = await _audioPlayerInstance();
    player.setUrl(url);
  }

  @override
  Future<void> stop() async {
    AudioPlayer player = await _audioPlayerInstance();
    player.stop();
  }
}

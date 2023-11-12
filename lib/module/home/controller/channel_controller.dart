import 'package:chewie/chewie.dart';
import 'package:get/get.dart';

import 'package:tv_online/backend/repository/channel_repository.dart';
import 'package:tv_online/backend/response/channel_response.dart';
import 'package:video_player/video_player.dart';

class ChannelController extends GetxController {
  final int? index;
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;
  ChannelRepository channelRepository = ChannelRepository();
  ChannelResponse? channelResponse;

  ChannelController({this.index});

  Future<void> getChannel() async {
    channelResponse = await channelRepository.getChannels();
    update();
  }

  Future<void> loadVideo(int index) async {
    videoPlayerController = await VideoPlayerController.networkUrl(
        Uri.parse(channelResponse!.channelData![index].url ?? ''))
      ..initialize().then((value) {
        chewieController = ChewieController(
          videoPlayerController: videoPlayerController!,
          autoPlay: true,
          isLive: true,
        );
      });
    update();
  }


  @override
  void onInit() {
    getChannel();

    super.onInit();
  }
}

import 'package:get/get.dart';
import 'package:tv_online/backend/repository/channel_repository.dart';
import 'package:tv_online/backend/response/channel_response.dart';

class ChannelController extends GetxController {
  ChannelRepository channelRepository = ChannelRepository();
  ChannelResponse? channelResponse;

  Future<void> getChannel() async {
    channelResponse = await channelRepository.getChannels();
    update();
  }

  @override
  void onInit() {
    getChannel();
    super.onInit();
  }
}

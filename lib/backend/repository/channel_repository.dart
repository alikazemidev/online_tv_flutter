import 'package:dio/dio.dart';
import 'package:tv_online/backend/response/channel_response.dart';

class ChannelRepository {
  Future<ChannelResponse> getChannels() async {
    var res = await Dio().get('https://hitaldev.ir/channels');
    print(res.data['data']);
    return ChannelResponse.fromJson(res.data);
  }
}

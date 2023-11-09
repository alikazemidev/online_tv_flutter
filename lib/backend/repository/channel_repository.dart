import 'package:dio/dio.dart';

class ChannelRepository {
  Future<List<dynamic>> getChannels() async {
    var res = await Dio().get('https://hitaldev.ir/channels');
    return res.data['data'];
  }
}

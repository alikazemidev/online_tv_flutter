import 'package:tv_online/backend/model/channel.dart';

class ChannelResponse {
  List<Channel>? channelData;

  ChannelResponse({this.channelData});

  ChannelResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      channelData = <Channel>[];
      json['data'].forEach((v) {
        channelData!.add(new Channel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.channelData != null) {
      data['data'] = this.channelData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_online/module/home/controller/channel_controller.dart';

class TvScreen extends StatelessWidget {
  final int channelIndex;

  TvScreen({super.key, required this.channelIndex});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChannelController(index: channelIndex));
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 25),
            Image.asset(
              'assets/images/m_logo.png',
              height: 60,
            ),
            SizedBox(height: 10),
            Text(
              'تلویزیون اینترنتی من',
              style: TextStyle(
                color: Color(0xff00b4a7),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            controller.chewieController == null
                ? SizedBox(
                    height: 200,
                    child: Center(child: CircularProgressIndicator()))
                : SizedBox(
                    height: 200,
                    child: Chewie(controller: controller.chewieController!)),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    decoration: BoxDecoration(
                      color: Color(0xff00b4a7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'لیست شبکه های تلویزیون',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Image.network(
                        controller.channelResponse!.channelData![channelIndex]
                                .logo ??
                            '',
                        height: 70,
                      ),
                      Text(
                        controller.channelResponse!.channelData![channelIndex]
                                .name ??
                            '',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: controller.channelResponse!.channelData!.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TvScreen(
                            channelIndex: index,
                          ),
                        ),
                      );
                      controller.loadVideo(index);
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(colors: [
                          Colors.amber,
                          Colors.black,
                        ]),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network(
                              controller.channelResponse!.channelData![index]
                                      .logo ??
                                  '',
                              height: 40,
                            ),
                            Text(
                              controller.channelResponse!.channelData![index]
                                      .name ??
                                  '',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

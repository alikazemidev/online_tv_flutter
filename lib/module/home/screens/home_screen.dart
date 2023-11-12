import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_online/module/home/controller/channel_controller.dart';
import 'package:tv_online/module/home/screens/tv_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChannelController>(
        init: ChannelController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: controller.channelResponse == null
                ? Center(child: CircularProgressIndicator())
                : SafeArea(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.network(
                                'https://static.telewebion.com/promotionImages/35b118bb-cfea-492d-b36c-4c4af3fb17a4/default',
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                              // height: 40,
                              // width: 200,
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
                            SizedBox(height: 20),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 47, 47, 47),
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(12)),
                                ),
                                child: GridView.builder(
                                  itemCount: controller
                                      .channelResponse!.channelData!.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 5,
                                    crossAxisSpacing: 10,
                                    mainAxisExtent: 140,
                                  ),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.to(() => TvScreen(
                                              channelIndex: index,
                                            ));
                                        controller.loadVideo(index);
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Image.network(
                                              controller
                                                      .channelResponse!
                                                      .channelData![index]
                                                      .logo ??
                                                  '',
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            controller.channelResponse!
                                                    .channelData![index].name ??
                                                '',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
          );
        });
  }
}

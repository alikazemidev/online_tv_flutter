import 'package:flutter/material.dart';
import 'package:tv_online/backend/model/channel.dart';
import 'package:tv_online/backend/repository/channel_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Samim',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Channel> channels = [];
  @override
  void initState() {
    // channels = ChannelRepository().getChannels() as List<Channel>;
    print(channels);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
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
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
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
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(12)),
                  ),
                  child: GridView.builder(
                    itemCount: 5,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 140,
                    ),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Image.network(
                                'https://static.telewebion.com/channelsLogo/NzQyZGZmZmI2MTlkZmYxZTdkMzFjNmVlYzY3MzdmNTJkNzZmYTZkOGYxM2U5YjJmMjk2NGQyMDhmZWMyYjY2Yw/default'),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'شبکه ۵',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}

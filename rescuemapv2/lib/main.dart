import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:rescuemapv2/firebase_options.dart';
import 'package:rescuemapv2/pages/afterLogin/index.dart';
import 'package:rescuemapv2/pages/afterLogin/message.dart';
import 'package:rescuemapv2/pages/afterLogin/news_detail_screen.dart';
import 'package:rescuemapv2/pages/afterLogin/profile_screen.dart';
import 'package:rescuemapv2/pages/login_page.dart';
import 'package:rescuemapv2/pages/sign_up.dart';
import 'package:rescuemapv2/pallete/app_styles.dart';
import 'package:rescuemapv2/pallete/pallete.dart';
import 'package:rescuemapv2/pallete/size_config.dart';
// import 'package:rescuemapv2/pallete/app_styles.dart';
// import 'package:rescuemapv2/screen/himalayan.dart';
// import 'package:rescuemapv2/screen/index.dart';
// import 'package:rescuemapv2/screen/maps/bsf.dart';
// import 'package:rescuemapv2/screen/maps/cisf.dart';
// import 'package:rescuemapv2/screen/maps/crpf.dart';
// import 'package:rescuemapv2/screen/maps/dfs.dart';
// import 'package:rescuemapv2/screen/maps/ia.dart';
// import 'package:rescuemapv2/screen/maps/iaf.dart';
// import 'package:rescuemapv2/screen/maps/icg.dart';
// import 'package:rescuemapv2/screen/maps/in.dart';
// import 'package:rescuemapv2/screen/maps/ircs.dart';
// import 'package:rescuemapv2/screen/maps/itbp.dart';
// import 'package:rescuemapv2/screen/maps/ndma.dart';
// import 'package:rescuemapv2/screen/maps/ndrf.dart';
// import 'package:rescuemapv2/screen/maps/raf.dart';
// import 'package:rescuemapv2/screen/maps/sdrf.dart';
// import 'package:rescuemapv2/screen/maps/ssb.dart';
// import 'package:rescuemapv2/screen/news_detail_screen.dart';
// import 'package:rescuemapv2/pallete/pallete.dart';
// import 'package:rescuemapv2/screen/login_screen.dart';
// import 'package:rescuemapv2/pallete/size_config.dart';
// import 'package:rescuemapv2/screen/profile_screen.dart';
// import 'package:rescuemapv2/screen/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Pallete.backgroundColor,
      ),
      home: LoginPage(),
      routes: {
        '/home': (context) => const HomeMap(),
        // '/himalayan': (context) => const Himalayan(),
        '/news': (context) => const MyHomePage(),
        '/profile': (context) => const ProfileScreen(),

        '/message': (context) => const MessageBox(),
        '/news_detail': (context) => const NewsDetailScreen(),
        // '/login': (context) => const LoginScreen(),
        '/signup': (context) => SignUp(),
        // '/ndrf': (context) => const Ndrf(),
        // '/bsf': (context) => const Bsf(),
        // '/cisf': (context) => const Cisf(),
        // '/crpf': (context) => const Crpf(),
        // '/dfs': (context) => const Dfs(),
        // '/ia': (context) => const Ia(),
        // '/iaf': (context) => const Iaf(),
        // '/icg': (context) => const Icg(),
        // '/in': (context) => const In(),
        // '/ircs': (context) => const Ircs(),
        // '/itbp': (context) => const Itbp(),
        // '/ndma': (context) => const Ndma(),
        // '/raf': (context) => const Raf(),
        // '/sdrf': (context) => const Sdrf(),
        // '/ssb': (context) => const Ssb(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLighterWhite,
      body: const HomeScreen(),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Pallete.backgroundColor,
        selectedItemColor: Pallete.gradient3,
        unselectedItemColor: Pallete.whiteColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              icon: SvgPicture.asset('assets/home_unselected_icon.svg'),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/news');
                // Handle the button press for the second item
              },
              icon: SvgPicture.asset('assets/bookmark_selected_icon.svg'),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/message');
                // Handle the button press for the third item
              },
              icon: SvgPicture.asset('assets/notification_unselected_icon.svg'),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                // Handle the button press for the fourth item
                Navigator.pushNamed(context, '/profile');
              },
              icon: SvgPicture.asset('assets/profile_unselected_icon.svg'),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}

// ... Rest of your code remains the same

// ... Rest of your code remains the same

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        children: [
          Row(
            children: [
              const SizedBox(
                width: 0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'LIVE\nNEWS',
                    style: kPoppinsRegular200.copyWith(
                      fontSize: 70,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kBorderRadius),
              color: kWhite,
              boxShadow: [
                BoxShadow(
                  color: kDarkBlue.withOpacity(0.051),
                  offset: const Offset(0.0, 3.0),
                  blurRadius: 24.0,
                  spreadRadius: 0.0,
                )
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: kPoppinsRegular.copyWith(
                      color: kBlue,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 13,
                      ),
                      hintText: 'Search for article...',
                      border: kBorder,
                      errorBorder: kBorder,
                      disabledBorder: kBorder,
                      focusedBorder: kBorder,
                      focusedErrorBorder: kBorder,
                      hintStyle: kPoppinsRegular.copyWith(
                        color: kLightGrey,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Pallete.backgroundColor,
                    borderRadius: BorderRadius.circular(kBorderRadius),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/search_icon.svg',
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 14,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    right: 38,
                  ),
                  child: Text(
                    '#Emergency',
                    style: kPoppinsMedium.copyWith(
                      color: kGrey,
                      fontSize: 12,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 304,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(
                    right: 20,
                  ),
                  height: 304,
                  width: 255,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    color: const Color.fromARGB(255, 245, 245, 202),
                    boxShadow: [
                      BoxShadow(
                        color: kDarkBlue.withOpacity(0.051),
                        offset: const Offset(0.0, 3.0),
                        blurRadius: 24.0,
                        spreadRadius: 0.0,
                      )
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/himalayan');
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 164,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 246, 165),
                            borderRadius: BorderRadius.circular(kBorderRadius),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/news/1.png')),
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Flexible(
                          child: Text(
                            'UP set to establish disaster relief training centre: Yogi',
                            style: kPoppinsBold.copyWith(
                              fontSize: 20,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const SizedBox(
                                  width: 12,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'To address the ...',
                                      style: kPoppinsSemibold.copyWith(
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      'Sep 9, 2022',
                                      style: kPoppinsRegular.copyWith(
                                        color: kGrey,
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Container(
                              height: 38,
                              width: 38,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(kBorderRadius),
                                color: kLightWhite,
                              ),
                              child: SvgPicture.asset(
                                'assets/share_icon.svg',
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Trending',
                style: kPoppinsBold.copyWith(
                  fontSize: 24,
                ),
              ),
              Text(
                'View all',
                style: kPoppinsMedium.copyWith(
                  color: kBlue,
                  fontSize: 16,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 19,
          ),
          SizedBox(
            height: 88,
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(9),
                  margin: const EdgeInsets.only(
                    right: 20,
                  ),
                  width: 208,
                  height: 88,
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    boxShadow: [
                      BoxShadow(
                        color: kDarkBlue.withOpacity(0.051),
                        offset: const Offset(0.0, 3.0),
                        blurRadius: 24.0,
                        spreadRadius: 0.0,
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        padding: const EdgeInsets.all(26),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kBorderRadius),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/news/1.png')),
                        ),
                        child: SvgPicture.asset(
                          'assets/play_icon.svg',
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Top Trending Island in 2022',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: kPoppinsSemibold.copyWith(
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/eye_icon.svg',
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '40,999',
                                  style: kPoppinsMedium.copyWith(
                                    color: kGrey,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

Marker customMarker(BuildContext context, double latitude, double longitude,
    String assetImage, String linkopen) {
  return Marker(
    width: 40.0,
    height: 40.0,
    point: LatLng(latitude, longitude),
    builder: (ctx) => GestureDetector(
      onTap: () {
        // Call the onTapCallback function to handle the tap event
        Navigator.pushNamed(context, linkopen);
      },
      child: ClipOval(
        child: Image.asset(
          assetImage,
          width: 40.0,
          height: 40.0,
          fit: BoxFit.cover, // You can adjust the BoxFit as needed
        ),
      ),
    ),
  );
}

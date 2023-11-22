import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:rescuemapv2/components/my_textfield.dart';
import 'package:rescuemapv2/main.dart';
import 'package:rescuemapv2/pages/login_page.dart';
import 'package:rescuemapv2/pallete/app_styles.dart';
import 'package:rescuemapv2/pallete/pallete.dart';
import 'package:rescuemapv2/pallete/size_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor:
            const Color.fromARGB(255, 1, 28, 78), // Customize the app bar color
        scaffoldBackgroundColor: Colors.black, // Customize the background color
        hintColor:
            const Color.fromARGB(255, 51, 7, 133), // Customize button colors
      ),
      home: LoginPage(),
    );
  }
}

class HomeMap extends StatefulWidget {
  const HomeMap({Key? key}) : super(key: key);

  @override
  State<HomeMap> createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {
  final double initialLatitude = 28.689390;
  final double initialLongitude = 77.455924;
  final Location location = Location();
  LatLng currentLocation =
      const LatLng(28.689390, 77.455924); // Initial location
  bool locationEnabled = false; // Track whether location is enabled
  MapController mapController = MapController();

  @override
  void initState() {
    super.initState();
    // Start listening to location updates
    location.onLocationChanged.listen((LocationData currentLocationData) {
      setState(() {
        currentLocation = LatLng(
          currentLocationData.latitude ?? initialLatitude,
          currentLocationData.longitude ?? initialLongitude,
        );
        locationEnabled = true; // Location is enabled
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: MyTextField(
              controller: '',
              hintText: 'Username',
              obscureText: false,
            ),
          ),
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              center: currentLocation,
              zoom: 15,
              minZoom: 0,
              maxZoom: 18,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',
                additionalOptions: const {
                  'attribution':
                      'Tiles © Esri — Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community',
                },
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    width: 40.0,
                    height: 40.0,
                    point: currentLocation, // Use the current location here
                    builder: (ctx) => Container(
                      child: Image.asset(
                        'assets/admin.png', // Customize the marker's appearance
                      ),
                    ),
                  ),
                  customMarker(context, 28.687281887763252, 77.48248780211519,
                      'assets/rescue/ndrf.png', '/ndrf'),
                  customMarker(context, 28.633581868871577, 77.35315505769236,
                      'assets/rescue/icg.png', '/icg'),
                  customMarker(context, 28.59530343595403, 77.1857474007447,
                      'assets/rescue/sdrf.png', '/sdrf'),
                  customMarker(context, 28.553891890460783, 77.21242463288479,
                      'assets/rescue/ia.png', '/ia'),
                  customMarker(context, 28.603642745059975, 77.25427966044306,
                      'assets/rescue/iaf.png', '/iaf'),
                  customMarker(context, 28.57330025049865, 77.19133883413947,
                      'assets/rescue/in.png', '/in'),
                  customMarker(context, 28.566863616332128, 77.19985479227066,
                      'assets/rescue/ndma.png', '/ndma'),
                  customMarker(context, 28.63564552825202, 77.22482268860507,
                      'assets/rescue/cisf.png', '/cisf'),
                  customMarker(context, 28.51424951628681, 77.25111657230924,
                      'assets/rescue/bsf.png', '/bsf'),
                  customMarker(context, 28.743947574099842, 77.2494273871066,
                      'assets/rescue/raf.png', '/raf'),
                  customMarker(context, 28.570871360527466, 77.28283408653232,
                      'assets/rescue/ssb.png', '/ssb'),
                  customMarker(context, 28.914572562468162, 77.23878845665865,
                      'assets/rescue/itbp.png', '/itbp'),
                  customMarker(context, 28.636052490368517, 77.22389867241715,
                      'assets/rescue/dfs.png', '/dfs'),
                  customMarker(context, 28.628670885328603, 77.22017492030342,
                      'assets/rescue/ircs.png', '/ircs'),
                  customMarker(context, 28.651315506743536, 77.09501708860506,
                      'assets/rescue/crpf.png', '/crpf'),
                  customMarker(context, 28.651315506743536, 77.09501708860506,
                      'assets/rescue/crpf.png', '/crpf'),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: FloatingActionButton(
              onPressed: _getCurrentLocation,
              backgroundColor: locationEnabled ? Colors.blue : Colors.white,
              child: const Icon(Icons.my_location),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Pallete.backgroundColor,
        selectedItemColor: Pallete.gradient3,
        unselectedItemColor:
            Pallete.whiteColor, // Customize the unselected item color
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/home_selected_icon.svg'),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/news');
                // Handle navigation to the second screen
              },
              icon: SvgPicture.asset('assets/bookmark_unselected_icon.svg'),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/message');
                // Handle navigation to the third screen
              },
              icon: SvgPicture.asset('assets/notification_unselected_icon.svg'),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
                // Handle navigation to the fourth screen
              },
              icon: SvgPicture.asset('assets/profile_unselected_icon.svg'),
            ),
            label: '',
          ),
        ],
      ),
    );
  }

  void _getCurrentLocation() async {
    final LocationData locationData = await location.getLocation();
    if (locationData != null) {
      setState(() {
        currentLocation = LatLng(
          locationData.latitude ?? initialLatitude,
          locationData.longitude ?? initialLongitude,
        );
        locationEnabled = true; // Location is enabled
        mapController.move(
            currentLocation, 13); // Center map on current location
      });
    }
  }

  @override
  void dispose() {
    location.onLocationChanged.drain();
    super.dispose();
  }
}

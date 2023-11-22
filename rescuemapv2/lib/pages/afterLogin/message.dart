import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rescuemapv2/main.dart';
import 'package:rescuemapv2/pallete/app_styles.dart';
import 'package:rescuemapv2/pallete/pallete.dart';
import 'package:rescuemapv2/pallete/size_config.dart';

class MessageBox extends StatelessWidget {
  const MessageBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        backgroundColor: kLighterWhite,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Alerts!',
                                style: kPoppinsBold.copyWith(
                                    color: kDarkBlue,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 2.5,
                ),

                //task

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Message',
                      style: kPoppinsBold.copyWith(
                        color: kDarkBlue,
                        fontSize: SizeConfig.blockSizeHorizontal! * 4,
                      ),
                    ),
                    Text(
                      'View All',
                      style: kPoppinsMedium.copyWith(
                        color: kBlue,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 2.5,
                ),
                SizedBox(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        margin: EdgeInsets.only(
                          bottom: SizeConfig.blockSizeVertical! * 2.5,
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: kWhite,
                                borderRadius:
                                    BorderRadius.circular(kBorderRadius),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 24,
                                    spreadRadius: 0,
                                    offset: const Offset(0, 3),
                                    color: kDarkBlue.withOpacity(0.051),
                                  )
                                ],
                              ),
                              child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(kBorderRadius),
                                  child: Image.asset(
                                      'assets/message_default.png')),
                            ),
                            SizedBox(
                              width: SizeConfig.blockSizeVertical! * 2.5,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'News: Emergency Alert!',
                                    style: kPoppinsRegular.copyWith(
                                      color: kDarkBlue,
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal! * 2.5,
                                    ),
                                  ),
                                  SizedBox(
                                    height: SizeConfig.blockSizeVertical! * 1,
                                  ),
                                  Text(
                                    'Emergency Alert: Immediate Attention Required',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: kPoppinsSemibold.copyWith(
                                      color: kDarkBlue,
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal! * 3,
                                    ),
                                  ),
                                  SizedBox(
                                    height: SizeConfig.blockSizeVertical! * 1,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/calendar_icon.svg',
                                          ),
                                          SizedBox(
                                            width: SizeConfig
                                                    .blockSizeHorizontal! *
                                                1.5,
                                          ),
                                          Text(
                                            '16th May',
                                            style: kPoppinsRegular.copyWith(
                                              color: kGrey,
                                              fontSize: SizeConfig
                                                      .blockSizeHorizontal! *
                                                  3,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/time_icon.svg',
                                          ),
                                          SizedBox(
                                            width: SizeConfig
                                                    .blockSizeHorizontal! *
                                                1.5,
                                          ),
                                          Text(
                                            '09 : 32 pm',
                                            style: kPoppinsRegular.copyWith(
                                              color: kGrey,
                                              fontSize: SizeConfig
                                                      .blockSizeHorizontal! *
                                                  3,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
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
                icon: SvgPicture.asset('assets/bookmark_unselected_icon.svg'),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/message');
                  // Handle the button press for the third item
                },
                icon: SvgPicture.asset('assets/notification_selected_icon.svg'),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                  // Handle the button press for the fourth item
                },
                icon: SvgPicture.asset('assets/profile_unselected_icon.svg'),
              ),
              label: '',
            ),
          ],
        ));
  }
}

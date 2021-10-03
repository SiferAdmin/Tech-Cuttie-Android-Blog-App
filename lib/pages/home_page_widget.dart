import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tech_cuttie/pages/app_setting_widget.dart';
import 'package:tech_cuttie/pages/blogs_widget.dart';
import 'package:tech_cuttie/pages/more_widget.dart';
import 'package:tech_cuttie/pages/profile_widget.dart';
import 'package:tech_cuttie/pages/search_widget.dart';
import 'package:tech_cuttie/pages/welcome_widget.dart';

import 'login_sign_up_widget.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    SafeArea(
      child: ListView(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        children: [
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: Text(
              'Tech is just a click if you have the time',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                  // color: Color(0xFFEEEEEE),
                  ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      Text(
                        'Blog Categories',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      ),
                      Icon(
                        Icons.navigate_next_outlined,
                        color: Colors.black,
                        size: 24,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                  // color: Color(0xFFEEEEEE),
                  ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      Text(
                        'Recent Blogs',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      ),
                      Icon(
                        Icons.navigate_next_outlined,
                        color: Colors.black,
                        size: 24,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
    const BlogsWidget(),
    const SearchWidget(),
    const MoreWidget(),
  ];
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: true,
        title: const Text('Tech Cuttie'),
        actions: const [],
        centerTitle: false,
        elevation: 4,
      ),
      // backgroundColor:Color(0xFFF5F5F5),
      drawer: Drawer(
        elevation: 16,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
             const SizedBox(height: 40,),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileWidget()));
                },
                child: Container(
                  width: 120,
                  height: 120,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: CachedNetworkImage(imageUrl: 'https://picsum.photos/seed/835/600'),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Icon(
                    Icons.share_rounded,
                    color: Colors.black,
                    size: 24,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    child: Text(
                      'Share',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                      ),
                    ),
                  )
                ],
              ),
             const SizedBox(height: 5,),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Icon(
                    Icons.call,
                    color: Colors.black,
                    size: 24,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    child: Text(
                      'Call',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                      ),
                    ),
                  )
                ],
              ),const SizedBox(height: 5,),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Icon(
                    Icons.email_outlined,
                    color: Colors.black,
                    size: 24,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    child: Text(
                      'Email',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                      ),
                    ),
                  )
                ],
              ),const SizedBox(height: 5,),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginSignUpWidget()));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Icon(
                      Icons.account_circle,
                      color: Colors.black,
                      size: 24,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                      child: Text(
                        'User Account',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      ),
                    )
                  ],
                ),
              ),const SizedBox(height: 5,),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WelcomeWidget()));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Icon(
                      Icons.help_center_rounded,
                      color: Colors.black,
                      size: 24,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                      child: Text(
                        'Introduction',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      ),
                    )
                  ],
                ),
              ),const SizedBox(height: 5,),
              
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AppSettingWidget()));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Icon(
                      Icons.settings_sharp,
                      color: Colors.black,
                      size: 24,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                      child: Text(
                        'Settings',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      ),
                    )
                  ],
                ),
              ),
              
              const Spacer(),
              const Text(
                'App version 1.0',
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
              )
            ],
          ),
        ),
      ),
      body: _children[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex:
            _currentIndex, // this will be set when a new tab is tapped
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.ballot),
            label: 'Blogs',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search_sharp),
            label: 'Search',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.read_more_sharp),
            label: 'More',
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
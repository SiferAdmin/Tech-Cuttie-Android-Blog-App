import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tech_cuttie/pages/abbreviations.dart';
import 'package:tech_cuttie/pages/about_widget.dart';
// ignore: unused_import
import 'package:tech_cuttie/pages/affiliate.dart';
import 'package:tech_cuttie/pages/contact_widget.dart';
import 'package:tech_cuttie/pages/disclaimer_widget.dart';
import 'package:tech_cuttie/pages/faq.dart';
import 'package:tech_cuttie/pages/glossary_widget.dart';
import 'package:tech_cuttie/pages/login_sign_up_widget.dart';
import 'package:tech_cuttie/pages/privacy_widget.dart';
import 'package:tech_cuttie/pages/services_widget.dart';
import 'package:tech_cuttie/pages/terms_widget.dart';
import 'package:tech_cuttie/pages/tips_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreWidget extends StatefulWidget {
  const MoreWidget({Key? key}) : super(key: key);

  @override
  _MoreWidgetState createState() => _MoreWidgetState();
}

class _MoreWidgetState extends State<MoreWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  CollectionReference settings =
      FirebaseFirestore.instance.collection('Settings');
  int version = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Scrollbar(
          child: ListView(
            children: [
              Column(
                children: [
                  FutureBuilder(
                      future: settings.doc('config').get(),
                      builder: (BuildContext context,
                          AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return const Text("Something went wrong");
                        }
                        if (snapshot.hasData && !snapshot.data!.exists) {
                          return const Text('User not in database');
                        }
                        if (snapshot.connectionState == ConnectionState.done) {
                          Map<String, dynamic> data =
                              snapshot.data!.data() as Map<String, dynamic>;
                          // String appLogo = "${data['app_logo']}";
                          // String appName = "${data['app_name']}";
                          String appVersion = "${data['app_version']}";
                          String downloadLink = "${data['download_link']}";
                          // String downloadQr = "${data['download_qr']}";
                          int appVersio = int.parse(appVersion);
                          return Center(
                            child: version < appVersio
                                ? TextButton(
                                    onPressed: () {
                                      launch(downloadLink);
                                    },
                                    child: const Text(
                                        'App Update available!\nClick to Download New App'),
                                  )
                                : const SizedBox(),
                          );
                        }
                        return const SizedBox();
                      }),

                  TextButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const LoginSignUpWidget(),
                        ),
                      );
                    },
                    child: const Text('Sign Out'),
                  ),
                  Card(
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 20,
                              width: 20,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 15),
                                child: CircularProgressIndicator(
                                  value: downloadProgress.progress,
                                ),
                              ),
                            ),
                          ),
                          imageUrl:
                              'https://i2.wp.com/techcuttie.com/wp-content/uploads/2021/09/image-6.jpeg?w=310&ssl=1',
                          width: 90,
                          height: 90,
                          fit: BoxFit.contain,
                        ),
                      ),
                      title: const Text('Services'),
                      subtitle: const Text(
                          'Browse a variety of services which you can benefit as a Tech Cuttie user'),
                      isThreeLine: false,
                      onTap: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ServicesWidget()));
                      },
                    ),
                  ),
                  // Card(
                  //   child: ListTile(
                  //     leading: ClipRRect(
                  //       borderRadius: BorderRadius.circular(20),
                  //       child: CachedNetworkImage(
                  //         errorWidget: (context, url, error) =>
                  //             const Icon(Icons.error),
                  //         progressIndicatorBuilder:
                  //             (context, url, downloadProgress) => SizedBox(
                  //           height: 20,
                  //           width: 20,
                  //           child: Padding(
                  //             padding: const EdgeInsets.symmetric(
                  //                 horizontal: 30, vertical: 15),
                  //             child: CircularProgressIndicator(
                  //               value: downloadProgress.progress,
                  //             ),
                  //           ),
                  //         ),
                  //         imageUrl:
                  //             'https://i1.wp.com/techcuttie.com/wp-content/uploads/2021/10/image-1.jpeg?resize=269%2C187&ssl=1',
                  //         width: 90,
                  //         height: 90,
                  //         fit: BoxFit.contain,
                  //       ),
                  //     ),
                  //     title: const Text('Ask A Tech Question'),
                  //     subtitle: const Text(
                  //         'View commonly asked questions or ask any that you may have. '),
                  //     isThreeLine: false,
                  //     onTap: () async {
                  //       await Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => const Ask()));
                  //     },
                  //   ),
                  // ),

                  // Card(
                  //   clipBehavior: Clip.antiAliasWithSaveLayer,
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(40),
                  //   ),
                  //   child: ListTile(
                  //     leading: ClipRRect(
                  //       borderRadius: BorderRadius.circular(20),
                  //       child: CachedNetworkImage(
                  //         errorWidget: (context, url, error) =>
                  //             const Icon(Icons.error),
                  //         progressIndicatorBuilder:
                  //             (context, url, downloadProgress) => SizedBox(
                  //           height: 20,
                  //           width: 20,
                  //           child: Padding(
                  //             padding: const EdgeInsets.symmetric(
                  //                 horizontal: 30, vertical: 15),
                  //             child: CircularProgressIndicator(
                  //               value: downloadProgress.progress,
                  //             ),
                  //           ),
                  //         ),
                  //         imageUrl:
                  //             'https://i0.wp.com/techcuttie.com/wp-content/uploads/2021/10/image-2.jpeg?resize=301%2C167&ssl=1',
                  //         width: 90,
                  //         height: 90,
                  //         fit: BoxFit.contain,
                  //       ),
                  //     ),
                  //     title: const Text('Tech Cuttie Quizzes'),
                  //     subtitle: const Text(
                  //         'View available quizes and test yourself with any that youmay prefer.'),
                  //     isThreeLine: false,
                  //     onTap: () async {
                  //       await Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => const Quiz()));
                  //     },
                  //   ),
                  // ),
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => SizedBox(
                            height: 20,
                            width: 20,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              child: CircularProgressIndicator(
                                value: downloadProgress.progress,
                              ),
                            ),
                          ),
                          imageUrl:
                              'https://i0.wp.com/techcuttie.com/wp-content/uploads/2021/09/image-13.jpeg?resize=300%2C168&ssl=1',
                          width: 90,
                          height: 90,
                          fit: BoxFit.contain,
                        ),
                      ),
                      title: const Text('Tech Glossary'),
                      subtitle: const Text(
                          'Find the meaning to all tech terms and their applications. '),
                      isThreeLine: false,
                      onTap: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Glossary()));
                      },
                    ),
                  ),
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => SizedBox(
                            height: 20,
                            width: 20,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              child: CircularProgressIndicator(
                                value: downloadProgress.progress,
                              ),
                            ),
                          ),
                          imageUrl:
                              'https://i0.wp.com/techcuttie.com/wp-content/uploads/2021/10/image.jpeg?resize=300%2C168&ssl=1',
                          width: 90,
                          height: 90,
                          fit: BoxFit.contain,
                        ),
                      ),
                      title: const Text('Tech Abbreviations'),
                      subtitle: const Text(
                          'Find the full form of all the abbreviations that are relevant in the world of Tech.'),
                      isThreeLine: false,
                      onTap: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Abbreviations()));
                      },
                    ),
                  ),
                  // Card(
                  //   clipBehavior: Clip.antiAliasWithSaveLayer,
                  //                       shape: RoundedRectangleBorder(
                  //                         borderRadius: BorderRadius.circular(40),
                  //                       ),
                  //   child: ListTile(
                  //     leading: ClipRRect(
                  //       borderRadius: BorderRadius.circular(20),
                  //       child: CachedNetworkImage(
                  //         imageUrl:
                  //             'https://i0.wp.com/brightpropertymanagement.com/wp-content/uploads/2019/04/yelp-reviews-wordpress.png?w=740&ssl=1',
                  //         width: 70,
                  //         height:50,
                  //         fit: BoxFit.fill,
                  //       ),
                  //     ),
                  //     title: const Text('Our Reviews'),
                  //     subtitle: const Text(
                  //         'View a list of recent reviews that Tech Cuttie has got from it users.'),
                  //     isThreeLine: false,
                  //     onTap: () async {
                  //       await Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => const ReviewsWidget()));
                  //     },
                  //   ),
                  // ),
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => SizedBox(
                            height: 20,
                            width: 20,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              child: CircularProgressIndicator(
                                value: downloadProgress.progress,
                              ),
                            ),
                          ),
                          imageUrl:
                              'https://i0.wp.com/techcuttie.com/wp-content/uploads/2021/09/image.jpeg?w=1000&ssl=1',
                          width: 90,
                          height: 90,
                          fit: BoxFit.contain,
                        ),
                      ),
                      title: const Text('Frequently Asked Questions'),
                      subtitle: const Text(
                          'View commonly asked questions or ask any that you may have. '),
                      isThreeLine: false,
                      onTap: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FAQs()));
                      },
                    ),
                  ),
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => SizedBox(
                            height: 20,
                            width: 20,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              child: CircularProgressIndicator(
                                value: downloadProgress.progress,
                              ),
                            ),
                          ),
                          imageUrl:
                              'https://i1.wp.com/techcuttie.com/wp-content/uploads/2021/09/image-5.png?w=225&ssl=1',
                          width: 90,
                          height: 90,
                          fit: BoxFit.fill,
                        ),
                      ),
                      title: const Text('You can Tip Us or Donate here'),
                      subtitle: const Text(
                          'We appreciate any kind of encouragement you want to give us. '),
                      isThreeLine: false,
                      onTap: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Tips()));
                      },
                    ),
                  ),
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => SizedBox(
                            height: 20,
                            width: 20,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              child: CircularProgressIndicator(
                                value: downloadProgress.progress,
                              ),
                            ),
                          ),
                          imageUrl:
                              'https://i2.wp.com/techcuttie.com/wp-content/uploads/2021/09/image-7.jpeg?w=225&ssl=1',
                          width: 90,
                          height: 90,
                          fit: BoxFit.contain,
                        ),
                      ),
                      title: const Text('Terms And Conditions'),
                      subtitle: const Text(
                          'View the use terms and conditions agreement we abide by. '),
                      isThreeLine: false,
                      onTap: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Terms()));
                      },
                    ),
                  ),
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => SizedBox(
                            height: 20,
                            width: 20,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              child: CircularProgressIndicator(
                                value: downloadProgress.progress,
                              ),
                            ),
                          ),
                          imageUrl:
                              'https://i1.wp.com/techcuttie.com/wp-content/uploads/2021/09/image-17-edited.jpeg?resize=204%2C216&ssl=1',
                          width: 90,
                          height: 90,
                          fit: BoxFit.contain,
                        ),
                      ),
                      title: const Text('Disclaimer'),
                      subtitle: const Text('View our Disclaimer Notice here '),
                      isThreeLine: false,
                      onTap: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Disclaimer()));
                      },
                    ),
                  ),
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => SizedBox(
                            height: 20,
                            width: 20,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              child: CircularProgressIndicator(
                                value: downloadProgress.progress,
                              ),
                            ),
                          ),
                          imageUrl:
                              'https://i0.wp.com/techcuttie.com/wp-content/uploads/2021/09/image-8.jpeg?w=612&ssl=1',
                          width: 90,
                          height: 90,
                          fit: BoxFit.contain,
                        ),
                      ),
                      title: const Text('Privacy Policy'),
                      subtitle: const Text('View our Privacy Policy here'),
                      isThreeLine: false,
                      onTap: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Privacy()));
                      },
                    ),
                  ),
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              child: CircularProgressIndicator(
                                value: downloadProgress.progress,
                              ),
                            ),
                          ),
                          imageUrl:
                              'https://i0.wp.com/awordjourneytranslation.com/wp-content/uploads/2018/10/certified-translation-services-company.png?w=740',
                          width: 90,
                          height: 90,
                          fit: BoxFit.contain,
                        ),
                      ),
                      title: const Text('About'),
                      subtitle: const Text(
                          'View and Learn about the Tech Cuttie Team Here'),
                      isThreeLine: false,
                      onTap: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const About()));
                      },
                    ),
                  ),
                  // Card(
                  //   clipBehavior: Clip.antiAliasWithSaveLayer,
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(40),
                  //   ),
                  //   child: ListTile(
                  //     leading: ClipRRect(
                  //       borderRadius: BorderRadius.circular(20),
                  //       child: CachedNetworkImage(
                  //         errorWidget: (context, url, error) =>
                  //             const Icon(Icons.error),
                  //         progressIndicatorBuilder:
                  //             (context, url, downloadProgress) => SizedBox(
                  //           height: 20,
                  //           width: 20,
                  //           child: Padding(
                  //             padding: const EdgeInsets.symmetric(
                  //                 horizontal: 30, vertical: 15),
                  //             child: CircularProgressIndicator(
                  //               value: downloadProgress.progress,
                  //             ),
                  //           ),
                  //         ),
                  //         imageUrl:
                  //             'https://i1.wp.com/techcuttie.com/wp-content/uploads/2021/10/image-3.jpeg?resize=234%2C215&ssl=1',
                  //         width: 90,
                  //         height: 90,
                  //         fit: BoxFit.contain,
                  //       ),
                  //     ),
                  //     title: const Text('Subscribe to our Newsletters'),
                  //     subtitle: const Text(
                  //         'Enter your communication details on this page and stay informed thorugh our newsletter service. '),
                  //     isThreeLine: false,
                  //     onTap: () async {
                  //       await Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => const Newsletter()));
                  //     },
                  //   ),
                  // ),

                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => SizedBox(
                            height: 20,
                            width: 20,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              child: CircularProgressIndicator(
                                value: downloadProgress.progress,
                              ),
                            ),
                          ),
                          imageUrl:
                              'https://i1.wp.com/techcuttie.com/wp-content/uploads/2021/10/image-4.jpeg?resize=253%2C199&ssl=1',
                          width: 90,
                          height: 90,
                          fit: BoxFit.contain,
                        ),
                      ),
                      title: const Text('Contact Us'),
                      subtitle: const Text(
                          'Having any feedback or remarks that you would like to pass on to the Tech Cuttie team Then Contact Us here. '),
                      isThreeLine: false,
                      onTap: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Contact()));
                      },
                    ),
                  ),

                  // Card(
                  //   clipBehavior: Clip.antiAliasWithSaveLayer,
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(40),
                  //   ),
                  //   child: ListTile(
                  //     leading: ClipRRect(
                  //       borderRadius: BorderRadius.circular(20),
                  //       child: CachedNetworkImage(
                  //         errorWidget: (context, url, error) =>
                  //             const Icon(Icons.error),
                  //         progressIndicatorBuilder:
                  //             (context, url, downloadProgress) => SizedBox(
                  //           height: 20,
                  //           width: 20,
                  //           child: Padding(
                  //             padding: const EdgeInsets.symmetric(
                  //                 horizontal: 30, vertical: 15),
                  //             child: CircularProgressIndicator(
                  //               value: downloadProgress.progress,
                  //             ),
                  //           ),
                  //         ),
                  //         imageUrl:
                  //             'https://i0.wp.com/techcuttie.com/wp-content/uploads/2021/09/affiliate-word-written-wooden-blocks-refferals-marketing-business-concept-207854257-1.jpg?resize=1024%2C156&ssl=1',
                  //         width: 90,
                  //         height: 90,
                  //         fit: BoxFit.contain,
                  //       ),
                  //     ),
                  //     title: const Text('Affiliate'),
                  //     subtitle: const Text(
                  //         'Become a Tech Cuttie affiliate and help others learn about Tech Cuttie'),
                  //     isThreeLine: false,
                  //     onTap: () async {
                  //       await Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => const Affiliate()));
                  //     },
                  //   ),
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

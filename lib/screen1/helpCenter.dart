import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: camel_case_types
class helpcenter extends StatefulWidget {
  const helpcenter({super.key});

  @override
  State<helpcenter> createState() => _helpcenterState();
}

// ignore: camel_case_types
class _helpcenterState extends State<helpcenter> {
  String cn = 'Contact Us';
  String save = 'FAQ';
  Widget listTile(
      {required IconData icon, required String title, required onTab1}) {
    return Column(
      children: [
        const Divider(
          height: 1,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
          onTap: onTab1,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 33, 32, 34),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 33, 32, 34),
          elevation: 0,
          title: const Text(
            'Help Center',
            style: TextStyle(
              fontFamily: 'Gotham',
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  text: save,
                ),
                Tab(
                  text: cn,
                ),
              ],
              indicatorColor: Colors.green,
            ),
            Expanded(
              child: TabBarView(children: [
                Container(
                  color: const Color.fromARGB(255, 33, 32, 34),
                  child: ListView(
                    children: const [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          clipBehavior: Clip.antiAlias,
                          margin: EdgeInsets.zero,
                          child: ExpansionTile(
                            title: Text(
                              "What is InsightMate?",
                              style: TextStyle(fontSize: 14),
                            ),
                            collapsedBackgroundColor:
                                const Color.fromARGB(255, 37, 37, 37),
                            collapsedTextColor: Colors.white,
                            collapsedIconColor:
                                Color.fromARGB(255, 239, 241, 242),
                            iconColor: Colors.white,
                            textColor: Colors.white,
                            backgroundColor:
                                const Color.fromARGB(255, 37, 37, 37),
                            children: [
                              Divider(
                                color: Colors.white,
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "InsightMate could be a fitting name for a chatbot that uses machine learning APIs to analyze data and trends, providing valuable insights and acting as a reliable advisor for its users.",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.white),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Card(
                          child: ExpansionTile(
                            // leading: CircleAvatar(
                            //     backgroundImage: NetworkImage(
                            //         "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHw%3D&w=1000&q=80")),
                            title: Text(
                              "Who are we",
                              style: TextStyle(fontSize: 14),
                            ),
                            collapsedBackgroundColor:
                                const Color.fromARGB(255, 37, 37, 37),
                            collapsedTextColor: Colors.white,
                            collapsedIconColor:
                                Color.fromARGB(255, 239, 241, 242),
                            iconColor: Colors.white,
                            textColor: Colors.white,
                            backgroundColor:
                                const Color.fromARGB(255, 37, 37, 37),
                            children: [
                              Divider(
                                color: Colors.white,
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "A group of five students from the DSAI branch of IIIT Dharwad are currently working on a project called Insidemate. The project involves the creation of a chatbot that can act as a trusted advisor for its users by providing valuable insights on various topics using machine learning-based APIs to analyze data and trends. The team is focused on developing an intelligent and user-friendly chatbot that can help users make informed decisions and achieve their goals with confidence. The project is a collaborative effort, with each team member bringing their unique skills and expertise to the table to create a successful end product",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              // Text(
                              //   "hello",
                              //   style: TextStyle(color: Colors.white),
                              // ),
                              //  Icon(Icons.downhill_skiing)
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          clipBehavior: Clip.antiAlias,
                          margin: EdgeInsets.zero,
                          child: ExpansionTile(
                            // leading: CircleAvatar(
                            //     backgroundImage: NetworkImage(
                            //         "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHw%3D&w=1000&q=80")),
                            title: Text(
                              "What is the focus of the team working on the Insidemate project?",
                              style: TextStyle(fontSize: 14),
                            ),
                            collapsedBackgroundColor:
                                const Color.fromARGB(255, 37, 37, 37),
                            collapsedTextColor: Colors.white,
                            collapsedIconColor:
                                Color.fromARGB(255, 239, 241, 242),
                            iconColor: Colors.white,
                            textColor: Colors.white,
                            backgroundColor:
                                const Color.fromARGB(255, 37, 37, 37),
                            children: [
                              Divider(
                                color: Colors.white,
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "The focus of the team working on the Insidemate project is to develop an intelligent and user-friendly chatbot that can help users make informed decisions and achieve their goals with confidence.",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              // Text(
                              //   "hello",
                              //   style: TextStyle(color: Colors.white),
                              // ),
                              // Icon(Icons.downhill_skiing)
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          clipBehavior: Clip.antiAlias,
                          margin: EdgeInsets.zero,
                          child: ExpansionTile(
                            // leading: CircleAvatar(
                            //     backgroundImage: NetworkImage(
                            //   "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHw%3D&w=1000&q=80",
                            // )),
                            title: Text(
                              "What type of APIs does the Insidemate chatbot use to analyze data and trends?",
                              style: TextStyle(fontSize: 14),
                            ),
                            collapsedBackgroundColor:
                                const Color.fromARGB(255, 37, 37, 37),
                            collapsedTextColor: Colors.white,
                            collapsedIconColor:
                                Color.fromARGB(255, 239, 241, 242),
                            iconColor: Colors.white,
                            textColor: Colors.white,
                            backgroundColor:
                                const Color.fromARGB(255, 37, 37, 37),
                            children: [
                              Divider(
                                color: Colors.white,
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Insidemate is a chatbot that employs machine learning-based APIs to perform data analysis and identify trends. By using these APIs, Insidemate can quickly and accurately analyze vast amounts of data, enabling it to provide valuable insights and guidance to its users. This approach enables Insidemate to recognize patterns that might be difficult for humans to discern and to continuously improve its performance over time. As a result, users can benefit from the latest advances in data analysis and machine learning to make informed decisions and achieve their goals. Ultimately, the use of machine learning-based APIs allows Insidemate to be a reliable and effective advisor for users seeking actionable insights.",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13),
                                  textAlign: TextAlign.justify,
                                ),
                              ),

                              // Text(
                              //   "hello",
                              //   style: TextStyle(color: Colors.white),
                              // ),
                              //  Icon(Icons.downhill_skiing)
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          clipBehavior: Clip.antiAlias,
                          margin: EdgeInsets.zero,
                          child: ExpansionTile(
                            // leading: CircleAvatar(
                            //     backgroundImage: NetworkImage(
                            //         "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHw%3D&w=1000&q=80")),
                            title: Text(
                              "What is the purpose of the Insidemate chatbot?",
                              style: TextStyle(fontSize: 14),
                            ),
                            collapsedBackgroundColor:
                                const Color.fromARGB(255, 37, 37, 37),
                            collapsedTextColor:
                                Color.fromARGB(255, 248, 248, 248),
                            collapsedIconColor:
                                Color.fromARGB(255, 239, 241, 242),
                            iconColor: Colors.white,
                            textColor: Colors.white,
                            backgroundColor:
                                const Color.fromARGB(255, 37, 37, 37),
                            children: [
                              Divider(
                                color: Colors.white,
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "The purpose of Insidemate is to act as a trusted advisor for its users by providing valuable insights on various topics using machine learning-based APIs to analyze data and trends.",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13),
                                  textAlign: TextAlign.justify,
                                ),
                              ),

                              // Text(
                              //   "hello",
                              //   style: TextStyle(color: Colors.white),
                              // ),
                              //  Icon(Icons.downhill_skiing)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                // ignore: avoid_unnecessary_containers
                Container(
                    child: ListView(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 20),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: const Color.fromARGB(255, 37, 37, 37),
                          ),
                          child: const ListTile(
                            leading: Icon(
                              Icons.facebook,
                              color: Colors.green,
                            ),
                            title: Text(
                              'Facebook',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: const Color.fromARGB(255, 37, 37, 37),
                          ),
                          child: const ListTile(
                            leading: Icon(
                              Icons.apple,
                              color: Colors.green,
                            ),
                            title: Text(
                              'Apple Id',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: const Color.fromARGB(255, 37, 37, 37),
                          ),
                          child: const ListTile(
                            leading: Icon(
                              FontAwesomeIcons.google,
                              color: Colors.green,
                            ),
                            title: Text(
                              'Gmail',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: const Color.fromARGB(255, 37, 37, 37),
                          ),
                          child: const ListTile(
                            leading: Icon(
                              FontAwesomeIcons.instagram,
                              color: Colors.green,
                            ),
                            title: Text(
                              'Instagram',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ]))
              ]),
            )
          ],
        ),
      ),
    );
  }
}

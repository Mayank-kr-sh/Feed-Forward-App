import 'package:flutter/material.dart';
import 'package:food_donation/category/Chat_bot.dart';
import 'package:food_donation/category/Chat_watssapp.dart';
import 'package:food_donation/screen/homepage.dart';

class ChatOption {
  String title;
  String subtitle;
  String imageUrl;

  ChatOption(
      {required this.title, required this.subtitle, required this.imageUrl});
}

class ChatScreen extends StatelessWidget {
  final List<ChatOption> chatOptions = [
    ChatOption(
      title: "Bot",
      subtitle: "Chat with Bot",
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuvHjWqFdb-58g00FVMcY_pQxLYro-sUS9EL7xJYQ&s",
    ),
    ChatOption(
      title: "WhatsApp",
      subtitle: "Chat with WhatsApp",
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcWAF0mh6d9M2JSUPp1j-rDPyY09nuMalf5KbKC6_iLw&ec=48665701",
    ),
  ];

  void openChat(String option) {
    // Logic to open chat with selected option (Boat/WhatsApp)
    print("Opening chat with $option");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 241, 229),
      appBar: AppBar(
        flexibleSpace: Container(
            decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(120, 0, 0, 0),
              blurRadius: 20,
            ),
          ],
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 172, 226, 241),
              Color.fromARGB(255, 18, 160, 248),
              Color.fromARGB(217, 56, 48, 209),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        )),
        title: const Text("Chat Us"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Select Chat Option",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const ChatBox();
                      },
                    ),
                  );
                },
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Container(
                    height: 160,
                    width: 300,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          chatOptions[0].imageUrl,
                          height: 64,
                          width: 64,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          chatOptions[0].title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          chatOptions[0].subtitle,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return watssappChat();
                      },
                    ),
                  );
                },
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Container(
                    height: 160,
                    width: 300,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          chatOptions[1].imageUrl,
                          height: 64,
                          width: 64,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          chatOptions[1].title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          chatOptions[1].subtitle,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class NGO extends StatefulWidget {
  const NGO({super.key});

  @override
  _NGOState createState() => _NGOState();
}

class _NGOState extends State<NGO> {
  final List<String> ngos = [
    "NGO 1",
    "NGO 2",
    "NGO 3",
    "NGO 4",
    "NGO 5",
    "NGO 6",
    "NGO 7",
    "NGO 8",
    "NGO 9",
    "NGO 10",
  ];

  List<bool> isFavorite = List.generate(10, (index) => false);

  void _toggleFavorite(int index) {
    setState(() {
      isFavorite[index] = !isFavorite[index];
    });
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
        title: const Text("List of NGO's"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Collaboration with NGO's",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 18.0),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: ngos.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: const Color.fromARGB(255, 222, 216, 198),
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text(
                          ngos[index][0],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        ngos[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: const Text('Providing food to needy people'),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: isFavorite[index] ? Colors.red : Colors.grey,
                        ),
                        onPressed: () {
                          _toggleFavorite(index);
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

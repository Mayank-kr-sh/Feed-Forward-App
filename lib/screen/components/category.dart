import 'package:flutter/material.dart';
import 'package:food_donation/utils/constant.dart';

class CategoriesHorizontalListViewBar extends StatelessWidget {
  const CategoriesHorizontalListViewBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      //color: Color.fromARGB(255, 96, 11, 11),
      color: const Color.fromARGB(255, 250, 241, 229),
      child: ListView.builder(
          itemCount: categoriesList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => productsList[index],
                  ),
                );
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 18),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        child: iconList[index],
                        backgroundColor: const Color.fromARGB(189, 42, 15, 245),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(categoriesList[index]),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

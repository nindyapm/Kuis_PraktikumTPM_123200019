import 'package:flutter/material.dart';
import 'coffee_menu.dart';
import 'detail_page.dart';
import 'favorite_button.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Coffee for life"),
            centerTitle: true,
          ),
          body: ListView.builder(itemBuilder: (context, index) {
            final CoffeeMenu dataKopi = coffeeList[index];
            return Card (
                child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return DetailPage(identitasTerima: dataKopi);
                      }));
                    },
                    child: Row(
                      children: [
                        ClipRRect(
                          child: SizedBox(
                            height: 150,
                            width: 200,
                            child: Image.network(
                              dataKopi.imageUrls[0],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Text("${dataKopi.name}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                            const SizedBox(
                              width: 20,
                            ),
                            Text("${dataKopi.price}")
                          ],
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              width: 30,
                            ),
                            //memanggil kelas Favorite Button untuk ikon favorite
                            FavoriteButton(
                              onPressed: () {
                                // Handle the favorite button press here
                              },
                            )
                          ],
                        ),
                      ],
                    )
                )
            );
          },
            itemCount: coffeeList.length,
          )
      ),
    );
  }

}


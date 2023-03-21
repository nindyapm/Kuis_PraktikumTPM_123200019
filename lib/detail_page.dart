import 'package:flutter/material.dart';
import 'coffee_menu.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final CoffeeMenu identitasTerima;

  const DetailPage({Key? key, required this.identitasTerima}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.identitasTerima.name),
            centerTitle: true,
          ),
          body: Center(
              child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              ClipRRect(
                child: SizedBox(
                  height: 200,
                  width: 280,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Image.network(widget.identitasTerima.imageUrls[0]),
                      Image.network(widget.identitasTerima.imageUrls[1]),
                      Image.network(widget.identitasTerima.imageUrls[2]),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(widget.identitasTerima.description),
              SizedBox(
                height: 20,
              ),
              Text(widget.identitasTerima.price),
              Text(
                  "${widget.identitasTerima.ingredients[0]}, ${widget.identitasTerima.ingredients[1]} ${widget.identitasTerima.ingredients[2]} ${widget.identitasTerima.ingredients[3]}"),
              Text(widget.identitasTerima.nutrition),
              Text("${widget.identitasTerima.reviewAverage} reviewAverage"),
              Text("${widget.identitasTerima.reviewCount} reviewCount"),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  onPressed: () {
                    _launchURL(widget.identitasTerima.linkStore);
                  },
                  child: Text("Checkout for more information")),
            ],
          ))),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

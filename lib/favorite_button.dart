import 'package:flutter/material.dart';

//stateful kelas untuk membuat ikon favorite
class FavoriteButton extends StatefulWidget {
  final VoidCallback onPressed;

  const FavoriteButton({required this.onPressed});

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool _isFavorited = false;

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: _isFavorited
          ? Icon(Icons.favorite, color: Colors.red)
          : Icon(Icons.favorite_border),
      onPressed: () {
        _toggleFavorite();
        widget.onPressed();
      },
    );
  }
}

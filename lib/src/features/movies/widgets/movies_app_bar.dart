import 'package:flutter/material.dart';

class MoviesAppBar extends StatelessWidget {
  const MoviesAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Welcome Stanley 👋',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Lets relax and watch a movie!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
        const CircleAvatar(
          radius: 23.0,
          backgroundImage: AssetImage('assets/images/perfilFoto.jpg'),
        )
      ],
    );
  }
}

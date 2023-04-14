import 'package:flutter/material.dart';

class WelcomeDetail extends StatelessWidget {
  const WelcomeDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 33, top: 69),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Günaydın, Özgür!',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            '09 : 54',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            '8 Haziran Çarşamba',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ],
      ),
    );
  }
}

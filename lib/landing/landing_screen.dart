import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:todo_appwrite/animations/hover_lift_and_rise.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Spacer(),
          FittedBox(
            child: Text(
              "Introducing",
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
          ),
          FittedBox(
            child: Text(
              "toTooooDoooo",
              style: Theme.of(context) //
                  .textTheme
                  .headline1
                  ?.copyWith(fontSize: 130),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          DefaultTextStyle(
            style: Theme.of(context).textTheme.headline4!,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("A simple to-do app built with "),
                Image.asset(
                  "assets/logos/appwrite.png",
                  width: 30,
                ),
                Text(" Appwrite and "),
                FlutterLogo(size: 30),
                Text(" Flutter"),
              ],
            ),
          ),
          FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: OutlinedButton(
                onPressed: () {
                  Routemaster.of(context).push("/todos");
                },
                child: Text("Get Started"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(35.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                HoverLiftAndRise(
                  child: Image.asset(
                    "assets/logos/github.png",
                    width: 40,
                  ),
                ),
                HoverLiftAndRise(
                  child: Image.asset(
                    "assets/logos/twitter.png",
                    width: 40,
                  ),
                ),
                HoverLiftAndRise(
                  child: Image.asset(
                    "assets/logos/appwrite.png",
                    width: 40,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

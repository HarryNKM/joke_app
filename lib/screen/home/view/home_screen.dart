import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jokes_app/screen/home/model/home_model.dart';
import 'package:jokes_app/screen/home/provider/home_provider.dart';
import 'package:jokes_app/screen/nointernet/view/nointernet_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeProvider>().checkInternet();
    context.read<HomeProvider>().getJoke();
  }

  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return providerW!.isInternet==true?Scaffold(
      backgroundColor: Colors.orange,
      body: Container(
        padding: const EdgeInsets.only(
          left: 12,
          right: 12,
          top: 40,
          bottom: 12,
        ),
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.black.withOpacity(0.6),
            Colors.orange.withOpacity(0.8),
            Colors.deepOrange.withOpacity(0.8),
          ], begin: Alignment.center, end: Alignment.topCenter),
        ),
        child: FutureBuilder(
          future: providerW!.Model,
          builder: (context, snapshot) {
            HomeModel? Model = snapshot.data;
            if (snapshot.hasError) {
              return const Text("Joke Not Found");
            } else if (snapshot.hasData) {
              return Column(
                children: [
                  Image.asset(
                    "assets/img/emoji.png",
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Have Some Fun...",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    alignment: Alignment.center,
                    height: 250,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      border: Border.all(
                        color: Colors.black12,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(
                        "${Model!.joke}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            providerR!.getJoke();
                          },
                          child: const Text(
                            "New Joke",
                            style: TextStyle(color: Colors.black),
                          )),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Save",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          providerW!.sharejoke("${Model.joke}");
                        },
                        child: const Text(
                          "Share",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  ElevatedButton(onPressed: () {
                    Navigator.pushNamed(context, 'like');
                  }, child: Text("My Favourites",style: TextStyle(color: Colors.black
                  ),))
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    ):NoInterNetScreen();
  }
}

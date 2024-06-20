import 'package:flutter/material.dart';

class LikeScreen extends StatefulWidget {
  const LikeScreen({super.key});

  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 40,),
                ),
                SizedBox(width: 20,),
                Text("My Favourites",style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.bold),)
              ],
            ),
            SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.all(12),
              alignment: Alignment.center,
              width: MediaQuery.sizeOf(context).width,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                border: Border.all(
                  color: Colors.black12,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text("Liked Joke Will Be Shown Here",style:
                TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}

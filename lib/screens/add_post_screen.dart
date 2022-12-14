import 'package:appinstagram/utils/colors.dart';
import 'package:flutter/material.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: IconButton(
    //     icon: const Icon(Icons.upload),
    //     onPressed: (){},
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (){},
        ),
        title: const Text("Post to"),
        centerTitle: false,
        actions: [
          TextButton(onPressed: (){}, child: const Text("Post",style: TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),))
        ],
      ),
      body:Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage("https://haycafe.vn/wp-content/uploads/2022/01/Hinh-anh-cute.jpg"),
              ),
              SizedBox(width: MediaQuery.of(context).size.width*0.45,
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "Write a caption...",
                  border: InputBorder.none,
                ),
                maxLines:8 ,
              ),),
              SizedBox(
                height: 45,
                width: 45,
                child: AspectRatio(
                  aspectRatio: 487/451,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("https://haycafe.vn/wp-content/uploads/2022/01/Hinh-anh-cute.jpg"),
                        fit: BoxFit.fill,
                        alignment: FractionalOffset.topCenter
                      )
                    ),
                  ),
                ),
              ),
              const Divider(),
            ],
          )
        ],
      ) ,
    );
  }
}

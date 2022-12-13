import 'dart:typed_data';
import 'package:appinstagram/models/user.dart' as model;
import 'package:appinstagram/resources/storage_method.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final FirebaseFirestore _firestore= FirebaseFirestore.instance;


  //sign up user
  Future<String>signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  })async{
    String res="Some error occurred";
    try{
      if(email.isNotEmpty || password.isNotEmpty|| username.isNotEmpty||bio.isNotEmpty||file !=null){
        //register user
     UserCredential cred= await  _auth.createUserWithEmailAndPassword(email: email, password: password);
    print(cred.user!.uid);
    String photoUrl=await StorageMethods().uploadImageToStorage('profilePics', file, false);
    
     //add user to our database
        model.User user=model.User(
          username: username,
          uid: cred.user!.uid,
          email: email,
          bio: bio,
          photoUrl: photoUrl,
          follwing: [],
          followers: [],
        );

        await _firestore.collection('users').doc(cred.user!.uid).set(user.toJson(),);

        //
        res= "success";
      }
    }
    catch(err){
      res=err.toString();
    }
    return res;
  }

  //login in user
  Future<String> loginUser({required String email, required String password,})async{
    String res="Some error occurred ";
    try{
      if(email.isNotEmpty || password.isNotEmpty){
       await _auth.signInWithEmailAndPassword(email: email, password: password);
       res="success";
      }else{
        res="Please enter all the fields";
      }
     }
    // on FirebaseAuthException catch(e){
    //   print(e.code);
    // }
    catch(err){
    res=err.toString();
    }
    return res;
}


}
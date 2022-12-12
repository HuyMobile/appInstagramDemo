
class User{
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String bio;
  final List followers;
  final List follwing;

  const User({
    required this.email,
    required this.uid,
    required this.photoUrl,
    required this.username,
    required this.bio,
    required this.followers,
    required  this.follwing,
});

  Map<String,dynamic> toJson()=>{
    'username':username,
    "uid":uid,
    "email":email,
    "photoUrl":photoUrl,
    "bio":bio,
    "follwers": followers,
    "following":follwing,
  };

}
class Profile {
  String name;
  String email;

  Profile({required this.name, required this.email});

  Map<String, String> get profileInfo {
    return {"name": name, "email": email};
  }
}

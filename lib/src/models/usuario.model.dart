class Usuario {
  String name;
  String email;
  String password;

  Usuario(this.name, this.email, this.password);

  Map<String, dynamic> toMap() {
    return {
      "name": this.name,
      "email": this.email,
    };
  }
}

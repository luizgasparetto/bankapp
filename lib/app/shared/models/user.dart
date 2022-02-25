import 'package:bankapp/app/core/exports.dart';

class User extends Equatable {
  final String name;
  final String email;
  final String password;
  final String profileImg;
  final List<CreditCard>? creditCards;

  const User({
    required this.name,
    required this.email,
    required this.password,
    required this.profileImg,
    this.creditCards,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'profileImg': profileImg,
      'creditCards': creditCards?.map((x) => x.toMap()).toList(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      profileImg: map['profileImg'] ?? '',
      creditCards: map['creditCards'] ?? [],
    );
  }

  User copyWith({
    String? name,
    String? email,
    String? password,
    String? profileImg,
    List<CreditCard>? creditCards,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      profileImg: profileImg ?? this.profileImg,
      creditCards: creditCards ?? this.creditCards,
    );
  }

  @override
  List<Object?> get props => [name, email, password, profileImg, creditCards];
}

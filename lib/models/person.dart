class Person {
  //Personal info
  String? imageProfile;
  String? email;
  String? password;
  String? name;
  int? age;
  String? phoneNo;
  String? city;
  String? country;
  String? profileHeading;
  String? lookingForInaPartner;
  int? publishedDateTime;
  //Appearance
  String? height;
  String? weight;
  String? bodyType;

  //LifeStyle
  String? drink;
  String? smaoke;
  String? maritalStatus;
  String? haveChildren;
  String? noOfChildren;
  String? profession;
  String? employmentStatus;
  String? income;
  String? livingSituation;
  String? willingToRelocate;
  String? relationshipLookingFor;

  //Background
  String? nationality;
  String? education;
  String? language;
  String? religion;
  String? ethnicity;
  Person({
    this.imageProfile,
    this.email,
    this.password,
    this.name,
    this.age,
    this.phoneNo,
    this.city,
    this.country,
    this.profileHeading,
    this.lookingForInaPartner,
    this.publishedDateTime,
    this.height,
    this.weight,
    this.bodyType,
    this.drink,
    this.smaoke,
    this.maritalStatus,
    this.haveChildren,
    this.noOfChildren,
    this.profession,
    this.employmentStatus,
    this.income,
    this.livingSituation,
    this.willingToRelocate,
    this.relationshipLookingFor,
    this.nationality,
    this.education,
    this.language,
    this.religion,
    this.ethnicity,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imageProfile': imageProfile,
      'email': email,
      'password': password,
      'name': name,
      'age': age,
      'phoneNo': phoneNo,
      'city': city,
      'country': country,
      'profileHeading': profileHeading,
      'lookingForInaPartner': lookingForInaPartner,
      'publishedDateTime': DateTime.now().millisecondsSinceEpoch,
      'height': height,
      'weight': weight,
      'bodyType': bodyType,
      'drink': drink,
      'smaoke': smaoke,
      'maritalStatus': maritalStatus,
      'haveChildren': haveChildren,
      'noOfChildren': noOfChildren,
      'profession': profession,
      'employmentStatus': employmentStatus,
      'income': income,
      'livingSituation': livingSituation,
      'willingToRelocate': willingToRelocate,
      'relationshipLookingFor': relationshipLookingFor,
      'nationality': nationality,
      'education': education,
      'language': language,
      'religion': religion,
      'ethnicity': ethnicity,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      imageProfile: map['imageProfile'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      name: map['name'] ?? '',
      age: map['age'] ?? 0,
      phoneNo: map['phoneNo'] ?? '',
      city: map['city'] ?? '',
      country: map['country'] ?? '',
      profileHeading: map['profileHeading'] ?? '',
      lookingForInaPartner: map['lookingForInaPartner'] ?? '',
      publishedDateTime: map['publishedDateTime'] ?? '',
      height: map['height'] ?? '',
      weight: map['weight'] ?? '',
      bodyType: map['bodyType'] ?? '',
      drink: map['drink'] ?? '',
      smaoke: map['smaoke'] ?? '',
      maritalStatus: map['maritalStatus'] ?? '',
      haveChildren: map['haveChildren'] ?? '',
      noOfChildren: map['noOfChildren'] ?? '',
      profession: map['profession'] ?? '',
      employmentStatus: map['employmentStatus'] ?? '',
      income: map['income'] ?? '',
      livingSituation: map['livingSituation'] ?? '',
      willingToRelocate: map['willingToRelocate'] ?? '',
      relationshipLookingFor: map['relationshipLookingFor'] ?? '',
      nationality: map['nationality'] ?? '',
      education: map['education'] ?? '',
      language: map['language'] ?? '',
      religion: map['religion'] ?? '',
      ethnicity: map['ethnicity'] ?? '',
    );
  }
}

class Animal {
  final String name;
  final String species;
  final String family;
  final String habitat;
  // ignore: non_constant_identifier_names
  final String place_of_found;
  final String diet;
  final String description;

  Animal({
    required this.name, 
    required this.species,
    required this.family,
    required this.habitat,
    // ignore: non_constant_identifier_names
    required this.place_of_found,
    required this.diet,
    required this.description
  });

  factory Animal.fromJson(Map<String, dynamic> json) {
    return Animal(
      name: json['name'],
      species: json['species'],
      family: json['family'],
      habitat: json['habitat'],
      place_of_found:json['place_of_found'],
      diet: json['diet'],
      description: json['description'],
    );
  }
}
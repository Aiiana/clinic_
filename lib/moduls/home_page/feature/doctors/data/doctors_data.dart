class DoctorsData {
  static List<Doctors> data = [
    Doctors(
      name: 'Юлиана Караулова',
      image: 'assets/images/pngs/—Pngtree—female doctor wearing a medical_9169442.png',
      category: 'Артимологи',
      rate: '5.0',
      comments: [
        'comments',
        'comments',
        'comments',
        'comments',
        'comments',
        'comments',
      ],
      decscription: 'decscription',
      phone: 'phone',
      adres: 'adres',
      email: 'email',
    ),
    Doctors(
      name: 'Юрий Гогунский',
      image: 'assets/images/pngs/—Pngtree—female doctor wearing a medical_9169442.png',
      category: "Кардиологи",
      rate: '4.8',
      comments: [
        'comments',
        'comments',
        'comments',
        'comments',
        'comments',
        'comments',
      ],
      decscription: 'decscription',
      phone: 'phone',
      adres: 'adres',
      email: 'email',
    ),
    Doctors(
      name: 'Надежда Веронина',
      image: 'assets/images/pngs/—Pngtree—female doctor wearing a medical_9169442.png',
      category: 'Хирурги',
      rate: '4.2',
      comments: [
        'comments',
        'comments',
        'comments',
        'comments',
        'comments',
        'comments',
      ],
      decscription: 'decscription',
      phone: 'phone',
      adres: 'adres',
      email: 'email',
    ),
    Doctors(
      name: 'name',
      image: 'assets/images/pngs/—Pngtree—female doctor wearing a medical_9169442.png',
      category: 'Doctor 2',
      rate: 'rate',
      comments: [
        'comments',
        'comments',
        'comments',
        'comments',
        'comments',
        'comments',
      ],
      decscription: 'decscription',
      phone: 'phone',
      adres: 'adres',
      email: 'email',
    ),
    Doctors(
      name: 'name',
      image: 'assets/images/pngs/—Pngtree—female doctor wearing a medical_9169442.png',
      category: 'Doctor 2',
      rate: 'rate',
      comments: [
        'comments',
        'comments',
        'comments',
        'comments',
        'comments',
        'comments',
      ],
      decscription: 'decscription',
      phone: 'phone',
      adres: 'adres',
      email: 'email',
    ),
    Doctors(
      name: 'name',
      image: 'assets/images/pngs/—Pngtree—female doctor wearing a medical_9169442.png',
      category: 'Doctor 2',
      rate: 'rate',
      comments: [
        'comments',
        'comments',
        'comments',
        'comments',
        'comments',
        'comments',
      ],
      decscription: 'decscription',
      phone: 'phone',
      adres: 'adres',
      email: 'email',
    ),
  ];

  static List<String> categories = [
    'Артимологи',
    'Кардиологи',
    'Хирурги',
    "Стоматологи",
    'Отоларингологи',
    'Психиатры',
    'Терапевты'
  ];
}

class Doctors {
  final String name;
  final String image;
  final String category;
  final String rate;
  final List<String> comments;
  final String decscription;
  final String phone;
  final String adres;
  final String email;

  Doctors({
    required this.name,
    required this.image,
    required this.category,
    required this.rate,
    required this.comments,
    required this.decscription,
    required this.phone,
    required this.adres,
    required this.email,
  });
}
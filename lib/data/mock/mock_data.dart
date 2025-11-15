import '../models/service_model.dart';
import '../models/freelancer_model.dart';

final mockServices = <ServiceModel>[
  ServiceModel(
    id: 's1',
    title: 'Plants Shop',
    subtitle: 'iOS & Android Template',
    image: 'assets/images/plant_mock.png',
    rating: 4.5,
    reviews: 23,
    level: 2,
    price: 45,
    description:
        'The aglaonema is highly decorative, and one of the most used interior landscape plant.',
    sponsored: true,
    tag: '',
  ),
  ServiceModel(
    id: 's2',
    title: 'Figma Website Design',
    subtitle: 'PSD File Format',
    image: 'assets/images/plant_mock.png',
    rating: 4.5,
    reviews: 12,
    level: 2,
    price: 126,
    description: 'I will do professional figma design for website template',
    sponsored: true,
    tag: '',
  ),
];

final mockFreelancers = <FreelancerModel>[
  FreelancerModel(
    id: 'f1',
    name: 'Esther Howard',
    title: 'UI/UX Designer',
    avatar: 'assets/images/avatar.png',
    rating: 4.5,
    reviews: 212,
    hourlyRate: 83,
    location: '6391 Elgin St. Celina',
    skills: ['Figma', 'Mobile App', 'Prototyping'],
    levelTag: 'Pro',
  ),
  FreelancerModel(
    id: 'f2',
    name: 'John Doe',
    title: 'Front-end Dev',
    avatar: 'assets/images/avatar.png',
    rating: 4.7,
    reviews: 89,
    hourlyRate: 65,
    location: 'New York',
    skills: ['React', 'Next.js', 'UI'],
    levelTag: 'Pro',
  ),
];

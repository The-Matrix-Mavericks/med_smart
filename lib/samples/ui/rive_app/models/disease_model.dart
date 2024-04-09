class Disease {
  final String name, image;
  final List<String> symptoms, causes, dos, donts;
  Disease({
    required this.name,
    required this.symptoms,
    required this.causes,
    required this.image,
    required this.dos,
    required this.donts,
  });
}

List<Disease> diseases = [
  Disease(
    name: 'Asthma',
    symptoms: [
      'Wheezing',
      'Shortness of breath',
      'Chest tightness',
      'Coughing especially at night or early morning'
    ],
    causes: [
      'Genetic predisposition',
      'Environmental factors (pollution, allergens, smoke)',
      'Respiratory infections',
      'Exercise-induced asthma'
    ],
    image: 'assets/images/info-mental.png',
    dos: [
      'Use prescribed inhalers as directed by your doctor',
      'Identify and avoid triggers such as smoke, dust, and pet dander',
      'Follow a healthy lifestyle with regular exercise and a balanced diet',
      'Keep rescue inhaler handy for emergencies',
      'Stay updated with asthma action plan provided by your doctor'
    ],
    donts: [
      'Don\'t smoke or expose yourself to secondhand smoke',
      'Avoid strenuous physical activity in cold air',
      'Don\'t ignore symptoms, seek medical help promptly',
      'Avoid allergens and irritants that trigger asthma attacks',
      'Don\'t rely solely on rescue medication; use preventive medication as prescribed'
    ],
  ),

  Disease(
    name: 'Fever',
    symptoms: [
      'Elevated body temperature (above 100.4°F or 38°C)',
      'Chills or sweating',
      'Headache',
      'Muscle aches',
      'Fatigue',
      'Loss of appetite',
      'Dehydration'
    ],
    causes: [
      'Infections (viral, bacterial, fungal)',
      'Inflammation (such as in autoimmune diseases)',
      'Heat exhaustion or heatstroke',
      'Certain medications',
      'Immunizations (vaccine reactions)'
    ],
    image: 'assets/images/info-mental.png',
    dos: [
      'Stay hydrated with water, clear broths, or electrolyte solutions.',
      'Get plenty of rest',
      'Take over-the-counter fever reducers like acetaminophen or ibuprofen as directed.',
      'Wear light clothing and use cool compresses to ease discomfort.',
      'Seek medical attention if fever persists for more than a few days or is accompanied by severe symptoms.'
    ],
    donts: [
      'Avoid alcohol and caffeine, which can contribute to dehydration.',
      'Don\'t overdress or over-bundle if feverish.',
      'Avoid using cold baths or alcohol rubs for cooling, as they can worsen symptoms.',
      'Don\'t hesitate to seek medical advice if fever is high (above 103°F or 39.4°C), or if accompanied by confusion, severe headache, difficulty breathing, or other concerning symptoms.'
    ],
  ),
  // Disease(
  //   name: 'Anxiety',
  //   symptoms: [],
  //   causes: [],
  //   image: '',
  //   dos: [],
  //   donts: [],
  // ),
  // Disease(
  //   name: 'Chest pain',
  //   symptoms: [],
  //   causes: [],
  //   image: '',
  //   dos: [],
  //   donts: [],
  // ),
  // Disease(
  //   name: 'Chickenpox',
  //   symptoms: [],
  //   causes: [],
  //   image: '',
  //   dos: [],
  //   donts: [],
  // ),
  // Disease(
  //   name: 'Cough',
  //   symptoms: [],
  //   causes: [],
  //   image: '',
  //   dos: [],
  //   donts: [],
  // ),
  // Disease(
  //   name: 'Dehydration',
  //   symptoms: [],
  //   causes: [],
  //   image: '',
  //   dos: [],
  //   donts: [],
  // ),
  // Disease(
  //   name: 'Diabetes',
  //   symptoms: [],
  //   causes: [],
  //   image: '',
  //   dos: [],
  //   donts: [],
  // ),
  // Disease(
  //   name: 'Diarrhoea',
  //   symptoms: [],
  //   causes: [],
  //   image: '',
  //   dos: [],
  //   donts: [],
  // ),
  // Disease(
  //   name: 'Flu',
  //   symptoms: [],
  //   causes: [],
  //   image: '',
  //   dos: [],
  //   donts: [],
  // ),
  // Disease(
  //   name: 'Food Poisoning',
  //   symptoms: [],
  //   causes: [],
  //   image: '',
  //   dos: [],
  //   donts: [],
  // ),
  // Disease(
  //   name: 'Headache',
  //   symptoms: [],
  //   causes: [],
  //   image: '',
  //   dos: [],
  //   donts: [],
  // ),
  // Disease(
  //   name: 'Malaria',
  //   symptoms: [],
  //   causes: [],
  //   image: '',
  //   dos: [],
  //   donts: [],
  // ),
  // Disease(
  //   name: 'Pneumonia',
  //   symptoms: [],
  //   causes: [],
  //   image: '',
  //   dos: [],
  //   donts: [],
  // ),
];

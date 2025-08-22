import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // A list of example data for the grid view
    final List<Map<String, String>> homeItems = [
      {'title': 'Geometric Harmony', 'subtitle': 'Studio Archiform', 'image': 'Geometric_Harmony.png'},
      {'title': 'Urban Symmetry', 'subtitle': 'David Hughes', 'image': 'Urban_Symmetry.png'},
      {'title': 'Light & Shadow', 'subtitle': 'Elena Miro', 'image': 'light_shadow.png'},
      {'title': 'Brutalist Beauty', 'subtitle': 'J.K. Architects', 'image': 'Brutalist_Beauty.png'},
      {'title': 'Modern Minimalism', 'subtitle': 'Anya Petrova', 'image': 'Modern_Minimalism.png'},
      {'title': 'Coastal Living', 'subtitle': 'Oceanic Designs', 'image': 'Coastal_living.png'},
      {'title': 'Industrial Loft', 'subtitle': 'Mason Collective', 'image': 'Industrial_Loft.png'},
      {'title': 'Zen Garden', 'subtitle': 'Kyoto Studios', 'image': 'Zen_Garden.png'},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('GALLERIA', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tabs for All, Architecture, etc.
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Chip(label: Text('All')),
                  Text('Architecture'),
                  Text('Interior'),
                  Text('Art'),
                ],
              ),
              const SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: homeItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final item = homeItems[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(15.0)),
                            child: Image.asset(
                              'assets/images/${item['image']}',
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title']!,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                item['subtitle']!,
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
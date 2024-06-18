import 'dart:math';

import 'package:dynamic_row_grid/dynamic_row_grid.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final List animals = [
  'Lion',
  'Tiger',
  'Elephant',
  'Giraffe',
  'Zebra',
  'Monkey',
  'Kangaroo',
  'Panda',
  'Koala',
  'Penguin',
  'Bear',
  'Wolf',
  'Fox',
  'Deer',
  'Rabbit',
  'Squirrel',
  'Hippopotamus',
  'Rhinoceros',
  'Leopard',
  'Cheetah',
  'Crocodile',
  'Alligator',
  'Chameleon',
  'Lemur',
  'Orangutan',
  'Chimpanzee',
  'Gorilla',
  'Parrot',
  'Ostrich',
  'Flamingo',
  'Peacock',
  'Owl',
  'Eagle',
  'Hawk',
  'Falcon',
  'Vulture',
  'Toucan',
  'Penguin',
  'Seal',
  'Walrus',
  'Dolphin',
  'Whale',
  'Shark',
  'Octopus',
  'Squid',
  'Jellyfish',
  'Starfish',
  'Sea Turtle',
  'Clownfish',
  'Seahorse',
  'Crab',
  'Lobster',
  'Stingray',
  'Pufferfish',
  'Swordfish',
  'Barracuda',
  'Angelfish',
  'Goldfish',
  'Cobra',
  'Python',
  'Rattlesnake',
  'Viper',
  'Iguana',
  'Gecko',
  'Komodo Dragon',
  'Frog',
  'Toad',
  'Salamander',
  'Newt',
  'Butterfly',
  'Bee',
  'Ladybug',
  'Dragonfly',
  'Grasshopper',
  'Ant',
  'Beetle',
  'Wasp',
  'Hornet',
  'Moth',
  'Spider',
  'Scorpion',
  'Tarantula',
  'Bat',
  'Hedgehog',
  'Porcupine',
  'Armadillo',
  'Skunk',
  'Raccoon',
  'Badger',
  'Mole',
  'Weasel',
  'Ferret',
  'Otter',
  'Platypus',
  'Opossum',
  'Sloth',
  'Anteater',
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: DynamicRowGrid(
          itemCount: animals.length,
          crossAxisCount: 4,
          physics: const BouncingScrollPhysics(),
          header: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Animals',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          footer: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Footer',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          emptyStateWidget: const Center(
            child: Text(
              'No animals available',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          itemBuilder: (context, index) {
            return ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(
                  Color.fromARGB(
                    255,
                    Random().nextInt(256),
                    Random().nextInt(256),
                    Random().nextInt(256),
                  ),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: const BorderSide(width: 1, color: Colors.black),
                  ),
                ),
                shadowColor: MaterialStateProperty.all(
                  Colors.white,
                ),
              ),
              onPressed: () {},
              child: Text(
                animals[index],
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

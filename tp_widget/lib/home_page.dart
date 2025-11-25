import 'package:flutter/material.dart';
import 'counter_page.dart'; // Importer la page du compteur
import 'contact_page.dart'; // Importer la page des contacts
import 'post_page.dart'; // Importer la page des posts

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page d'accueil"),
        centerTitle: true,
      ),
      // Le corps de la page d'accueil peut être simple
      body: const Center(
        child: Text(
          'Bienvenue !',
          style: TextStyle(fontSize: 24),
        ),
      ),
      // Le menu latéral pour la navigation
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Center(
                child: Text(
                  'Menu',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.calculate),
              title: const Text('Compteur'),
              onTap: () {
                Navigator.pop(context); // Ferme le menu
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CounterPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.contacts),
              title: const Text('Contacts'),
              onTap: () {
                Navigator.pop(context); // Ferme le menu
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.article),
              title: const Text('Posts'),
              onTap: () {
                Navigator.pop(context); // Ferme le menu
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PostsPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

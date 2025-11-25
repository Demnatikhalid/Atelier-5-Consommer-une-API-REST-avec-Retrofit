import 'package:flutter/material.dart';
import 'package:tp_widget/contact_details.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactStatePage();
}

class _ContactStatePage extends State<ContactPage> {
  List<Map<String, dynamic>> contacts = [
    {
      "name": "Mouhssine",
      "phone": "0612345678",
      "email": "mouhssine@gmail.com",
    },
    {"name": "Demanti", "phone": "0678452310", "email": "demanti@gmail.com"},
    {
      "name": "Abderrahman",
      "phone": "0654789623",
      "email": "abderrahman@gmail.com",
    },
    {"name": "Tanassa", "phone": "0698745123", "email": "tanassa@gmail.com"},
  ];

  void _addNewContact() {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Contact'),
        content: SingleChildScrollView( // In case keyboard covers fields
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 10),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // Validate all fields
              if (nameController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter a name'))
                );
                return;
              }
              if (phoneController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter a phone number'))
                );
                return;
              }
              if (emailController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter an email'))
                );
                return;
              }

              setState(() {
                contacts.add({
                  "name": nameController.text,
                  "phone": phoneController.text,
                  "email": emailController.text,
                });
              });
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Contact added successfully!'))
              );
            },
            child: Text('Add Contact'),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Contacts'))),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          final name = contact["name"]!;

          return ListTile(
            leading: CircleAvatar(
              child: Text(name.substring(0, 1).toUpperCase()),
            ),
            title: Text(name),
            trailing: IconButton(onPressed: (){
              setState(() {
                contacts.removeAt(index);
              });
            }, icon: Icon(Icons.delete,color: Colors.red,)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ContactDetails(contact: {
                        "name": contact["name"].toString(),
                        "phone": contact["phone"].toString(),
                        "email": contact["email"].toString(),
                      })
                  )
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewContact,
        child: Icon(Icons.add),
      ),
    );
  }
}
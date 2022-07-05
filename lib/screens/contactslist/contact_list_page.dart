import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import '../../data/contact.dart';

class ContactListPage extends StatefulWidget {
  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  late List<Contact> _contact;

  @override
  initState() {
    super.initState();
    _contact = List.generate(50, (index) {
      return Contact(
        // isFavorite: false,
        email: faker.internet.email(),
        name: faker.person.firstName() + ' ' + faker.person.lastName(),
        phoneNumber: faker.randomGenerator.integer(10000).toString(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: ListView.builder(
          itemCount: _contact.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: Text(_contact[index].name),
                subtitle: Text(
                  _contact[index].email,
                ),
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      _contact[index].isFavorite = !_contact[index].isFavorite;
                      _contact.sort((a, b) {
                        if (a.isFavorite) {
                          return -1;
                        } else if (b.isFavorite) {
                          return 1;
                        } else {
                          return 0;
                        }
                      });
                    });
                  },
                  icon: Icon(
                      _contact[index].isFavorite
                          ? Icons.star
                          : Icons.star_border,
                      color: _contact[index].isFavorite
                          ? Colors.amber
                          : Colors.grey),
                ));
          }),
    );
  }
}

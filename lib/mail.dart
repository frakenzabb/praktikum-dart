import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MailClientWidget extends StatelessWidget {
  final String targetEmail;

  const MailClientWidget({Key? key, required this.targetEmail})
      : super(key: key);

  void _launchMailClient(String targetEmail) async {
    String mailUrl = 'mailto:$targetEmail';
    try {
      await launch(mailUrl);
    } catch (e) {}
  }

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: screenWidth * 0.4, // Misalnya, mengambil 40% dari lebar layar
          height: 60,
          child: ElevatedButton.icon(
            onPressed: () {
              _launchMailClient(targetEmail);
            },
            icon: Icon(Icons.email,
                color: Color.fromARGB(255, 0, 0, 0)), // Ubah warna ikon di sini
            label: Text(
              'Email Fakultas Ekonomi Bisnis',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black), // Ubah warna teks di sini
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(
                  207, 216, 220, 1), // Ubah warna latar belakang di sini
            ),
          ),
        ),
        SizedBox(
          width: screenWidth * 0.4, // Misalnya, mengambil 40% dari lebar layar
          height: 60,
          child: ElevatedButton.icon(
            onPressed: () {
              launchURL(Website.website);
            },
            icon: Icon(Icons.launch,
                color: Color.fromARGB(255, 0, 0, 0)), // Ubah warna ikon di sini
            label: Text(
              'Website Fakultas Ekonomi Bisnis',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black), // Ubah warna teks di sini
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(
                  207, 216, 220, 1), // Ubah warna latar belakang di sini
            ),
          ),
        ),
      ],
    );
  }
}

class Website {
  static final String website = 'https://febis.upnjatim.ac.id/';
}

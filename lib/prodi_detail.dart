import 'package:flutter/material.dart';
import 'prodi.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeProdiDetail extends StatelessWidget {
  final ProgramStudi programStudi;

  const HomeProdiDetail({Key? key, required this.programStudi})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(programStudi.nama),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "background2.jpg"), // Ubah dengan path ke gambar latar belakang Anda
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Card(
            elevation: 4, // Add elevation for a slight shadow
            color: Colors.white, // Ubah warna latar belakang card di sini
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Opacity(
                          opacity: 0.5, // Atur opacity sesuai keinginan
                          child: Image.asset(
                            programStudi.icon,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Center(
                        child: CircleAvatar(
                          radius: 97, // Atur ukuran sesuai keinginan
                          backgroundColor: const Color.fromARGB(255, 64, 64, 64)
                              .withOpacity(
                                  0.9), // Atur opacity sesuai keinginan
                          child: CircleAvatar(
                            radius: 95, // Atur ukuran sesuai keinginan
                            backgroundImage: AssetImage(programStudi.icon),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Profil ${programStudi.nama}:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    programStudi.deskripsi,
                    style: TextStyle(fontSize: 16),
                  ),
                  Divider(),
                  SizedBox(height: 16),
                  Text(
                    'Visi:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    programStudi.visi,
                    style: TextStyle(fontSize: 16),
                  ),
                  Divider(),
                  SizedBox(height: 16),
                  Text(
                    'Misi:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    programStudi.misi,
                    style: TextStyle(fontSize: 16),
                  ),
                  Divider(),
                  SizedBox(height: 16),
                  Text(
                    'Akreditasi:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '${programStudi.akreditasi}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Divider(),
                  SizedBox(height: 16),
                  Text(
                    'Ketua Program Studi:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    programStudi.ketuaProdi,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Center(
                    child: CircleAvatar(
                      radius: 97,
                      backgroundColor: const Color.fromARGB(255, 64, 64, 64)
                          .withOpacity(0.9),
                      child: CircleAvatar(
                        radius: 95,
                        backgroundImage: AssetImage(programStudi.gambarKaprodi),
                      ),
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 16),
                  Text(
                    'Dosen:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: programStudi.dosen.map((dosen) {
                      return Text(
                        '- $dosen',
                        style: TextStyle(fontSize: 16),
                      );
                    }).toList(),
                  ),
                  Divider(),
                  SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      launchURL(programStudi.website);
                    },
                    icon: Icon(Icons.public),
                    label: Text(
                      'Kunjungi Website Resmi',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton.icon(
                    onPressed: () {
                      _launchMailClient(programStudi.email);
                    },
                    icon: Icon(Icons.email),
                    label: Text(
                      'Kirim pesan Email           ',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 5),
                  Divider(),
                  SizedBox(height: 16),
                  SizedBox(height: 16),
                  Text(
                    'Prestasi Mahasiswa:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: programStudi.prestasiMahasiswa.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Icon(Icons.star),
                            title: Text(
                              programStudi.prestasiMahasiswa[index],
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(
                              height:
                                  5), // Spasi antara poin prestasi dan gambar
                          Padding(
                            padding: const EdgeInsets.only(
                                left:
                                    48.0), // Atur padding untuk gambar agar sesuai dengan indentasi poin prestasi
                            child: Image.asset(
                              programStudi.gambarPrestasi[index],
                              height:
                                  240, // Atur tinggi gambar sesuai kebutuhan Anda
                              width:
                                  240, // Atur lebar gambar sesuai kebutuhan Anda
                              fit: BoxFit.cover,
                            ),
                          ),
                          Divider(), // Garis pemisah antara setiap poin prestasi
                        ],
                      );
                    },
                  ),
                  Divider(),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchMailClient(String targetEmail) async {
    String mailUrl = 'mailto:$targetEmail';
    try {
      await launch(mailUrl);
    } catch (e) {
      throw 'Could not launch $mailUrl';
    }
  }
}

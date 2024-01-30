import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admission',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admission'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(25.0),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => launchUrl('https://poly23.dtemaharashtra.gov.in/diploma23//admin/uploads/2022POSTSSC_CAP2_Cutoff.pdf'),
                child: Text('Cutoff'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => launchUrl('https://example.com/othercolleges'),
                child: Text('Other Colleges'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DocumentsPage(),
                    ),
                  );
                },
                child: Text('Documents for Admission'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DocumentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Documents for Admission'),
        automaticallyImplyLeading: true, // This should enable the back button
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SubButton(
              buttonText: 'Domicile Certificate',
              link: 'https://services.india.gov.in/service/detail/maharashtra-age-nationality-and-domicile-certificate',
              imagePath: 'lib/assets/domecile.png',
              headerText: 'Domicile Certificate Header',
            ),
            SizedBox(height: 20),
            SubButton(
              buttonText: 'Nationality Certificate',
              link: 'https://revenue.delhi.gov.in/revenue/nationality-certificate',
              imagePath: 'lib/assets/nationality.png',
              headerText: 'Nationality Certificate Header',
            ),
            SizedBox(height: 20),
            SubButton(
              buttonText: 'Income Certificate',
              link: 'https://revenue.delhi.gov.in/revenue/income-certificate',
              imagePath: 'lib/assets/domecile.png',
              headerText: 'Income Certificate Header',
            ),
            SizedBox(height: 20),
            SubButton(
              buttonText: 'SSC Certificate',
              link: 'https://www.boardmarksheet.maharashtra.gov.in/emarksheet/',
              imagePath: 'lib/assets/marksheet.png',
              headerText: 'New Certificate Header',
            ),
          ],
        ),
      ),
    );
  }
}

class SubButton extends StatelessWidget {
  final String buttonText;
  final String link;
  final String imagePath;
  final String headerText;

  SubButton({
    required this.buttonText,
    required this.link,
    required this.imagePath,
    required this.headerText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubButtonPage(
              link: link,
              imagePath: imagePath,
              headerText: headerText,
            ),
          ),
        );
      },
      child: Text(buttonText),
    );
  }
}

class SubButtonPage extends StatelessWidget {
  final String link;
  final String imagePath;
  final String headerText;

  SubButtonPage({
    required this.link,
    required this.imagePath,
    required this.headerText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(headerText),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                launchUrl(link);
              },
              child: Text('Open Link'),
            ),
            SizedBox(height: 20),
            Container(
              width: 300,
              height: 500,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void launchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

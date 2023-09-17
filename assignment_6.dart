import 'package:flutter/material.dart';

void main() {
  runApp(PhotoGalleryApp());
}

class PhotoGalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PhotoGalleryScreen(),
    );
  }
}

class PhotoGalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Photo Gallery",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, // Center the title in the app bar
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Welcome to the Photo Gallery!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Search Photos",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            // Display the photo list with three photo cards in each row
            for (int i = 0; i < photoList.length; i += 3)
              Row(
                children: [
                  for (int j = i; j < i + 3 && j < photoList.length; j++)
                    Expanded(
                      child: PhotoCard(photoList[j]),
                    ),
                ],
              ),
            SizedBox(height: 20),
            // Display a simple list of three sample photos with titles and subtitles
            for (int i = 0; i < 3; i++)
              ListTile(
                leading: Image.network(samplePhotos[i].imageUrl),
                title: Text(samplePhotos[i].title),
                subtitle: Text(samplePhotos[i].subtitle),
              ),
            SizedBox(height: 20),
            // Centered Upload Photos button with an upload icon
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Show a Snackbar when the button is pressed
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Photos Uploaded Successfully!"),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: TextStyle(fontSize: 20),
                ),
                icon: Icon(Icons.cloud_upload), // Upload icon
                label: Text(""), // Empty label
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PhotoCard extends StatelessWidget {
  final Photo photo;

  PhotoCard(this.photo);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: GestureDetector(
        onTap: () {
          // Show a Snackbar when the image is tapped
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("You tapped on: ${photo.caption}"),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              photo.imageUrl,
              fit: BoxFit.cover,
              height: 100, // Adjust the height here to make photos smaller
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                photo.caption,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Photo {
  final String imageUrl;
  final String caption;

  Photo(this.imageUrl, this.caption);
}

class SamplePhoto {
  final String imageUrl;
  final String title;
  final String subtitle;

  SamplePhoto(this.imageUrl, this.title, this.subtitle);
}

List<Photo> photoList = [
  Photo(
    "https://images.unsplash.com/photo-1494905998402-395d579af36f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80", // Placeholder game poster 1
    "Car Poster 1",
  ),
  Photo(
    "https://images.unsplash.com/photo-1494976388531-d1058494cdd8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80", // Placeholder game poster 2
    "Car Poster 2",
  ),
  Photo(
    "https://images.unsplash.com/photo-1549927681-0b673b8243ab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80", // Placeholder game poster 3
    "Car Poster 3",
  ),
  Photo(
    "https://images.unsplash.com/photo-1503376780353-7e6692767b70?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80", // Placeholder game poster 4
    "Car Poster 4",
  ),
  Photo(
    "https://images.unsplash.com/photo-1511919884226-fd3cad34687c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80", // Placeholder game poster 5
    "Car poster 5",
  ),
  Photo(
    "https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1966&q=80", // Placeholder game poster 6
    "Car Poster 6",
  ),
];

List<SamplePhoto> samplePhotos = [
  SamplePhoto(
    "https://img.freepik.com/premium-photo/opened-book-with-flying-pages-butterflies-dark-backgroundgenerative-ai_391052-12859.jpg",
    "book 1",
    "Round the world",
  ),
  SamplePhoto(
    "https://images.unsplash.com/photo-1495446815901-a7297e633e8d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
    "book 2",
    "fantasy facts",
  ),
  SamplePhoto(
    "https://images.unsplash.com/photo-1497633762265-9d179a990aa6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2073&q=80",
    "book 3",
    "Life of life",
  ),
];


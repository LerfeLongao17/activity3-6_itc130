import 'dart:io';
import 'dart:async';

void main() {
  stdout.write('Please enter the file name: ');
  String? fileName = stdin.readLineSync();

  // If a file name is provided, attempt to read the file
  if (fileName != null && fileName.isNotEmpty) {
    readFile(fileName).catchError((e) {
      // Handle any errors that occur during file reading
      print('An error occurred: $e');
    });
  } else {
    print('No file name was entered. Please try again.');
  }
}

Future<void> readFile(String fileName) async {
  try {
    // Read the file as a string
    String fileContents = await File(fileName).readAsString();
    // Print the contents of the file
    print('File contents:\n$fileContents');
  } on FileSystemException catch (e) {
    // Handle the case where the file could not be read
    print('Could not read the file: ${e.message}');
  } catch (e) {
    // Handle any other exceptions that may occur
    print('An unexpected error occurred: $e');
  }
}

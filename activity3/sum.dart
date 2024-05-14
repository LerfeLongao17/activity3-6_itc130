import 'dart:io';

void main() async {
  var inputFile = File('num.txt');
  var outputFile = File('sums.txt');

  try {
    // Read all lines from the input file
    List<String> lines = await inputFile.readAsLines();
    if (lines.isEmpty) {
      throw Exception('The file is empty.');
    }
    // Convert lines to integers and calculate the sum
    int sum = lines.map((line) {
      // Check if the line is a valid integer
      int? number = int.tryParse(line);
      if (number == null) {
        throw FormatException('Invalid integer format', line);
      }
      return number;
    }).reduce((a, b) => a + b);
    // Write the sum to the output file
    await outputFile.writeAsString('Sum: $sum');
    print('The sum of the numbers has been written to sum.txt');
  } on FormatException catch (e) {
    print('Error: ${e.message} in line "${e.source}"');
  } catch (e) {
    print('An error occurred: $e');
  }
}

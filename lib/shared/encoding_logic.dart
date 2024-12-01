final Map<String, String> morseCodeMap = {
  'A': '.-',
  'B': '-...',
  'C': '-.-.',
  'D': '-..',
  'E': '.',
  'F': '..-.',
  'G': '--.',
  'H': '....',
  'I': '..',
  'J': '.---',
  'K': '-.-',
  'L': '.-..',
  'M': '--',
  'N': '-.',
  'O': '---',
  'P': '.--.',
  'Q': '--.-',
  'R': '.-.',
  'S': '...',
  'T': '-',
  'U': '..-',
  'V': '...-',
  'W': '.--',
  'X': '-..-',
  'Y': '-.--',
  'Z': '--..',
  '0': '-----',
  '1': '.----',
  '2': '..---',
  '3': '...--',
  '4': '....-',
  '5': '.....',
  '6': '-....',
  '7': '--...',
  '8': '---..',
  '9': '----.',
  '.': '.-.-.-',
  ',': '--..--',
  '?': '..--..',
  '!': '-.-.--',
  "'": '.----.',
  '/': '-..-.',
  '(': '-.--.',
  ')': '-.--.-',
  '&': '.-...',
  ':': '---...',
  ';': '-.-.-.',
  '=': '-...-',
  '+': '.-.-.',
  '-': '-....-',
  '_': '..--.-',
  '"': '.-..-.'
};

String encodeToMorse(String input) {
  // Trim the input to avoid extra spaces at the start or end
  input = input.trim();

  // Replace multiple spaces with a special marker, e.g., '*'
  input = input.replaceAll(RegExp(r' +'), '*');

  // Initialize the encoded string
  String encoded = '';

  // Morse code mapping

  // Iterate through the input string
  for (int i = 0; i < input.length; i++) {
    String char = input[i].toUpperCase();

    if (morseCodeMap.containsKey(char)) {
      // Add the corresponding Morse code for the character
      encoded += morseCodeMap[char]! + ' ';
    } else if (char == '*') {
      // If it's a space between words (i.e., multiple spaces in input), add a long gap
      encoded += '  / '; // Use '/' to represent a space between words
    }
  }

  return encoded.trim();
}

// Reverse the map to decode Morse to plain text
final Map<String, String> morseToTextMap =
    morseCodeMap.map((key, value) => MapEntry(value, key));

// Function to decode Morse code into plain text
String decodeMorse(String morse) {
  // Split Morse code into words using '/'
  List<String> words = morse.trim().split('/');

  // Decode each word
  return words.map((word) {
    // Split the word into letters and decode each one
    return word.split(' ').map((char) {
      return morseToTextMap[char] ??
          ''; // Look up Morse code and return plain text
    }).join(); // Combine letters to form a word
  }).join(' '); // Combine words to form a sentence
}

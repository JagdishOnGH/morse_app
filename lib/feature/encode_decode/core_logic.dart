class EncodeDecodeCoreLogic {
  // singleton object
  static final EncodeDecodeCoreLogic _singleton =
      EncodeDecodeCoreLogic._internal();

  // private internal constructor
  EncodeDecodeCoreLogic._internal();

  // factory method to return the singleton object
  factory EncodeDecodeCoreLogic() => _singleton;
  final Map<String, String> _morseCodeMap = {
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

      if (_morseCodeMap.containsKey(char)) {
        // Add the corresponding Morse code for the character
        encoded += _morseCodeMap[char]! + ' ';
      } else if (char == '*') {
        // If it's a space between words (i.e., multiple spaces in input), add a long gap
        encoded += '  / '; // Use '/' to represent a space between words
      }
    }

    return encoded.trim();
  }

// Function to decode Morse code into plain text
  String decodeMorse(String morse) {
    final Map<String, String> morseToTextMap =
        _morseCodeMap.map((key, value) => MapEntry(value, key));

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
}

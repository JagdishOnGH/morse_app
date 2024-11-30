class InputKey {
  final String key;
  final bool IsBackspace;
  final bool isSpace;
  final String? morseValue;

  InputKey({
    required this.key,
    this.IsBackspace = false,
    this.isSpace = false,
    this.morseValue,
  });
}

InputKey backspaceKey = InputKey(key: '⌫', IsBackspace: true);
InputKey spaceKey = InputKey(key: 'SPACE', isSpace: true);
InputKey A = InputKey(key: 'A', morseValue: '.-');
// go till z from B
InputKey B = InputKey(key: 'B', morseValue: '-...');
InputKey C = InputKey(key: 'C', morseValue: '-.-.');
InputKey D = InputKey(key: 'D', morseValue: '-..');
InputKey E = InputKey(key: 'E', morseValue: '.');
InputKey F = InputKey(key: 'F', morseValue: '..-.');
InputKey G = InputKey(key: 'G', morseValue: '--.');
InputKey H = InputKey(key: 'H', morseValue: '....');
InputKey I = InputKey(key: 'I', morseValue: '..');
InputKey J = InputKey(key: 'J', morseValue: '.---');
InputKey K = InputKey(key: 'K', morseValue: '-.-');
InputKey L = InputKey(key: 'L', morseValue: '.-..');
InputKey M = InputKey(key: 'M', morseValue: '--');
InputKey N = InputKey(key: 'N', morseValue: '-.');
InputKey O = InputKey(key: 'O', morseValue: '---');
InputKey P = InputKey(key: 'P', morseValue: '.--.');
InputKey Q = InputKey(key: 'Q', morseValue: '--.-');
InputKey R = InputKey(key: 'R', morseValue: '.-.');
InputKey S = InputKey(key: 'S', morseValue: '...');
InputKey T = InputKey(key: 'T', morseValue: '-');
InputKey U = InputKey(key: 'U', morseValue: '..-');
InputKey V = InputKey(key: 'V', morseValue: '...-');
InputKey W = InputKey(key: 'W', morseValue: '.--');
InputKey X = InputKey(key: 'X', morseValue: '-..-');
InputKey Y = InputKey(key: 'Y', morseValue: '-.--');
InputKey Z = InputKey(key: 'Z', morseValue: '--..');
List<InputKey> alphabtes = [
  A,
  B,
  C,
  D,
  E,
  F,
  G,
  H,
  I,
  J,
  K,
  L,
  M,
  N,
  O,
  P,
  Q,
  R,
  S,
  T,
  U,
  V,
  W,
  X,
  Y,
  Z,
];

//special keys

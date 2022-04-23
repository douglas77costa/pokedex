abstract class PokemonTypes {
  static Type normal = Type(code: 1, color: '9099A1');
  static Type fighting = Type(code: 2, color: 'CE4069');
  static Type flying = Type(code: 3, color: '8FA8DD');
  static Type poison = Type(code: 4, color: 'AB6AC8');
  static Type ground = Type(code: 5, color: 'D97746');
  static Type rock = Type(code: 6, color: 'C7B78B');
  static Type bug = Type(code: 7, color: '90C12C');
  static Type ghost = Type(code: 8, color: '5269AC');
  static Type steel = Type(code: 9, color: '5A8EA1');
  static Type fire = Type(code: 10, color: 'FF9C54');
  static Type water = Type(code: 11, color: '4D90D5');
  static Type grass = Type(code: 12, color: '63BB5B');
  static Type electric = Type(code: 13, color: 'F3D23B');
  static Type psychic = Type(code: 14, color: 'F97176');
  static Type ice = Type(code: 15, color: '74CEC0');
  static Type dragon = Type(code: 16, color: '0A6DC4');
  static Type dark = Type(code: 17, color: '5A5366');
  static Type fairy = Type(code: 18, color: 'EC8FE6');

  static Type getType(int code) {
    switch (code) {
      case 1:
        return normal;
      case 2:
        return fighting;
      case 3:
        return flying;
      case 4:
        return poison;
      case 5:
        return ground;
      case 6:
        return rock;
      case 7:
        return bug;
      case 8:
        return ghost;
      case 9:
        return steel;
      case 10:
        return fire;
      case 11:
        return water;
      case 12:
        return grass;
      case 13:
        return electric;
      case 14:
        return psychic;
      case 15:
        return ice;
      case 16:
        return dragon;
      case 17:
        return dark;
      case 18:
        return fairy;
      default:
        return normal;
    }
  }
}

class Type {
  final int code;
  final String color;

  Type({required this.code, required this.color});
}

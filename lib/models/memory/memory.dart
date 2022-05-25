class Memory {
  String _value = '0';

  void applyComand(String comand) {
    if (comand == 'AC') {
      _allClear();
    } else {
      _value += comand;
    }
  }

  _allClear() {
    _value = '0';
  }

  String get value {
    return _value;
  }
}

class Memory {
  static const operations = [
    '%',
    '/',
    'X',
    '-',
    '+',
    '=',
  ];

  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  String? _operation;
  String _value = '0';
  bool _wipeValue = false;
  String? _lastComand;

  void applyComand(String comand) {
    if (_isReplacingOperation(comand)) {
      _operation = comand;
      return;
    }
    if (comand == 'AC') {
      _allClear();
    } else if (operations.contains(comand)) {
      _setOperation(comand);
    } else {
      _addDigit(comand);
    }

    _lastComand = comand;
  }

  _isReplacingOperation(String comand) {
    return operations.contains(_lastComand) &&
        operations.contains(comand) &&
        _lastComand != '=' &&
        comand != '=';
  }

  _setOperation(String newOperation) {
    bool isEqualSign = newOperation == '=';
    if (_bufferIndex == 0) {
      if (!isEqualSign) {
        _operation = newOperation;
        _bufferIndex = 1;
        _wipeValue = true;
      }
    } else {
      _buffer[0] = _calculate();
      _buffer[1] = 0.0;
      _value = _buffer[0].toString();
      _value = _value.endsWith('.0') ? _value.split('.')[0] : _value;

      _operation = isEqualSign ? null : newOperation;
      _bufferIndex = isEqualSign ? 0 : 1;
    }

    _wipeValue = true; // para reutilizar o resultado => !isEqualSign;
  }

  _addDigit(String digit) {
    final isDot = digit == '.';
    final wipeValue = (_value == '0' && !isDot) || _wipeValue;

    if (isDot && _value.contains('.') && !wipeValue) {
      return;
    }

    final emptyValue = isDot ? '0' : '';
    final currentValue = wipeValue ? '' : _value;
    _value = currentValue + digit;
    _wipeValue = false;

    _buffer[_bufferIndex] = double.tryParse(_value) ?? 0;
  }

  _allClear() {
    _value = '0';
    _buffer.setAll(0, [0.0, 0.0]);
    _operation = null;
    _bufferIndex = 0;
    _wipeValue = false;
  }

  _calculate() {
    switch (_operation) {
      case '%':
        return _buffer[0] % _buffer[1];
      case '/':
        return _buffer[0] / _buffer[1];
      case 'X':
        return _buffer[0] * _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      case '+':
        return _buffer[0] + _buffer[1];
      default:
        return _buffer[0];
    }
  }

  String get value {
    return _value;
  }
}

extension CapString on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach =>
      this.split(" ").map((str) => str.inCaps).join(" ");
}

/// final helloWorld = 'hello world'.inCaps; // 'Hello world'
/// final helloWorld = 'hello world'.allInCaps; // 'HELLO WORLD'
/// final helloWorld = 'hello world'.capitalizeFirstofEach; // 'Hello World'zz
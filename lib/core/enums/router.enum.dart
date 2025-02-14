enum RouterEnum {
  house(path: 'house'),
  battery(path: 'battery'),
  solar(path: 'solar');

  final String path;

  const RouterEnum({required this.path});

  String get navigation => '/$path';
}

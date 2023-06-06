class ArgumentType {
  final bool isRequired;
  final String key;
  final Type type;

  const ArgumentType({
    this.isRequired = true,
    required this.key,
    required this.type,
  });
}

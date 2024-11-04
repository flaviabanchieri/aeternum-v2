import 'package:collection/collection.dart';

enum Pagina {
  dashboard,
  leads,
  produtos,
  perfil,
  relatorio,
}

enum Andamento {
  LigarParaCliente,
  EmAndamento,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Pagina):
      return Pagina.values.deserialize(value) as T?;
    case (Andamento):
      return Andamento.values.deserialize(value) as T?;
    default:
      return null;
  }
}
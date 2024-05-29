extension StringConverterToBrlExtension on String {
  String converterToBRL() {
    double value = double.tryParse(this) ?? 0.0;
    return 'R\$ ${value.toStringAsFixed(2).replaceAll('.', ',')}';
  }
}

class GoogleSelectBoxItem {
  final String label;
  final dynamic value;

  GoogleSelectBoxItem({
    required this.label,
    required this.value,
  });

  GoogleSelectBoxItem copyWith({
    String? label,
    dynamic value,
  }) {
    return GoogleSelectBoxItem(
      label: label ?? this.label,
      value: value ?? this.value,
    );
  }
}

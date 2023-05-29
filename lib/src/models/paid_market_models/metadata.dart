class Metadata {
  final String? sourceSync;

  const Metadata({
    this.sourceSync,
  });

  @override
  String toString() => 'Metadata(sourceSync: $sourceSync)';

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      sourceSync: json['source_sync'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'source_sync': sourceSync,
    };
  }

  Metadata copyWith({
    String? sourceSync,
  }) {
    return Metadata(
      sourceSync: sourceSync ?? this.sourceSync,
    );
  }

  List<Object> get props => [
        sourceSync!,
      ];
}

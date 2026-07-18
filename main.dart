void main() {
  final mensagens = <String>[
    'Bem-vindas e bem-vindos ao projeto!',
    'Fala galera! Bruno na area.',
    'Olá, pessoal! Sejam bem-vindos à nossa equipe.',
    // =====================================================================
    'Bons commits para todos.',
  ];

  print('===== MURAL DA EQUIPE =====');
  for (final msg in mensagens) {
    print('- $msg');
  }
  print('===========================');
}

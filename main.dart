void main() {
  final mensagens = <String>[
    'Bem-vindas e bem-vindos ao projeto!',
    'Ola! Aqui é  Arthur, bora codar!',
    'Olá, pessoal! Sejam bem-vindos à nosso grupo.',
    // =====================================================================
    'Bons commits para todos.',
  ];

  print('===== MURAL DA EQUIPE =====');
  for (final msg in mensagens) {
    print('- $msg');
  }
  print('===========================');
}

import 'package:test/test.dart';
import 'package:tebak_angka/tebak_angka.dart';

void main() {
  test('Angka benar harus berada antara 1 dan 10', () {
    final game = GameTebakAngka();
    expect(game.angkaBenar >= 1 && game.angkaBenar <= 10, isTrue);
  });

  test('cekTebakanBenar() mengembalikan true jika tebakan sama', () {
    final game = GameTebakAngka();
    final benar = game.angkaBenar;
    expect(game.cekTebakanBenar(benar), isTrue);
  });

  test('cekTebakanBenar() mengembalikan false jika tebakan salah', () {
    final game = GameTebakAngka();
    int salah = game.angkaBenar == 1 ? 2 : game.angkaBenar - 1;
    expect(game.cekTebakanBenar(salah), isFalse);
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:meal/src/features/registration/domain/entities/member.dart';

void main() {
  Member? member;
  test('Initialize member', () {
    member = Member();
    expect(member, isA<Member>());
  });
  test('Give value to property', () {
    member = Member(id: 1, name: 'riza');

    expect(member?.id, equals(1));
    expect(member?.name, equals('riza'));
  });
  test('Compare member class', () {
    var member_1 = Member(id: 1, name: 'riza');
    var member_2 = Member(id: 1, name: 'riza');
    expect(member_1 == member_2, isTrue);

    var member_3 = Member(id: 1, name: 'riza');
    var member_4 = Member(id: 1, name: 'fahru');
    expect(member_3 == member_4, isFalse);
  });
}

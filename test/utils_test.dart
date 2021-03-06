// Copyright 2015 Google Inc. All Rights Reserved.
// Licensed under the Apache License, Version 2.0, found in the LICENSE file.

/// Unit tests for utilities.
library utils_tests;

import 'package:doc_coverage/doc_coverage_common.dart';
import 'package:test/test.dart';

void main() {
  test('Shapeshift utils: pluralize pluralizes', () {
    expect(pluralize('parameter'), equals('parameters'));
    expect(pluralize('class'), equals('classes'));
    expect(pluralize('annotations'), equals('annotations'));
  });

  test('Shapeshift utils: pretty prettifies', () {
    expect(pretty({'a': 'b'}), equals('{\n  "a": "b"\n}'));
  });

  test('Shapeshift utils: singularize singularizes', () {
    expect(singularize('annotations'), equals('annotation'));
    expect(singularize('return'), equals('return'));
  });

  test('Shapeshift utils: annotationFormatter formats annotations', () {
    Map ann = {'name': 'Foo'};
    expect(formattedAnnotation(ann), equals('`@Foo`'));
    expect(formattedAnnotation(ann, backticks: false), equals('@Foo'));
  });

  group('Shapeshift utils: methodSignature', () {
    List<Map> type = [{'outer': 'String', 'inner': []}];
    Map method = {
      'name': 'foo',
      'qualifiedName': 'dart-foo.Foo.foo',
      'comment': '',
      'return': type,
      'annotations': [],
      'parameters': new Map(),
      //'constant': false,
      //'final': false,
      'static': false,
    };

    test('of plain ole\' method', () {
      expect(methodSignature(method), equals('String foo()'));
    });

    test('of getter method', () {
      expect(methodSignature(method, includeParens: false), equals('String foo'));
    });

    test('of constructor method', () {
      Map m = new Map.from(method)
        ..['name'] = ''
        ..['qualifiedName'] = 'dart-foo.Foo.Foo-';
      expect(methodSignature(m, includeReturn: false), equals('Foo()'));
    });
  });

  group('Shapeshift utils: variableSignature', () {
    List<Map> type = [{'outer': 'String', 'inner': []}];
    Map variable = {
      'name': 'foo',
      'type': type,
      'annotations': [],
      'constant': false,
      'final': false,
      'static': false,
    };

    test('of plain ole\' variable', () {
      expect(variableSignature(variable), equals('String foo;'));
    });

    test('of const variable', () {
      Map v = new Map.from(variable)..['constant'] = true;
      expect(variableSignature(v), equals('const String foo;'));
    });

    test('of final variable', () {
      Map v = new Map.from(variable)..['final'] = true;
      expect(variableSignature(v), equals('final String foo;'));
    });

    test('of static variable', () {
      Map v = new Map.from(variable)..['static'] = true;
      expect(variableSignature(v), equals('static String foo;'));
    });
  });

  test('Shapeshift utils: associatedLibraryJsonPath works on good input', () {
    String classPath = '/directory/dart-foo.Foo.json';
    expect(associatedLibraryJsonPath(classPath), equals('dart-foo.json'));
  });

  test('Shapeshift utils: associatedLibraryJsonPath works on bad input', () {
    String classPath = '/directory/dart-foo.json';
    expect(associatedLibraryJsonPath(classPath), isNull);
  });
}

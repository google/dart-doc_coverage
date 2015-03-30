Dart doc coverage
=================

The Dart doc coverage tool examines a Dart library (or package), judging the
comments of the public API. Dart doc coverage examines exactly the comments
that will appear at dartdocs.org (e.g. [path's
docs](http://www.dartdocs.org/documentation/path/1.3.4/))

* _0%_ means that a library or class has 0 comments on any methods, variables,
  etc.
* _100%_ means that a library or class has a comment for every method,
  variable, etc., and that each comment is formatted properly, according to
  some opinions.

Currently, Dart doc coverage examines the comments of:

* libraries
* classes
* typedefs
* errors
* library-level functions
* library-level variables
* class-level methods (constructors, getters, setters, methods, operators)
* class-level variables

In general, the formatting of comments is expected to follow the
[Guidelines for Dart Doc Comments](https://www.dartlang.org/articles/doc-comment-guidelines/).
Specifically, the Dart doc coverage tool checks the following rules:

Rules
=====

* The following should have a comment: classes, methods, getters, setters,
  operators, constructors, and variables.
* The first paragraph of any comment should be a one-sentence description.
* A method comment should have at least two paragraphs. A variable comment
  can have just one.
* A comment should end with a period.

License
-------

[Apache v2](LICENSE)

Contributing
------------

Contributions welcome! Please read the
[contribution guidelines](CONTRIBUTING.md).

Disclaimer
----------

This is not an official Google product.

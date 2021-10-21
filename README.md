[![Actions Status](https://github.com/tbrowder/DateTime-US/workflows/test/badge.svg)](https://github.com/tbrowder/DateTime-US/actions)

NAME
====

DateTime::US - Provides timezone and DST infomation for US states and territories

SYNOPSIS
========

```raku
use DateTime::US;
```

DESCRIPTION
===========

Module **DateTime::US** provides a class used to help Raku programs needing US timezone and DST information. The use creates a DateTime::US object by providing a US timezone abbreviation. The list of known data may be listed without an object:

    $ raku
    > use DateTime::US;
    > DateTime::US.show;

AUTHOR
======

Tom Browder <tbrowder@cpan.org>

COPYRIGHT AND LICENSE
=====================

Copyright © 2021 Tom Browder

This library is free software; you may redistribute or modify it under the Artistic License 2.0.


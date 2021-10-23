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

Module **DateTime::US** provides a class and functions used to help Raku programs needing US timezone and DST information. The user creates a DateTime::US object by providing a US timezone abbreviation. The list of known data may be listed without an object:

    $ raku
    > use DateTime::US;
    > show-us-data;

The main use case that motivated the module is to convert time in UTC to local time for creating calendars and almanacs. For example, local Sunrise is given in UTC and will normally be shown on a calendar in local time:

    my $tz = DateTime.new: :timezone('CST');
    my $sunrisez = 2022-10-03T05:45:00Z;
    my $localtime = $tz.to-local :utc($sunrisez);

Class DateTime::US methods
--------------------------

list
====

method to-localtime(DateTime :$utc! --> DateTime) {...}

Given a time in UTC, convert to local time and adjust for DST.

list
====

method to-utc(DateTime :$localtime! --> DateTime) {...}

Given a local time, convert to UTC with adjustment for DST.

DateTime::US subroutines
------------------------

list
====

sub begin-dst($year --> DateTime) {...}

Return the time when DST begins.

list
====

sub end-dst($year --> DateTime) {..}

Return the time when DST ends.

list
====

sub is-dst(DateTime :$localtime! --> Bool) {...}

Return True if the local time is DST, otherwise return False.

list
====

sub show-us-data(--> Str) {...}

List the time zone and DST data being used.

TODO
====

Provide handling for the exceptions to use of DST where indicated.

NOTE
====

The author is happy to create or collaborate on a similar module for other regions. If interested, simply file an issue or discuss it on IRC #raku (author's handle is 'tbrowder').

AUTHOR
======

Tom Browder <tbrowder@cpan.org>

COPYRIGHT AND LICENSE
=====================

Copyright © 2021 Tom Browder

This library is free software; you may redistribute or modify it under the Artistic License 2.0.


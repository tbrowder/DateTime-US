[![Actions Status](https://github.com/tbrowder/DateTime-US/actions/workflows/linux.yml/badge.svg)](https://github.com/tbrowder/DateTime-US/actions) [![Actions Status](https://github.com/tbrowder/DateTime-US/actions/workflows/macos.yml/badge.svg)](https://github.com/tbrowder/DateTime-US/actions) [![Actions Status](https://github.com/tbrowder/DateTime-US/actions/workflows/windows.yml/badge.svg)](https://github.com/tbrowder/DateTime-US/actions)

NAME
====

**DateTime::US** - Provides time zone (TZ) and Daylight Saving Time (DST) information for US states and territories

SYNOPSIS
========

```raku
use DateTime::US;
use DateTime::Subs; # part of the Date::Time distribution
```

DESCRIPTION
===========

Module **DateTime::US** provides a class with methods used to help Raku programs needing US time zone and DST information. The user creates a `DateTime::US` object by providing a US time zone abbreviation (note the TZ input abbreviation may be in either format for standard or daylight saving time, e.g., 'CST' or 'CDT'). The list of known data may be listed without an object:

    $ raku
    > use DateTime::US;
    > show-us-data;

The main use case that motivated the module is to convert time in UTC to local time for creating calendars and almanacs. For example, local Sunrise is given in UTC and will normally be shown on a calendar in local time:

    my $tz = DateTime.new: :timezone('CST');
    my $sunrisez = DateTime.new: "2022-10-03T05:45:00Z";
    my $localtime = $tz.to-localtime :utc($sunrisez);

Class methods
-------------

  * **to-localtime**(DateTime :$utc! --> DateTime) {...}

    Given a time in UTC, convert to local time and adjust for DST.

  * **to-utc**(DateTime :$localtime! --> DateTime) {...}

    Given a local time, convert to UTC with adjustment for DST.

SEE ALSO
========

  * Module **DateTime::Timezones:auth<zef:guifa>**

    In contrast to Matthew Stuckwisch's module, this module does not use any of the IANA timezone database and relies only on the power of the Raku DateTime type, the short list of time zone UTC offsets for standard US time zones, and the standard dates and time of Daylight Saving Time begin/end enshrined in US Public Law.

Todo
====

Provide handling for the exceptions to the use of DST where indicated.

Note
====

The author is happy to create or collaborate on a similar module for other regions. If interested, simply file an issue or discuss it on IRC #raku (author's handle is 'tbrowder').

AUTHOR
======

Tom Browder <tbrowder@acm.org>

COPYRIGHT AND LICENSE
=====================

© 2021-2024 Tom Browder

This library is free software; you may redistribute or modify it under the Artistic License 2.0.


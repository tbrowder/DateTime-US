[![Actions Status](https://github.com/tbrowder/DateTime-US/actions/workflows/linux.yml/badge.svg)](https://github.com/tbrowder/DateTime-US/actions) [![Actions Status](https://github.com/tbrowder/DateTime-US/actions/workflows/macos.yml/badge.svg)](https://github.com/tbrowder/DateTime-US/actions) [![Actions Status](https://github.com/tbrowder/DateTime-US/actions/workflows/windows.yml/badge.svg)](https://github.com/tbrowder/DateTime-US/actions)

NAME
====

**DateTime::US** - Provides time zone (TZ) and Daylight Saving Time (DST) information for US states and territories

SYNOPSIS
========

```raku
use DateTime::US;
use DateTime::Subs; # part of the 'DateTime::US' distribution
```

DESCRIPTION
===========

Module **DateTime::US** provides a class with methods used to help Raku programs needing US time zone and DST information. The user creates a `DateTime::US` object by providing a US time zone abbreviation (note the TZ input abbreviation may be in either format for standard or daylight saving time, e.g., 'CST' or 'CDT'). The list of known data may be listed without an object:

    $ raku
    > use DateTime::US;
    > show-us-data;

The main use case that motivated the module is to convert time in UTC to local time for creating calendars and almanacs. For example, local Sunrise is given in UTC and will normally be shown on a calendar in local time:

    my $tz = DateTime::US.new: :timezone<CST>;
    my $sunriseZ = DateTime.new: "2024-02-21T12:23:00Z";
    say $sunriseZ; # OUTPUT: «2024-02-21T12:23:00Z␤»
    my $localtime = $tz.to-localtime :utc($sunriseZ);
    say $localtime; # OUTPUT: «2024-02-21T06:23:00 CST␤»

Class methods
-------------

  * **to-localtime**(DateTime :$utc! --> DateTime) {...}

    Given a time in UTC, convert to local time and adjust for DST.

  * **to-utc**(DateTime :$localtime! --> DateTime) {...}

    Given a local time, convert to UTC with adjustment for DST.

Subroutines
-----------

It is useful to have a "perpetual" calculation of the begin/end dates for DST for all years covered by the current governing federal law for the US. Assisted by the `Date::Utils` module, the following routines do that, and they require an `export` tag for use to avoid possible conflict from other modules.

The `:$year` argument defaults to the current year if it is not provided.

  * begin-dst(:$year --> Date) is export(:begin-dst) {...}

  * dst-begin(:$year --> Date) is export(:dst-begin) {...} # alias for begin-dst

  * end-dst(:$year --> Date) is export(:end-dst) {...}

  * dst-end(:$year --> Date) is export(:dst-end) {...} # alias for end-dst

The final routine is for use by module `Date::Event`. The `:$set-id` argument is used to provide a globally unique ID (GUID) to allow multiple `Date::Event` objects for a `Date` in a `Hash` keyed by `Date`s.

  * get-dst-dates(:$year!, :$set-id! --> Hash) is export(:get-dst-date) {...}

SEE ALSO
========

  * Module **DateTime::Timezones:auth\<zef:guifa\>**

    In contrast to Matthew Stuckwisch's module, `DateTime::US` does not use any of the IANA timezone database. It relies only on the power of the Raku `Date` and `DateTime` types, the short list of time zone UTC offsets for standard US time zones, the standard dates and time of Daylight Saving Time begin/end times enshrined in US Public Law, and the "perpetual" `Date` routines provided by module `Date::Utils`.

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


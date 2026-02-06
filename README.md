[![Actions Status](https://github.com/lizmat/mod-div-specs/actions/workflows/linux.yml/badge.svg)](https://github.com/lizmat/mod-div-specs/actions) [![Actions Status](https://github.com/lizmat/mod-div-specs/actions/workflows/macos.yml/badge.svg)](https://github.com/lizmat/mod-div-specs/actions) [![Actions Status](https://github.com/lizmat/mod-div-specs/actions/workflows/windows.yml/badge.svg)](https://github.com/lizmat/mod-div-specs/actions)

NAME
====

mod-div-specs - provide infix div / mod according to spec

SYNOPSIS
========

```raku
use mod-div-specs;

say 42 div 7;    # 6
say 42.2 div 7;  # Cannot resolve caller infix:<div>(Rat:D, Int:D)

say 42 mod 9;    # 6
say 42.2 mod 9;  # Cannot resolve caller infix:<mod>(Rat:D, Int:D)
```

DESCRIPTION
===========

The `mod-div-specs` exports a version of the `infix div` and `infix mod` operators that match the description in the old design documents of what is now the [Raku Programming Language](https://raku.org).

In this design, `div` and `mod` (as integer optimized versions of `/` and `%`) would **only** accept integer arguments. Several changes in the Rakudo implementation of Raku added automatic coercions at various times, with sometimes unexpected results.

This distribution attempts to create a clear interface, with immediate execution errors if the interface was not adhered to.

AUTHOR
======

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/mod-dive-specs . Comments and Pull Requests are welcome.

If you like this module, or what I'm doing more generally, committing to a [small sponsorship](https://github.com/sponsors/lizmat/) would mean a great deal to me!

COPYRIGHT AND LICENSE
=====================

Copyright 2026 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.


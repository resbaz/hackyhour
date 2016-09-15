HackyHour Roster
====

Hacky Hour is a weekly event at University of Melbourne 
where Graduate students and early career researchers can come along
to seek help with programming problems, or just hang out with people
who love digital research.
Hacky Hour takes place every Thursday, 3pm-4pm, at [Tsubu](http://tsububar.com.au).
For more information,
see [the Hacky Hour homepage](http://melbourne.resbaz.edu.au/hackyhour).

This repository is for current Research Platforms Services staff
to manage Hacky Hour, especially the roster of weekly hosts.

[Go to current roster](./roster.md)

To modify the roster, see [Contributing](./CONTRIBUTING.md).

With some exceptions, the content in this repository is _not_ under an open licence.
See [LICENCE](./LICENSE.md) for more information.


Host checklist
----
 
□ Book table with Kevin at Tsubu (making sure he is happy with us and that we are bringing him business). <br/>
□ Billboard poster is in good condition and atop the main table for all who enter easily able to see. <br/>
□ ResBaz stickers and tattoos are available (when printed), training catalogue is available for handing out. <br/>
□ Whoever is hosting is responsible for saying "hi" to everyone who shows up & checking them into the HackyHour digital guestbook (IMPORTANT) <br/>
□ Buying drinks for any noobs who show up and introducing them around to at least 2 people they've not yet met before. <br/>
□ Tweet (especially photos) from the @ResPlat account & tag #HackyHour.


Scripts
----

Under [`./scripts`](./scripts) is a small program for generating a roster.
It uses a list of names, and a list of names to exclude,
both stored under [`./data`](./data).

You can generate a basic CSV roster by running the following command in the
current directory:

~~~{.sh}
$ ./scripts/roster-gen.sh
~~~

For usage information, including a list of options, you can run,

~~~{.sh}
$ ./scripts/roster-gen.sh -h
~~~

To generate a markdown table starting from the week 2016-09-29:

~~~{.sh}
$ ./scripts/roster-gen.sh -c -d"|" -s "29 September 2016 + 1 week"
~~~

The script assumes you have Bash and other common Unix command line software
installed.


From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Beginnings of a style guide
Date: Fri, 03 Jan 2014 15:55:56 +1300
Message-ID: <52C626BC.8040206@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello all,

One of the things that's long been on my list is to create a 
style guide for man pages, which gives style guidelines on some
common issues specific to writing man pages. Prompted my Mike 
Frysinger, I've made a start by including a STYLE GUIDE 
section in man-pages(7). Comment, suggested improvements, and
so on, welcome.

Cheers,

Michael

(The complete page source can be found in git,
https://www.kernel.org/doc/man-pages/download.html )


.SH STYLE GUIDE
The following subsections represent the beginnings of a style guide
for the
.IR "man-pages"
project.
For details not covered below, the Chicago Manual of Style
is usually a good source.
.SS Use of gender-neutral language
As far as possible, use gender-neutral language in the text of man
page.
Use of "they" ("them", "themself", "their") as a gender-neutral singular
pronoun is acceptable for pages in the
.IR man-pages 
project.
.SS Font conventions
.PP
For functions, the arguments are always specified using italics,
.IR "even in the SYNOPSIS section" ,
where the rest of the function is specified in bold:
.PP
.BI "    int myfunction(int " argc ", char **" argv );
.PP
Variable names should, like argument names, be specified in italics.
.PP
Filenames (whether pathnames, or references to files in the
.I /usr/include
directory)
are always in italics (e.g.,
.IR <stdio.h> ),
except in the SYNOPSIS section, where included files are in bold (e.g.,
.BR "#include <stdio.h>" ).
When referring to a standard include file under
.IR /usr/include ,
specify the header file surrounded by angle brackets,
in the usual C way (e.g.,
.IR <stdio.h> ).
.PP
Special macros, which are usually in upper case, are in bold (e.g.,
.BR MAXINT ).
Exception: don't boldface NULL.
.PP
When enumerating a list of error codes, the codes are in bold (this list
usually uses the
.B \&.TP
macro).
.PP
Complete commands should, if long,
be written as an indented line on their own, for example
.in +4n
.nf

man 7 man-pages

.fi
.in
If the command is short, then it can be included inline in the text,
in italic format, for example,
.IR "man 7 man-pages" .
In this case, it may be worth using nonbreaking spaces
("\e\ ") at suitable places in the command.
Command options should be written in italics (e.g.,
.IR \-l ).
.PP
Expressions, if not written on a separate indented line, should
be specified in italics.
Again, the use of nonbreaking spaces may be appropriate
if the expression is inlined with normal text.
.PP
Any reference to the subject of the current manual page
should be written with the name in bold.
If the subject is a function (i.e., this is a Section 2 or 3 page),
then the name should be followed by a pair of parentheses
in Roman (normal) font.
For example, in the
.BR fcntl (2)
man page, references to the subject of the page would be written as:
.BR fcntl ().
The preferred way to write this in the source file is:
.nf

    .BR fcntl ()

.fi
(Using this format, rather than the use of "\\fB...\\fP()"
makes it easier to write tools that parse man page source files.)
.PP
Any reference to another man page
should be written with the name in bold,
.I always
followed by the section number,
formatted in Roman (normal) font, without any
separating spaces (e.g.,
.BR intro (2)).
The preferred way to write this in the source file is:
.nf

    .BR intro (2)

.fi
(Including the section number in cross references lets tools like
.BR man2html (1)
create properly hyperlinked pages.)

Control characters should be written in bold face,
with no quotes; for example,
.BR ^X .
.SS Spelling
Starting with release 2.59,
.I man-pages
follows American spelling conventions
(previously, there was a random mix of British and American spellings);
please write all new pages and patches according to these conventions.

Aside from the well-known spelling differences,
there are a few other subtleties to watch for:
.IP * 3
American English tends to use the forms "backward" "upward", 'toward",
and so on
rather than the British forms "backwards", upwards", "towards", and so on.
.SS BSD version numbers
The classical scheme for writing BSD version numbers is
.IR x.yBSD ,
where
.I x.y
is the version number (e.g., 4.2BSD).
Avoid forms such as
.IR "BSD 4.3" .
.SS Capitalization
In subsection ("SS") headings,
capitalize the first word in the heading, but otherwise use lower case,
except where English usage (e.g., proper nouns) or programming
language requirements (e.g., identifier names) dictate otherwise.
.SS Indentation of structure definitions, shell session logs, etc.
When structure definitions, shell session logs, and so on are included
in running text, indent them by 4 spaces (i.e., a block enclosed by
.I ".in\ +4n"
and
.IR ".in" ).
.SS Preferred terms
The following table lists some preferred terms to use in man pages,
mainly to ensure consistency across pages.
.ad l
.TS
l l l
---
l l l.
Term	Avoid using	Notes

bit mask	bitmask
built-in	builtin
Epoch	epoch	T{
For the UNIX Epoch (00:00:00, 1 Jan 1970 UTC)
T}
filename	file name
hostname	host name
inode	i-node
pathname	path name
pseudoterminal	pseudo-terminal
privileged port	T{
reserved port,
system port
T}
real-time	T{
realtime,
real-time
T}
run time	runtime
saved set-group-ID	T{
saved group ID,
saved set-GID
T}
saved set-user-ID	T{
saved user ID,
saved set-UID
T}
set-group-ID	set-GID, setgid
set-user-ID	set-UID, setuid
superuser	T{
super user,
super-user
T}
timestamp	time stamp
timezone	time zone
user space	userspace
username	user name
zeros	zeroes
.TE
.ad
.SS Terms to avoid
The following table lists some terms to avoid using in man pages,
along with some suggested alternatives,
mainly to ensure consistency across pages.
.ad l
.TS
l l l
---
l l l.
Avoid	Use instead	Notes

current process	calling process	T{
A common mistake made by kernel programmers when writing man pages
T}
manpage	T{
man page, manual page
T}
minus infinity	negative infinity
non-root	unprivileged user
non-superuser	unprivileged user
nonprivileged	unprivileged
OS	operating system
plus infinity	positive infinity
pty	pseudoterminal
runtime	run time
tty	terminal
Unices	UNIX systems
Unixes	UNIX systems
.TE
.ad
.SS Trademarks
Use the correct spelling of trademarks.
The following is a list of the correct spelling of various
relevant trademarks that are sometimes misspelled:

     DG/UX
     HP-UX
     UNIX
     UnixWare
.SS NULL, NUL, null pointer, and null character
A
.IR "null pointer"
is a pointer that points to nothing,
and is normally indicated by the constant
.IR NULL .
On the other hand,
.I NUL
is the
.IR "null byte",
a byte with the value 0, represented in C via the character constant
.IR \(aq\e0\(aq .

The preferred term for the pointer is "null pointer" or simply "NULL";
avoid writing "NULL pointer".

The preferred term for the byte is "null byte".
Avoid writing "NUL", since it is too easily confused with "NULL".
Avoid also the terms "zero byte" and "null character".
The byte that terminates a C string should be described
as "the terminating null byte";
strings may be described as "null-terminated",
but avoid the use of "NUL-terminated".
.SS Hyperlinks
For hyperlinks, use the
.IR .UR / .UE
macro pair
(see
.BR groff_man (7)).
This produces proper hyperlinks that can be used in a web browser,
when rendering a page with, say:

     BROWSER=firefox man -H pagename
.SS Use of e.g., i.e., etc., a.k.a., and similar
In general, the use of abbreviations such as "e.g.", "i.e.", "etc.", "a.k.a."
should be avoided, in favor of suitable full wordings
("for example", "that is", "and so on", "also known as").

The only place where such abbreviations may be acceptable is in
.I short
parenthetical asides (e.g., like this one).

Always include periods in such abbreviations, as shown here.
In addition, "e.g." and "i.e." should always be followed by a comma.
.SS Em-dashes
The way to write an em-dash (\(em) in *roff is with the macro "\\(em".
Em-dashes should be written
.I without
surrounding spaces.
.SS Hyphenation of attributive compounds
Counpound terms should by hyphenated when used attributively
(i.e., to qualify a following noun) Some examples:

    command-line argument
    floating-point number
    run-time check
    user-space function
    wide-character string
.SS Hyphenation with multi, non, pre, re, sub, and so on
The general tendency in modern English is not to hyphenate
after prefixes such as "multi", "non", "pre", "re", "sub", and so on.
Manual pages should generally follow this rule when these prefixes are
used in natural English constructions with simple suffixes.
The following list gives some examples of the preferred forms:

    interprocess
    multithreaded
    multiprocess
    nonblocking
    nondefault
    nonempty
    noninteractive
    nonnegative
    nonportable
    nonzero
    preallocated
    precreate
    prerecorded
    reestablished
    reinitialize
    rearm
    reread
    subcomponent
    subdirectory
    subsystem

Hyphens should be retained when the prefixes are used in nonstandard
English words, with trademarks, proper nouns, acronyms, or compound terms.
Some examples:

    non-ASCII
    non-English
    non-NULL
    non-real-time

Finally, note that "re-create" and "recreate" are two different verbs,
and the former is probably what you want.
.SS Real hyphen character
Where a real hyphen character is required (e.g., for numbers such as \-1),
use the following form in the man page source

    \\-

This guideline applies also to code examples.
.SS Character constants
To produce single quotes that render well in both ASCII and UTF-8,
use the following form for character constants in the man page source:

    \\(aqC\\(aq

where
.I C
is the quoted character.
This guideline applies also to character constants used in code examples.
.SS Example programs and shell sessions
Manual pages can include example programs demonstrating how to
use a system call or library function.
However, note the following:
.IP * 3
Example programs should be written in C.
.IP *
An example program is necessary and useful only if it demonstrates
something beyond what can easily be provided in a textual
description of the interface.
An example program that does nothing
other than call an interface usually serves little purpose.
.IP *
Example programs should be fairly short (preferably less than 100 lines;
ideally less than 50 lines).
.IP *
Example programs should do error checking after system calls and
library function calls.
.IP *
Example programs should be complete, and compile without
warnings when compiled with \fIcc\ \-Wall\fP.
.IP *
Where possible and appropriate, example programs should allow
experimentation, by varying their behavior based on inputs
(ideally from command-line arguments, or alternatively, via
input read by the program).
.IP *
Example programs should be laid out according to Kernighan and
Ritchie style, with 4-space indents.
(Avoid the use of TAB characters in source code!)
.IP *
For consistency, all example programs terminate using either of;

     exit(EXIT_SUCCESS);
     exit(EXIT_FAILURE);

Avoid using the following forms to terminate a program:

    exit(0);
    exit(1);
    return n;
.IP *
If there is extensive explanatory text before the
program source code, mark off the source code
with a susbsection heading
.IR "Program source" ,
as in:

    .SS Program source

Always do this if the explanatory text includes a shell session log.
.PP
If you include a shell session log demonstrating the use of a program
or other system feature:
.IP * 3
Place the session log above the source code listing
.IP *
Indent the session log by four spaces.
.IP *
Boldface the user input text,
to distinguish it from output produced by the system.
.PP
For some examples of what example programs should look like, see
.BR wait (2)
and
.BR pipe (2).



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

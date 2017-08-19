From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] man-pages: ffix: Use an en-dash for ranges, numeric and
 alphabetic
Date: Sat, 19 Aug 2017 22:06:40 +0200
Message-ID: <1664c5ff-5639-b5dc-0ebe-95e6defec4db@gmail.com>
References: <1502968702-32042-1-git-send-email-bjarniig@rhi.hi.is>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502968702-32042-1-git-send-email-bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Bjarni,

On 08/17/2017 01:18 PM, Bjarni Ingi Gislason wrote:
> Signed-off-by: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
> ---
>  man1/memusage.1        | 20 +++++++++----------
>  man1/time.1            |  2 +-
>  man2/ioctl_console.2   |  2 +-
>  man2/mmap.2            |  2 +-
>  man2/msync.2           |  2 +-
>  man2/perf_event_open.2 |  4 ++--
>  man2/syslog.2          |  2 +-
>  man3/a64l.3            |  6 +++---
>  man3/addseverity.3     |  2 +-
>  man3/btree.3           |  6 +++---
>  man3/ctime.3           | 14 ++++++-------
>  man3/drand48.3         |  4 ++--
>  man3/fmtmsg.3          |  2 +-
>  man3/getnameinfo.3     |  2 +-
>  man3/gsignal.3         |  2 +-
>  man3/strftime.3        |  2 +-
>  man3/strptime.3        | 54 +++++++++++++++++++++++++-------------------------
>  man4/cciss.4           |  6 +++---
>  man4/console_codes.4   |  6 +++---
>  man4/hd.4              |  2 +-
>  man4/sd.4              |  6 +++---
>  man4/sk98lin.4         |  2 +-
>  man4/st.4              |  6 +++---
>  man5/proc.5            | 10 +++++-----
>  man7/charsets.7        | 12 +++++------
>  man7/cpuset.7          | 28 +++++++++++++-------------
>  man7/pty.7             |  6 +++---
>  man7/suffixes.7        | 10 +++++-----
>  man7/udplite.7         |  8 ++++----
>  man7/unix.7            |  2 +-
>  30 files changed, 116 insertions(+), 116 deletions(-)

I applied most of the changes here manually, since there were conflicts
with parallel changes I was making.

Thanks for the patch. For future large patches, it would be good
to get some advance warning of the proposed changes, to prevent the
possibility of conflicts.

Cheers,

Michael

 
> diff --git a/man1/memusage.1 b/man1/memusage.1
> index 16962466e..c7ccb6ffb 100644
> --- a/man1/memusage.1
> +++ b/man1/memusage.1
> @@ -220,17 +220,17 @@ realloc|        40         44800             0  (nomove:40, dec:19, free:0)
>   calloc|         0             0             0
>     free|         1           440
>  Histogram for block sizes:
> -  192-207             1   2% ================
> +  192\(en207             1   2% ================
>  \&...
> - 2192-2207            1   2% ================
> - 2240-2255            2   4% =================================
> - 2832-2847            2   4% =================================
> - 3440-3455            2   4% =================================
> - 4032-4047            2   4% =================================
> - 4640-4655            2   4% =================================
> - 5232-5247            2   4% =================================
> - 5840-5855            2   4% =================================
> - 6432-6447            1   2% ================
> + 2192\(en2207            1   2% ================
> + 2240\(en2255            2   4% =================================
> + 2832\(en2847            2   4% =================================
> + 3440\(en3455            2   4% =================================
> + 4032\(en4047            2   4% =================================
> + 4640\(en4655            2   4% =================================
> + 5232\(en5247            2   4% =================================
> + 5840\(en5855            2   4% =================================
> + 6432\(en6447            1   2% ================
>  $ \fBmemusagestat memusage.dat memusage.png\fP
>  .fi
>  .in
> diff --git a/man1/time.1 b/man1/time.1
> index 22f503e22..d56ba4d29 100644
> --- a/man1/time.1
> +++ b/man1/time.1
> @@ -71,7 +71,7 @@ was invoked, the exit status is that of
>  Otherwise, it is 127 if
>  .I command
>  could not be found, 126 if it could be found but could not be invoked,
> -and some other nonzero value (1-125) if something else went wrong.
> +and some other nonzero value (1\(en125) if something else went wrong.
>  .SH ENVIRONMENT
>  The variables
>  .BR LANG ,
> diff --git a/man2/ioctl_console.2 b/man2/ioctl_console.2
> index 72cb8fa47..8e4494432 100644
> --- a/man2/ioctl_console.2
> +++ b/man2/ioctl_console.2
> @@ -250,7 +250,7 @@ struct consolefontdesc {
>      unsigned short charcount;  /* characters in font
>                                    (256 or 512) */
>      unsigned short charheight; /* scan lines per
> -                                  character (1-32) */
> +                                  character (1\(en32) */
>      char          *chardata;   /* font data in
>                                    expanded form */
>  };
> diff --git a/man2/mmap.2 b/man2/mmap.2
> index d1942b52a..43090b231 100644
> --- a/man2/mmap.2
> +++ b/man2/mmap.2
> @@ -845,7 +845,7 @@ The descriptions of the following files in
>  and
>  .IR /proc/[pid]/smaps .
>  
> -B.O. Gallmeister, POSIX.4, O'Reilly, pp. 128-129 and 389-391.
> +B.O. Gallmeister, POSIX.4, O'Reilly, pp. 128\(en129 and 389\(en391.
>  .\"
>  .\" Repeat after me: private read-only mappings are 100% equivalent to
>  .\" shared read-only mappings. No ifs, buts, or maybes. -- Linus
> diff --git a/man2/msync.2 b/man2/msync.2
> index 8bfdcf766..0751ca9aa 100644
> --- a/man2/msync.2
> +++ b/man2/msync.2
> @@ -150,4 +150,4 @@ in
>  .SH SEE ALSO
>  .BR mmap (2)
>  
> -B.O. Gallmeister, POSIX.4, O'Reilly, pp. 128-129 and 389-391.
> +B.O. Gallmeister, POSIX.4, O'Reilly, pp. 128\(en129 and 389\(en391.
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index 746b2666f..ff7cd6169 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -2977,8 +2977,8 @@ commas.
>  For example, the file
>  .I event
>  may contain the value
> -.I config1:1,6-10,44
> -which indicates that event is an attribute that occupies bits 1,6-10, and 44
> +.I config1:1,6\(en10,44
> +which indicates that event is an attribute that occupies bits 1,6\(en10, and 44
>  of
>  .IR perf_event_attr::config1 .
>  .TP
> diff --git a/man2/syslog.2 b/man2/syslog.2
> index 696a43631..2761e69c1 100644
> --- a/man2/syslog.2
> +++ b/man2/syslog.2
> @@ -261,7 +261,7 @@ and to 15 in case
>  of a kernel fault (the 10 and 15 are just silly, and equivalent to 8).
>  The value of
>  .IR console_loglevel
> -can be set (to a value in the range 1-8) by a
> +can be set (to a value in the range 1\(en8) by a
>  .BR syslog ()
>  call with a
>  .I type
> diff --git a/man3/a64l.3 b/man3/a64l.3
> index 571cadfcc..9e878cd50 100644
> --- a/man3/a64l.3
> +++ b/man3/a64l.3
> @@ -55,9 +55,9 @@ The 64 digits in the base-64 system are:
>  
>  \&\(aq.\(aq	represents a 0
>  \&\(aq/\(aq	represents a 1
> -0-9	represent  2-11
> -A-Z	represent 12-37
> -a-z	represent 38-63
> +0\(en9	represent  2\(en11
> +A\(enZ	represent 12\(en37
> +a\(enz	represent 38\(en63
>  
>  .fi
>  .RE
> diff --git a/man3/addseverity.3 b/man3/addseverity.3
> index af2c8386f..a7fa6c89f 100644
> --- a/man3/addseverity.3
> +++ b/man3/addseverity.3
> @@ -35,7 +35,7 @@ argument of the
>  .BR fmtmsg (3)
>  function.
>  By default, that function knows only how to
> -print messages for severity 0-4 (with strings (none), HALT,
> +print messages for severity 0\(en4 (with strings (none), HALT,
>  ERROR, WARNING, INFO).
>  This call attaches the given string
>  .I s
> diff --git a/man3/btree.3 b/man3/btree.3
> index bd3f32c69..65f45066d 100644
> --- a/man3/btree.3
> +++ b/man3/btree.3
> @@ -244,11 +244,11 @@ Only big and little endian byte order is supported.
>  .BR recno (3)
>  
>  .IR "The Ubiquitous B-tree" ,
> -Douglas Comer, ACM Comput. Surv. 11, 2 (June 1979), 121-138.
> +Douglas Comer, ACM Comput. Surv. 11, 2 (June 1979), 121\(en138.
>  
>  .IR "Prefix B-trees" ,
>  Bayer and Unterauer, ACM Transactions on Database Systems, Vol. 2, 1
> -(March 1977), 11-26.
> +(March 1977), 11\(en26.
>  
>  .IR "The Art of Computer Programming Vol. 3: Sorting and Searching" ,
> -D.E. Knuth, 1968, pp 471-480.
> +D.E. Knuth, 1968, pp 471\(en480.
> diff --git a/man3/ctime.3 b/man3/ctime.3
> index 077c2a4c3..062232baa 100644
> --- a/man3/ctime.3
> +++ b/man3/ctime.3
> @@ -99,14 +99,14 @@ in the structure \fItm\fP, which is defined in \fI<time.h>\fP as follows:
>  .in +4n
>  .nf
>  struct tm {
> -    int tm_sec;    /* Seconds (0-60) */
> -    int tm_min;    /* Minutes (0-59) */
> -    int tm_hour;   /* Hours (0-23) */
> -    int tm_mday;   /* Day of the month (1-31) */
> -    int tm_mon;    /* Month (0-11) */
> +    int tm_sec;    /* Seconds (0\(en60) */
> +    int tm_min;    /* Minutes (0\(en59) */
> +    int tm_hour;   /* Hours (0\(en23) */
> +    int tm_mday;   /* Day of the month (1\(en31) */
> +    int tm_mon;    /* Month (0\(en11) */
>      int tm_year;   /* Year - 1900 */
> -    int tm_wday;   /* Day of the week (0-6, Sunday = 0) */
> -    int tm_yday;   /* Day in the year (0-365, 1 Jan = 0) */
> +    int tm_wday;   /* Day of the week (0\(en6, Sunday = 0) */
> +    int tm_yday;   /* Day in the year (0\(en365, 1 Jan = 0) */
>      int tm_isdst;  /* Daylight saving time */
>  };
>  .fi
> diff --git a/man3/drand48.3 b/man3/drand48.3
> index 311038bc8..bdf768441 100644
> --- a/man3/drand48.3
> +++ b/man3/drand48.3
> @@ -224,10 +224,10 @@ and
>  .IR c .
>  Array argument
>  elements
> -.I param[0-2]
> +.I param[0\(en2]
>  specify
>  .IR Xi ,
> -.I param[3-5]
> +.I param[3\(en5]
>  specify
>  .IR a ,
>  and
> diff --git a/man3/fmtmsg.3 b/man3/fmtmsg.3
> index eabefea6c..52546cb46 100644
> --- a/man3/fmtmsg.3
> +++ b/man3/fmtmsg.3
> @@ -203,7 +203,7 @@ severity-keyword,level,printstring
>  then
>  .BR fmtmsg ()
>  will also accept the indicated values for the level (in addition to
> -the standard levels 0-4), and use the indicated printstring when
> +the standard levels 0\(en4), and use the indicated printstring when
>  such a level occurs.
>  .LP
>  The severity-keyword part is not used by
> diff --git a/man3/getnameinfo.3 b/man3/getnameinfo.3
> index b0faca0fe..c61918778 100644
> --- a/man3/getnameinfo.3
> +++ b/man3/getnameinfo.3
> @@ -94,7 +94,7 @@ If set, then an error is returned if the hostname cannot be determined.
>  .B NI_DGRAM
>  If set, then the service is datagram (UDP) based rather than
>  stream (TCP) based.
> -This is required for the few ports (512-514)
> +This is required for the few ports (512\(en514)
>  that have different services for UDP and TCP.
>  .TP
>  .B NI_NOFQDN
> diff --git a/man3/gsignal.3 b/man3/gsignal.3
> index f10b651eb..7c0fccd4d 100644
> --- a/man3/gsignal.3
> +++ b/man3/gsignal.3
> @@ -94,7 +94,7 @@ the action function with argument
>  and returns the value returned by that function.
>  The range of possible values
>  .I signum
> -varies (often 1-15 or 1-17).
> +varies (often 1\(en15 or 1\(en17).
>  .SH ATTRIBUTES
>  For an explanation of the terms used in this section, see
>  .BR attributes (7).
> diff --git a/man3/strftime.3 b/man3/strftime.3
> index d7311a7b0..cc80682f3 100644
> --- a/man3/strftime.3
> +++ b/man3/strftime.3
> @@ -161,7 +161,7 @@ and
>  .B %g
>  Like
>  .BR %G ,
> -but without century, that is, with a 2-digit year (00-99). (TZ)
> +but without century, that is, with a 2-digit year (00\(en99). (TZ)
>  (Calculated from
>  .IR tm_year ,
>  .IR tm_yday ,
> diff --git a/man3/strptime.3 b/man3/strptime.3
> index 521874ded..1e9c175bf 100644
> --- a/man3/strptime.3
> +++ b/man3/strptime.3
> @@ -61,14 +61,14 @@ as follows:
>  .in +4n
>  .nf
>  struct tm {
> -    int tm_sec;    /* Seconds (0-60) */
> -    int tm_min;    /* Minutes (0-59) */
> -    int tm_hour;   /* Hours (0-23) */
> -    int tm_mday;   /* Day of the month (1-31) */
> -    int tm_mon;    /* Month (0-11) */
> +    int tm_sec;    /* Seconds (0\(en60) */
> +    int tm_min;    /* Minutes (0\(en59) */
> +    int tm_hour;   /* Hours (0\(en23) */
> +    int tm_mday;   /* Day of the month (1\(en31) */
> +    int tm_mon;    /* Month (0\(en11) */
>      int tm_year;   /* Year - 1900 */
> -    int tm_wday;   /* Day of the week (0-6, Sunday = 0) */
> -    int tm_yday;   /* Day in the year (0-365, 1 Jan = 0) */
> +    int tm_wday;   /* Day of the week (0\(en6, Sunday = 0) */
> +    int tm_yday;   /* Day in the year (0\(en365, 1 Jan = 0) */
>      int tm_isdst;  /* Daylight saving time */
>  };
>  .fi
> @@ -129,10 +129,10 @@ in abbreviated form or the full name.
>  The date and time representation for the current locale.
>  .TP
>  .B %C
> -The century number (0-99).
> +The century number (0\(en99).
>  .TP
>  .BR %d " or " %e
> -The day of month (1-31).
> +The day of month (1\(en31).
>  .TP
>  .B %D
>  Equivalent to
> @@ -145,19 +145,19 @@ The ISO 8601 standard format is
>  .BR %Y-%m-%d .)
>  .TP
>  .B %H
> -The hour (0-23).
> +The hour (0\(en23).
>  .TP
>  .B %I
> -The hour on a 12-hour clock (1-12).
> +The hour on a 12-hour clock (1\(en12).
>  .TP
>  .B %j
> -The day number in the year (1-366).
> +The day number in the year (1\(en366).
>  .TP
>  .B %m
> -The month number (1-12).
> +The month number (1\(en12).
>  .TP
>  .B %M
> -The minute (0-59).
> +The minute (0\(en59).
>  .TP
>  .B %n
>  Arbitrary whitespace.
> @@ -182,7 +182,7 @@ Equivalent to
>  .BR %H:%M .
>  .TP
>  .B %S
> -The second (0-60; 60 may occur for leap seconds;
> +The second (0\(en60; 60 may occur for leap seconds;
>  earlier also 61 was allowed).
>  .TP
>  .B %t
> @@ -193,14 +193,14 @@ Equivalent to
>  .BR %H:%M:%S .
>  .TP
>  .B %U
> -The week number with Sunday the first day of the week (0-53).
> +The week number with Sunday the first day of the week (0\(en53).
>  The first Sunday of January is the first day of week 1.
>  .TP
>  .B %w
> -The ordinal number of the day of the week (0-6), with Sunday = 0.
> +The ordinal number of the day of the week (0\(en6), with Sunday = 0.
>  .TP
>  .B %W
> -The week number with Monday the first day of the week (0-53).
> +The week number with Monday the first day of the week (0\(en53).
>  The first Monday of January is the first day of week 1.
>  .TP
>  .B %x
> @@ -210,10 +210,10 @@ The date, using the locale's date format.
>  The time, using the locale's time format.
>  .TP
>  .B %y
> -The year within century (0-99).
> -When a century is not otherwise specified, values in the range 69-99 refer
> -to years in the twentieth century (1969-1999); values in the
> -range 00-68 refer to years in the twenty-first century (2000-2068).
> +The year within century (0\(en99).
> +When a century is not otherwise specified, values in the range 69\(en99 refer
> +to years in the twentieth century (1969\(en1999); values in the
> +range 00\(en68 refer to years in the twenty-first century (2000\(en2068).
>  .TP
>  .B %Y
>  The year, including century (for example, 1991).
> @@ -346,9 +346,9 @@ field if any of the year, month, or day elements changed.
>  The \(aqy\(aq (year in century) specification is taken to specify a year
>  .\" in the 20th century by libc4 and libc5.
>  .\" It is taken to be a year
> -in the range 1950-2049 by glibc 2.0.
> +in the range 1950\(en2049 by glibc 2.0.
>  It is taken to be a year in
> -1969-2068 since glibc 2.1.
> +1969\(en2068 since glibc 2.1.
>  .\" In libc4 and libc5 the code for %I is broken (fixed in glibc;
>  .\" %OI was fixed in glibc 2.2.4).
>  .SS Glibc notes
> @@ -368,17 +368,17 @@ the ISO 8601 date format.
>  .TP
>  .B %g
>  The year corresponding to the ISO week number, but without the century
> -(0-99).
> +(0\(en99).
>  .TP
>  .B %G
>  The year corresponding to the ISO week number.
>  (For example, 1991.)
>  .TP
>  .B %u
> -The day of the week as a decimal number (1-7, where Monday = 1).
> +The day of the week as a decimal number (1\(en7, where Monday = 1).
>  .TP
>  .B %V
> -The ISO 8601:1988 week number as a decimal number (1-53).
> +The ISO 8601:1988 week number as a decimal number (1\(en53).
>  If the week (starting on Monday) containing 1 January has four or more days
>  in the new year, then it is considered week 1.
>  Otherwise, it is the last week
> diff --git a/man4/cciss.4 b/man4/cciss.4
> index 990c6c7d8..f45b87e2a 100644
> --- a/man4/cciss.4
> +++ b/man4/cciss.4
> @@ -107,7 +107,7 @@ Minor numbers:
>      b7 b6 b5 b4 b3 b2 b1 b0
>      |----+----| |----+----|
>           |           |
> -         |           +-------- Partition ID (0=wholedev, 1-15 partition)
> +         |           +-------- Partition ID (0=wholedev, 1\(en15 partition)
>           |
>           +-------------------- Logical Volume number
>  
> @@ -125,7 +125,7 @@ The device naming scheme is:
>  .fi
>  .SS Files in /proc
>  The files
> -.I /proc/driver/cciss/cciss[0-9]+
> +.I /proc/driver/cciss/cciss[0\(en9]+
>  contain information about
>  the configuration of each controller.
>  For example:
> @@ -243,7 +243,7 @@ but could vary depending on distribution).
>  For example:
>  .nf
>  
> -    for x in /proc/driver/cciss/cciss[0-9]*
> +    for x in /proc/driver/cciss/cciss[0\(en9]*
>      do
>          echo "engage scsi" > $x
>      done
> diff --git a/man4/console_codes.4 b/man4/console_codes.4
> index 58f313978..1edf620a0 100644
> --- a/man4/console_codes.4
> +++ b/man4/console_codes.4
> @@ -80,7 +80,7 @@ according to the mapping table) it has one of the 14 codes
>  1b (ESC), 7f (DEL).
>  One can set a "display control characters" mode (see below),
>  and allow 07, 09, 0b, 18, 1a, 7f to be displayed as glyphs.
> -On the other hand, in UTF-8 mode all codes 00-1f are regarded
> +On the other hand, in UTF-8 mode all codes 00\(en1f are regarded
>  as control characters, regardless of any "display control characters"
>  mode.
>  .PP
> @@ -157,8 +157,8 @@ ESC ]	OSC	T{
>  (Should be: Operating system command)
>  ESC ] P \fInrrggbb\fP: set palette, with parameter
>  given in 7 hexadecimal digits after the final P :-(.
> -Here \fIn\fP is the color (0-15), and \fIrrggbb\fP indicates
> -the red/green/blue values (0-255).
> +Here \fIn\fP is the color (0\(en15), and \fIrrggbb\fP indicates
> +the red/green/blue values (0\(en255).
>  ESC ] R: reset palette
>  T}
>  .TE
> diff --git a/man4/hd.4 b/man4/hd.4
> index 03e4e5c5b..7df34e52c 100644
> --- a/man4/hd.4
> +++ b/man4/hd.4
> @@ -60,7 +60,7 @@ The first form,
>  Partition numbers are assigned in the order the partitions
>  are discovered, and only nonempty, nonextended partitions
>  get a number.
> -However, partition numbers 1-4 are given to the
> +However, partition numbers 1\(en4 are given to the
>  four partitions described in the MBR (the "primary" partitions),
>  regardless of whether they are unused or extended.
>  Thus, the first logical partition will be
> diff --git a/man4/sd.4 b/man4/sd.4
> index 4a7f26dc7..853da1447 100644
> --- a/man4/sd.4
> +++ b/man4/sd.4
> @@ -54,9 +54,9 @@ is as follows:
>  .sp
>  partition 0 is the whole drive
>  .br
> -partitions 1-4 are the DOS "primary" partitions
> +partitions 1\(en4 are the DOS "primary" partitions
>  .br
> -partitions 5-8 are the DOS "extended" (or "logical") partitions
> +partitions 5\(en8 are the DOS "extended" (or "logical") partitions
>  
>  For example,
>  .I /dev/sda
> @@ -131,6 +131,6 @@ will fail with the error
>  .SH FILES
>  /dev/sd[a\-h]: the whole device
>  .br
> -/dev/sd[a\-h][0\-8]: individual block partitions
> +/dev/sd[a\(enh][0\(en8]: individual block partitions
>  .\".SH SEE ALSO
>  .\".BR scsi (4)
> diff --git a/man4/sk98lin.4 b/man4/sk98lin.4
> index d775c3236..b7139693d 100644
> --- a/man4/sk98lin.4
> +++ b/man4/sk98lin.4
> @@ -475,7 +475,7 @@ Interrupt moderation should be used when the driver has to
>  handle one or more interfaces with a high network load,
>  which\(emas a consequence\(emleads also to a high CPU utilization.
>  When moderation is applied in such high network load situations,
> -CPU load might be reduced by 20-30% on slow computers.
> +CPU load might be reduced by 20\(en30% on slow computers.
>  
>  Note that the drawback of using interrupt moderation is an increase of
>  the round-trip-time (RTT), due to the queuing and serving of
> diff --git a/man4/st.4 b/man4/st.4
> index 81dc0180b..c413fe83c 100644
> --- a/man4/st.4
> +++ b/man4/st.4
> @@ -675,12 +675,12 @@ If the value is zero, the cleaning
>  bit is always zero.
>  If the value is one, the TapeAlert data defined
>  in the SCSI-3 standard is used (not yet implemented).
> -Values 2-17 are
> +Values 2\(en17 are
>  reserved.
>  If the lowest eight bits are >= 18, bits from the extended
>  sense data are used.
> -The bits 9-16 specify a mask to select the bits
> -to look at and the bits 17-23 specify the bit pattern to look for.
> +The bits 9\(en16 specify a mask to select the bits
> +to look at and the bits 17\(en23 specify the bit pattern to look for.
>  If the bit pattern is zero, one or more bits under the mask indicate
>  the cleaning request.
>  If the pattern is nonzero, the pattern must match
> diff --git a/man5/proc.5 b/man5/proc.5
> index d6032e185..0944e09ef 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -1474,7 +1474,7 @@ If set, the page is in swap space
>  61 (since Linux 3.5)
>  The page is a file-mapped page or a shared anonymous page.
>  .TP
> -60-56 (since Linux 3.11)
> +60\(en56 (since Linux 3.11)
>  Zero
>  .\" Not quite true; see commit 541c237c0923f567c9c4cabb8a81635baadc713f
>  .TP
> @@ -1483,17 +1483,17 @@ PTE is soft-dirty
>  (see the kernel source file
>  .IR Documentation/vm/soft-dirty.txt ).
>  .TP
> -54-0
> +54\(en0
>  If the page is present in RAM (bit 63), then these bits
>  provide the page frame number, which can be used to index
>  .IR /proc/kpageflags
>  and
>  .IR /proc/kpagecount .
>  If the page is present in swap (bit 62),
> -then bits 4-0 give the swap type, and bits 54-5 encode the swap offset.
> +then bits 4\(en0 give the swap type, and bits 54\(en5 encode the swap offset.
>  .RE
>  .IP
> -Before Linux 3.11, bits 60-55 were
> +Before Linux 3.11, bits 60\(en55 were
>  used to encode the base-2 log of the page size.
>  .IP
>  To employ
> @@ -3960,7 +3960,7 @@ and the "free file handles" value is always zero.
>  .TP
>  .IR /proc/sys/fs/inode-max " (only present until Linux 2.2)"
>  This file contains the maximum number of in-memory inodes.
> -This value should be 3-4 times larger
> +This value should be 3\(en4 times larger
>  than the value in
>  .IR file-max ,
>  since \fIstdin\fP, \fIstdout\fP
> diff --git a/man7/charsets.7 b/man7/charsets.7
> index cfb63db47..7892cef51 100644
> --- a/man7/charsets.7
> +++ b/man7/charsets.7
> @@ -49,7 +49,7 @@ still renders properly on modern UTF-8 using systems.
>  .SS ISO 8859
>  ISO 8859 is a series of 15 8-bit character sets, all of which have ASCII
>  in their low (7-bit) half, invisible control characters in positions
> -128 to 159, and 96 fixed-width graphics in positions 160-255.
> +128 to 159, and 96 fixed-width graphics in positions 160\(en255.
>  .LP
>  Of these, the most important is ISO 8859-1
>  ("Latin Alphabet No .1" / Latin-1).
> @@ -165,7 +165,7 @@ Chinese.
>  (Big5 is both a character set and an encoding.)
>  It is a superset of ASCII.
>  Non-ASCII characters are expressed in two bytes.
> -Bytes 0xa1-0xfe are used as leading bytes for two-byte characters.
> +Bytes 0xa1\(en0xfe are used as leading bytes for two-byte characters.
>  Big5 and its extension were widely used in Taiwan and Hong Kong.
>  It is not ISO 2022 compliant.
>  .\" Thanks to Tomohiro KUBOTA for the following sections about
> @@ -175,7 +175,7 @@ JIS X 0208 is a Japanese national standard character set.
>  Though there are some more Japanese national standard character sets (like
>  JIS X 0201, JIS X 0212, and JIS X 0213), this is the most important one.
>  Characters are mapped into a 94x94 two-byte matrix,
> -whose each byte is in the range 0x21-0x7e.
> +whose each byte is in the range 0x21\(en0x7e.
>  Note that JIS X 0208 is a character set, not an encoding.
>  This means that JIS X 0208
>  itself is not used for expressing text data.
> @@ -212,8 +212,8 @@ character set for codes with high bit one (initially G1).
>  Each graphic character set has 94 or 96 characters, and is
>  essentially a 7-bit character set.
>  It uses codes either
> -040-0177 (041-0176) or 0240-0377 (0241-0376).
> -G0 always has size 94 and uses codes 041-0176.
> +040\(en0177 (041\(en0176) or 0240\(en0377 (0241\(en0376).
> +G0 always has size 94 and uses codes 041\(en0176.
>  .LP
>  Switching between character sets is done using the shift functions
>  \fB^N\fP (SO or LS1), \fB^O\fP (SI or LS0), ESC n (LS2), ESC o (LS3),
> @@ -260,7 +260,7 @@ are equivalent to ESC \- xx, ESC . xx, ESC / xx, respectively.
>  TIS-620 is a Thai national standard character set and a superset
>  of ASCII.
>  In the same fashion as the ISO 8859 series, Thai characters are mapped into
> -0xa1-0xfe.
> +0xa1\(en0xfe.
>  .SS Unicode
>  Unicode (ISO 10646) is a standard which aims to unambiguously represent
>  every character in every human language.
> diff --git a/man7/cpuset.7 b/man7/cpuset.7
> index 6669816cb..6a8f39d3f 100644
> --- a/man7/cpuset.7
> +++ b/man7/cpuset.7
> @@ -379,9 +379,9 @@ as shown in the following example:
>  .RS
>  .nf
>  Cpus_allowed:   ffffffff,ffffffff,ffffffff,ffffffff
> -Cpus_allowed_list:     0-127
> +Cpus_allowed_list:     0\(en127
>  Mems_allowed:   ffffffff,ffffffff
> -Mems_allowed_list:     0-63
> +Mems_allowed_list:     0\(en63
>  .fi
>  .RE
>  .PP
> @@ -888,8 +888,8 @@ Examples of the \fBMask Format\fR:
>  00000001                        # just bit 0 set
>  40000000,00000000,00000000      # just bit 94 set
>  00000001,00000000,00000000      # just bit 64 set
> -000000ff,00000000               # bits 32-39 set
> -00000000,000e3862               # 1,5,6,11-13,17-19 set
> +000000ff,00000000               # bits 32\(en39 set
> +00000000,000e3862               # 1,5,6,11\(en13,17\(en19 set
>  .fi
>  .RE
>  .PP
> @@ -917,8 +917,8 @@ Examples of the \fBList Format\fR:
>  .PP
>  .RS
>  .nf
> -0-4,9           # bits 0, 1, 2, 3, 4, and 9 set
> -0-2,7,12-14     # bits 0, 1, 2, 7, 12, 13, and 14 set
> +0\(en4,9           # bits 0, 1, 2, 3, 4, and 9 set
> +0\(en2,7,12\(en14     # bits 0, 1, 2, 7, 12, 13, and 14 set
>  .fi
>  .RE
>  .\" ================== RULES ==================
> @@ -1394,7 +1394,7 @@ and then attach the current shell to that cpuset.
>  .RB "$" " cd /dev/cpuset"
>  .RB "$" " mkdir Charlie"
>  .RB "$" " cd Charlie"
> -.RB "$" " /bin/echo 2-3 > cpuset.cpus"
> +.RB "$" " /bin/echo 2\(en3 > cpuset.cpus"
>  .RB "$" " /bin/echo 1 > cpuset.mems"
>  .RB "$" " /bin/echo $$ > tasks"
>  # The current shell is now running in cpuset Charlie
> @@ -1412,14 +1412,14 @@ perform the following steps.
>  .IP 1) 4
>  Let's say we want to move the job in cpuset
>  .I alpha
> -(CPUs 4-7 and memory nodes 2-3) to a new cpuset
> +(CPUs 4\(en7 and memory nodes 2\(en3) to a new cpuset
>  .I beta
> -(CPUs 16-19 and memory nodes 8-9).
> +(CPUs 16\(en19 and memory nodes 8\(en9).
>  .IP 2)
>  First create the new cpuset
>  .IR beta .
>  .IP 3)
> -Then allow CPUs 16-19 and memory nodes 8-9 in
> +Then allow CPUs 16\(en19 and memory nodes 8\(en9 in
>  .IR beta .
>  .IP 4)
>  Then enable
> @@ -1440,8 +1440,8 @@ The following sequence of commands accomplishes this.
>  .RB "$" " cd /dev/cpuset"
>  .RB "$" " mkdir beta"
>  .RB "$" " cd beta"
> -.RB "$" " /bin/echo 16-19 > cpuset.cpus"
> -.RB "$" " /bin/echo 8-9 > cpuset.mems"
> +.RB "$" " /bin/echo 16\(en19 > cpuset.cpus"
> +.RB "$" " /bin/echo 8\(en9 > cpuset.mems"
>  .RB "$" " /bin/echo 1 > cpuset.memory_migrate"
>  .RB "$" " while read i; do /bin/echo $i; done < ../alpha/tasks > tasks"
>  .fi
> @@ -1451,8 +1451,8 @@ The above should move any processes in
>  .I alpha
>  to
>  .IR beta ,
> -and any memory held by these processes on memory nodes 2-3 to memory
> -nodes 8-9, respectively.
> +and any memory held by these processes on memory nodes 2\(en3 to memory
> +nodes 8\(en9, respectively.
>  .PP
>  Notice that the last step of the above sequence did not do:
>  .in +4n
> diff --git a/man7/pty.7 b/man7/pty.7
> index 25c29bff6..6f425b988 100644
> --- a/man7/pty.7
> +++ b/man7/pty.7
> @@ -118,7 +118,7 @@ names of the form
>  .I /dev/ttyXY
>  (slave),
>  where X is a letter from the 16-character set [p-za-e],
> -and Y is a letter from the 16-character set [0-9a-f].
> +and Y is a letter from the 16-character set [0\(en9a\(enf].
>  (The precise range of letters in these two sets varies across UNIX
>  implementations.)
>  For example,
> @@ -138,10 +138,10 @@ for "pty" in the name of the master) can then be opened.
>  .I /dev/pts/*
>  (UNIX 98 slave devices)
>  .br
> -.I /dev/pty[p-za-e][0-9a-f]
> +.I /dev/pty[p\(enza\(ene][0\(en9a\(enf]
>  (BSD master devices)
>  .br
> -.I /dev/tty[p-za-e][0-9a-f]
> +.I /dev/tty[p\(enza\(ene][0\(en9a\(enf]
>  (BSD slave devices)
>  .SH NOTES
>  A description of the
> diff --git a/man7/suffixes.7 b/man7/suffixes.7
> index e65881486..07bf6d18f 100644
> --- a/man7/suffixes.7
> +++ b/man7/suffixes.7
> @@ -64,10 +64,10 @@ Suffix	File type
>   .S	assembler source with \fBcpp\fP(1) directives
>   .Y	file compressed using yabba
>   .Z	file compressed using \fBcompress\fP(1)
> - .[0-9]+gf	TeX generic font files
> - .[0-9]+pk	TeX packed font files
> - .[1-9]	manual page for the corresponding section
> - .[1-9][a-z]	manual page for section plus subsection
> + .[0\(en9]+gf	TeX generic font files
> + .[0\(en9]+pk	TeX packed font files
> + .[1\(en9]	manual page for the corresponding section
> + .[1\(en9][a\(enz]	manual page for section plus subsection
>   .a	static object code library
>   .ad	X application default resource file
>   .ada	Ada source (may be body, spec, or combination)
> @@ -151,7 +151,7 @@ Suffix	File type
>   .image	bitmap source
>   .in	configuration template, especially for GNU Autoconf
>   .info	files for the Emacs info browser
> - .info-[0-9]+	split info files
> + .info-[0\(en9]+	split info files
>   .ins	LaTeX package install file for docstrip
>   .itcl	itcl source code;
>  	itcl ([incr Tcl]) is an OO extension of tcl
> diff --git a/man7/udplite.7 b/man7/udplite.7
> index 39d43d046..b7e2797ab 100644
> --- a/man7/udplite.7
> +++ b/man7/udplite.7
> @@ -83,15 +83,15 @@ The following two options are specific to UDP-Lite.
>  .BR UDPLITE_SEND_CSCOV
>  This option sets the sender checksum coverage and takes an
>  .I int
> -as argument, with a checksum coverage value in the range 0..2^16-1.
> +as argument, with a checksum coverage value in the range 0..2^16\-1.
>  
>  A value of 0 means that the entire datagram is always covered.
> -Values from 1-7 are illegal (RFC\ 3828, 3.1) and are rounded up to
> +Values from 1\(en7 are illegal (RFC\ 3828, 3.1) and are rounded up to
>  the minimum coverage of 8.
>  
>  With regard to IPv6 jumbograms (RFC\ 2675), the UDP-Litev6 checksum
> -coverage is limited to the first 2^16-1 octets, as per RFC\ 3828, 3.5.
> -Higher values are therefore silently truncated to 2^16-1.
> +coverage is limited to the first 2^16\-1 octets, as per RFC\ 3828, 3.5.
> +Higher values are therefore silently truncated to 2^16\-1.
>  If in doubt, the current coverage value can always be queried using
>  .BR getsockopt (2).
>  .TP
> diff --git a/man7/unix.7 b/man7/unix.7
> index feda14ed3..ea0374791 100644
> --- a/man7/unix.7
> +++ b/man7/unix.7
> @@ -300,7 +300,7 @@ not explicitly bound to an address,
>  then the socket is autobound to an abstract address.
>  The address consists of a null byte
>  followed by 5 bytes in the character set
> -.IR [0-9a-f] .
> +.IR [0\(en9a\(enf] .
>  Thus, there is a limit of 2^20 autobind addresses.
>  (From Linux 2.1.15, when the autobind feature was added,
>  8 bytes were used, and the limit was thus 2^32 autobind addresses.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

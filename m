From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] tzfile.5: sync from tzdb upstream
Date: Sat, 12 Aug 2017 11:38:57 +0200
Message-ID: <b2842083-fad3-afea-1f66-9e738fe114ad@gmail.com>
References: <20170805032521.13294-1-eggert@cs.ucla.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170805032521.13294-1-eggert-764C0pRuGfqVc3sceRu5cw@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Eggert <eggert-764C0pRuGfqVc3sceRu5cw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Paul,

On 08/05/2017 05:25 AM, Paul Eggert wrote:
> This makes tzfile.5 a copy of the tzdb version, except that the tzdb
> version's first line is replaced by man-pages boilerplate.  The new
> version documents version 3 format, among other things.  Also, it
> removes the "Summary of the timezone information file format" section,
> which should no longer be needed due to improvements in the othe part
> of the man page.

Thanks. Patch applied.

Cheers,

Michael

> ---
>  Changes       |   4 +
>  man5/tzfile.5 | 232 ++++++++++++++++++++++++----------------------------------
>  2 files changed, 101 insertions(+), 135 deletions(-)
> 
> diff --git a/Changes b/Changes
> index 49e5a3603..de6efc729 100644
> --- a/Changes
> +++ b/Changes
> @@ -33,3 +33,7 @@ Global changes
>  Changes to individual pages
>  ---------------------------
>  
> +tzfile.5
> +    Paul Eggert
> +        Sync from tzdb version, to document version 3 format
> +	among other things.
> diff --git a/man5/tzfile.5 b/man5/tzfile.5
> index 9e597cba4..8b4af8b2a 100644
> --- a/man5/tzfile.5
> +++ b/man5/tzfile.5
> @@ -5,142 +5,148 @@
>  .\"
>  .\" @(#)tzfile.5	7.11
>  .\"
> -.TH TZFILE 5 2015-05-07 "" "Linux Programmer's Manual"
> +.TH TZFILE 5 2017-08-04 "" "Linux Programmer's Manual"
>  .SH NAME
> -tzfile \- timezone information
> +tzfile \- time zone information
>  .SH DESCRIPTION
> -This page describes the structure of the timezone files used by
> -.BR tzset (3).
> -These files are typically found under one of the directories
> -.IR /usr/lib/zoneinfo
> -or
> +.ie '\(lq'' .ds lq \&"\"
> +.el .ds lq \(lq\"
> +.ie '\(rq'' .ds rq \&"\"
> +.el .ds rq \(rq\"
> +.de q
> +\\$3\*(lq\\$1\*(rq\\$2
> +..
> +The time zone information files used by
> +.BR tzset (3)
> +are typically found under a directory with a name like
>  .IR /usr/share/zoneinfo .
> -
> -Timezone information files begin with a 44-byte header structured as follows:
> -.IP * 3
> -The magic four-byte sequence
> -"TZif" identifying this as a
> -timezone information file.
> +These files begin with a 44-byte header containing the following fields:
> +.IP * 2
> +The magic four-byte ASCII sequence
> +.q "TZif"
> +identifies the file as a time zone information file.
>  .IP *
> -A single character identifying the version of the file's format:
> -either an ASCII NUL (\(aq\\0\(aq) or a \(aq2\(aq (\fB0x32\fP).
> +A byte identifying the version of the file's format
> +(as of 2017, either an ASCII NUL, or
> +.q "2",
> +or
> +.q "3" ).
>  .IP *
>  Fifteen bytes containing zeros reserved for future use.
>  .IP *
> -Six four-byte values of type
> -.IR long ,
> -written in a "standard" byte order
> +Six four-byte integer values
> +written in a standard byte order
>  (the high-order byte of the value is written first).
>  These values are,
>  in order:
>  .RS
>  .TP
>  .I tzh_ttisgmtcnt
> -The number of UTC/local indicators stored in the file.
> +The number of UT/local indicators stored in the file.
>  .TP
>  .I tzh_ttisstdcnt
>  The number of standard/wall indicators stored in the file.
>  .TP
>  .I tzh_leapcnt
> -The number of leap seconds for which data is stored in the file.
> +The number of leap seconds for which data entries are stored in the file.
>  .TP
>  .I tzh_timecnt
> -The number of "transition times" for which data is stored
> +The number of transition times for which data entries are stored
>  in the file.
>  .TP
>  .I tzh_typecnt
> -The number of "local time types" for which data is stored
> +The number of local time types for which data entries are stored
>  in the file (must not be zero).
>  .TP
>  .I tzh_charcnt
> -The number of characters of "timezone abbreviation strings"
> +The number of bytes of time zone abbreviation strings
>  stored in the file.
>  .RE
>  .PP
> -The above header is followed by
> +The above header is followed by the following fields, whose lengths
> +vary depend on the contents of the header:
> +.IP * 2
>  .I tzh_timecnt
> -four-byte values of type
> -.IR long ,
> -sorted in ascending order.
> -These values are written in "standard" byte order.
> +four-byte signed integer values sorted in ascending order.
> +These values are written in standard byte order.
>  Each is used as a transition time (as returned by
>  .BR time (2))
>  at which the rules for computing local time change.
> -Next come
> +.IP *
>  .I tzh_timecnt
> -one-byte values of type
> -.IR "unsigned char" ;
> -each one tells which of the different types of "local time" types
> -described in the file is associated with the same-indexed transition time.
> -These values serve as indices into an array of
> -.I ttinfo
> -structures (with
> +one-byte unsigned integer values;
> +each one tells which of the different types of local time types
> +described in the file is associated with the time period
> +starting with the same-indexed transition time.
> +These values serve as indices into the next field.
> +.IP *
>  .I tzh_typecnt
> -entries) that appear next in the file;
> -these structures are defined as follows:
> -.in +4n
> +.I ttinfo
> +entries, each defined as follows:
> +.in +.5i
>  .sp
>  .nf
> +.ta .5i +\w'unsigned char\0\0'u
>  struct ttinfo {
> -    long         tt_gmtoff;
> -    int          tt_isdst;
> -    unsigned int tt_abbrind;
> +	int32_t	tt_gmtoff;
> +	unsigned char	tt_isdst;
> +	unsigned char	tt_abbrind;
>  };
> -.in
> +.in -.5i
>  .fi
>  .sp
> -Each structure is written as a four-byte value for
> -.I tt_gmtoff
> -of type
> -.IR long ,
> +Each structure is written as a four-byte signed integer value for
> +.IR tt_gmtoff ,
>  in a standard byte order, followed by a one-byte value for
>  .I tt_isdst
>  and a one-byte value for
>  .IR tt_abbrind .
>  In each structure,
>  .I tt_gmtoff
> -gives the number of seconds to be added to UTC,
> +gives the number of seconds to be added to UT,
>  .I tt_isdst
>  tells whether
>  .I tm_isdst
>  should be set by
> -.BR localtime (3),
> +.BR localtime (3)
>  and
>  .I tt_abbrind
> -serves as an index into the array of timezone abbreviation characters
> +serves as an index into the array of time zone abbreviation bytes
>  that follow the
>  .I ttinfo
>  structure(s) in the file.
> -.PP
> -Then there are
> +.IP *
>  .I tzh_leapcnt
>  pairs of four-byte values, written in standard byte order;
> -the first value of each pair gives the time
> +the first value of each pair gives the nonnegative time
>  (as returned by
>  .BR time (2))
>  at which a leap second occurs;
>  the second gives the
>  .I total
> -number of leap seconds to be applied after the given time.
> +number of leap seconds to be applied during the time period
> +starting at the given time.
>  The pairs of values are sorted in ascending order by time.
> -.PP
> -Then there are
> +Each transition is for one leap second, either positive or negative;
> +transitions always separated by at least 28 days minus 1 second.
> +.IP *
>  .I tzh_ttisstdcnt
>  standard/wall indicators, each stored as a one-byte value;
>  they tell whether the transition times associated with local time types
>  were specified as standard time or wall clock time,
> -and are used when a timezone file is used in handling POSIX-style
> -timezone environment variables.
> -.PP
> -Finally, there are
> +and are used when a time zone file is used in handling POSIX-style
> +time zone environment variables.
> +.IP *
>  .I tzh_ttisgmtcnt
> -UTC/local indicators, each stored as a one-byte value;
> +UT/local indicators, each stored as a one-byte value;
>  they tell whether the transition times associated with local time types
> -were specified as UTC or local time,
> -and are used when a timezone file is used in handling POSIX-style
> -timezone environment variables.
> +were specified as UT or local time,
> +and are used when a time zone file is used in handling POSIX-style
> +time zone environment variables.
>  .PP
> +The
>  .BR localtime (3)
> +function
>  uses the first standard-time
>  .I ttinfo
>  structure in the file
> @@ -152,84 +158,40 @@ if either
>  is zero or the time argument is less than the first transition time recorded
>  in the file.
>  .SS Version 2 format
> -For version-2-format timezone files,
> -the above header and data is followed by a second header and data,
> +For version-2-format time zone files,
> +the above header and data are followed by a second header and data,
>  identical in format except that
> -eight bytes are used for each transition time or leap-second time
> -(and that the version byte in the header record is
> -\fB0x32\fP rather than \fB0x00\fP).
> +eight bytes are used for each transition time or leap second time.
> +(Leap second counts remain four bytes.)
>  After the second header and data comes a newline-enclosed,
>  POSIX-TZ-environment-variable-style string for use in handling instants
>  after the last transition time stored in the file
>  (with nothing between the newlines if there is no POSIX representation for
>  such instants).
> +The POSIX-style string must agree with the local time type after
> +both data's last transition times; for example, given the string
> +.q "WET0WEST,M3.5.0,M10.5.0/3"
> +then if a last transition time is in July, the transition's local time
> +type must specify a daylight-saving time abbreviated
> +.q "WEST"
> +that is one hour east of UT.
> +.SS Version 3 format
> +For version-3-format time zone files, the POSIX-TZ-style string may
> +use two minor extensions to the POSIX TZ format, as described in
> +.IR newtzset (3).
> +First, the hours part of its transition times may be signed and range from
> +\-167 through 167 instead of the POSIX-required unsigned values
> +from 0 through 24.  Second, DST is in effect all year if it starts
> +January 1 at 00:00 and ends December 31 at 24:00 plus the difference
> +between daylight saving and standard time.
>  .PP
> -The second section of the timezone file consists of another 44-byte header
> -record, identical in structure to the one at the beginning of the file,
> -except that it applies to the data that follows,
> -which is also identical in structure
> -to the first section of the timezone file, with the following differences:
> -.IP * 3
> -The transition time values, after the header, are eight-byte values.
> -.IP *
> -In each leap second record, the leap second value is an eight-byte value.
> -The accumulated leap second count is still a four-byte value.
> -.PP
> -In all cases, the eight-byte time values are given in
> -the "standard" byte order,
> -the high-order byte first.
> -.SS POSIX timezone string
> -The second eight-byte time value section is followed by an optional
> -third section:
> -a single ASCII newline character (\(aq\\n\(aq),
> -then a text string followed by a second
> -newline character.
> -The text string is a POSIX timezone string, whose format is described in the
> -.BR tzset (3)
> -manual page.
> -.PP
> -The POSIX timezone string defines a rule for computing transition times
> -that follow the last transition time explicitly specified in the timezone
> -information file.
> -.SS Summary of the timezone information file format
> -\&
> -.RS
> -.nf
> -Four-byte value section
> -(header version \fB0x00\fP or \fB0x32\fP)
> -        Header record
> -        Four-byte transition times
> -        Transition time index
> -        \fBttinfo\fP structures
> -        Timezone abbreviation array
> -        Leap second records
> -        Standard/Wall array
> -        UTC/Local array
> -
> -Eight-byte value section
> -(only if first header version is \fB0x32\fP,
> -the second header's version is also \fB0x32\fP)
> -        Header record
> -        Eight-byte transition times
> -        Transition time index
> -        \fBttinfo\fP structures
> -        Timezone abbreviation array
> -        Leap second records
> -        Standard/Wall array
> -        UTC/Local array
> -
> -Third section
> -(optional, only in \fB0x32\fP version files)
> -        Newline character
> -        Timezone string
> -        Newline character
> -.fi
> -.RE
> -.\"
> +Future changes to the format may append more data.
>  .SH SEE ALSO
> -.BR ctime (3),
> +.BR time (2),
> +.BR localtime (3),
>  .BR tzset (3),
>  .BR tzselect (8),
> -
> -.I timezone/tzfile.h
> -in the glibc source tree
> +.BR zdump (8),
> +.BR zic (8)
> +.\" This file is in the public domain, so clarified as of
> +.\" 1996-06-05 by Arthur David Olson.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

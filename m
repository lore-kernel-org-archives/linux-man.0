From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: For review: New locale(1) page
Date: Mon, 10 Mar 2014 14:27:43 +0100
Message-ID: <531DBDCF.3070202@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello all,

I've written a page for glibc's locale(1) command. Review comments welcome.

Heads-up for Debian: I see Debian has a locale(1) page. However, everything
of importance in that page is also in my page, AFAICS. The only piece
missing is the stuff on environment variables, which is IMO out of place in
the Debian page, and is covered in the locale(7) page that my page 
references.

Thanks,

Michael

.\" Copyright (C) 2014 Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
.\"
.\" %%%LICENSE_START(VERBATIM)
.\" Permission is granted to make and distribute verbatim copies of this
.\" manual provided the copyright notice and this permission notice are
.\" preserved on all copies.
.\"
.\" Permission is granted to copy and distribute modified versions of this
.\" manual under the conditions for verbatim copying, provided that the
.\" entire resulting derived work is distributed under the terms of a
.\" permission notice identical to this one.
.\"
.\" Since the Linux kernel and libraries are constantly changing, this
.\" manual page may be incorrect or out-of-date.  The author(s) assume no
.\" responsibility for errors or omissions, or for damages resulting from
.\" the use of the information contained herein.  The author(s) may not
.\" have taken the same level of care in the production of this manual,
.\" which is licensed free of charge, as they might when working
.\" professionally.
.\"
.\" Formatted or processed versions of this manual, if unaccompanied by
.\" the source, must acknowledge the copyright and authors of this work.
.\" %%%LICENSE_END
.\"
.TH LOCALE 1 2014-03-10 "Linux" "Linux Programmer's Manual"
.SH NAME
locale \- get locale-specific information
.SH SYNOPSIS
.nf
.BR locale " [OPTION]"
.BR locale " [OPTION] \-a"
.BR locale " [OPTION] \-m"
.BR locale " [OPTION] NAME..."
.fi
.SH DESCRIPTION
The
.B locale
command displays information about the current locale, or all locales,
on standard output.

When invoked without arguments,
.B locale
displays the current locale settings for each locale category (see
.BR locale (5)),
based on the settings of the environment variables that control the locale
(see
.BR locale (7)).

If either the
.B \-a
or the
.B \-m
option (or one of their long-format equivalents) is specified,
the behavior is as follows:
.TP
.BR \-a ", " \-\-all\-locales
Display a list of all available locales.
The
.B -v
option causes the
.B LC_IDENTIFICATION
metadata about each locale to be included in the output.
.TP
.BR \-m ", " \-\-charmaps
Display the available charmaps (character set description files).
.PP
The
.I locale
command can also be provided with one or more arguments,
which are the names of locale keywords (for example,
.IR date_fmt ,
.IR ctype-class-names ,
.IR yesexpr ,
or
.IR decimal_point )
or locale categories (for example,
.BR LC_CTYPE
or
.BR LC_TIME ).
For each argument, the following is displayed:
.IP * 3
For a locale keyword, the value of that keyword to be displayed.
.IP *
For a locale category,
the values of all keywords in that category are displayed.
.PP
When arguments are supplied, the following options are meaningful:
.TP
.BR "\-c" ", " \-\-category\-name"
For a category name argument,
write the name of the locale category
on a separate line preceding the list of keyword values for that category.

For a keyword name argument,
write the name of the locale category for this keyword
on a separate line preceding the keyword value.

This option improves readability when multiple name arguments are specified.
It can be combined with the
.B \-k
option.
.TP
.BR "\-k" ", " "\-\-keyword\-name"
For each keyword whose value is being displayed,
include also the name of that keyword,
so that the output has the format:

    \fIkeyword\fP="\fIvalue\fP"

.PP
The
.I locale
command also knows about the following options:
.TP
.BR "\-v" ", " "\-\-verbose"
Display additional information for some command-line option and argument
combinations.
.TP
.BR "\-?" ", " "\-\-help"
Display a summary of command-line options and arguments and exit.
.TP
.BR "\-\-usage"
Display a short usage message and exit.
.TP
.BR "\-V" ", " "\-\-version"
Display the program version and exit.
.SH CONFORMING TO
POSIX.1-2001, POSIX.1-2008
.SH EXAMPLE
.nf
$ \fBlocale\fP
LANG=en_US.UTF\-8
LC_CTYPE="en_US.UTF\-8"
LC_NUMERIC="en_US.UTF\-8"
LC_TIME="en_US.UTF\-8"
LC_COLLATE="en_US.UTF\-8"
LC_MONETARY="en_US.UTF\-8"
LC_MESSAGES="en_US.UTF\-8"
LC_PAPER="en_US.UTF\-8"
LC_NAME="en_US.UTF\-8"
LC_ADDRESS="en_US.UTF\-8"
LC_TELEPHONE="en_US.UTF\-8"
LC_MEASUREMENT="en_US.UTF\-8"
LC_IDENTIFICATION="en_US.UTF\-8"
LC_ALL=en_US.UTF\-8
$ \fBlocale date_fmt\fP
%a %b %e %H:%M:%S %Z %Y
$ \fBlocale \-k date_fmt\fP
date_fmt="%a %b %e %H:%M:%S %Z %Y"
$ \fBlocale \-ck date_fmt\fP
LC_TIME
date_fmt="%a %b %e %H:%M:%S %Z %Y"
$ \fBlocale LC_MESSAGES\fP
^[yY].*
^[nN].*
Yes
No
UTF\-8
$ \fBlocale \-k LC_MESSAGES\fP
yesexpr="^[yY].*"
noexpr="^[nN].*"
yesstr="Yes"
nostr="No"
messages\-codeset="UTF\-8"
.fi
.SH SEE ALSO
.BR locale (5),
.BR locale (7)


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

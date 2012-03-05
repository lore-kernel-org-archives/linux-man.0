From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: New man page: scandirat(3)
Date: Tue, 6 Mar 2012 08:15:58 +1300
Message-ID: <CAKgNAkhXBDSJzFJFWPoqBu_3j7K5sYvkVO2709+utqE3bCs0Yw@mail.gmail.com>
References: <43540.1321362541@proseconsulting.co.uk>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <43540.1321362541-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

HI Mark,

On Wed, Nov 16, 2011 at 2:09 AM, Mark R Bannister
<mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org> wrote:
> Hi,
>
> I've written a man page for scandirat(3) that is new
> to glibc 2.15. =A0The man page is based on the text
> used in mkfifoat(3) which was very similar. =A0I am
> happy for this man page to be distributed under
> the terms of the GNU General Public License
> version 3 or later.

Although http://www.kernel.org/doc/man-pages/licenses.html#gpl
mentions v3 and v2, I see that no existing page uses v3. I'd like to
avoid v3 for pragmatic reasons:

* The GPL is a license primarily designed for code, which is why I
prefer the "verbatim" license
(http://www.kernel.org/doc/man-pages/licenses.html#verbatim).

* I'd like to avoid further licensing proliferation in man-pages.

Would you consider relicensing under either the verbatim license or GPL=
v2?

>
> The information in the man page was checked against the source code f=
or glibc 2.15.
>
> I include the patch inline below, and also as an attachment.

Thanks. Some comments below. Could you review and send me a new draft p=
lease.

> Best regards,
> Mark Bannister.
>
> .\" Hey Emacs! This file is -*- nroff -*- source.
> .\"
> .\" Copyright (c) 2011, Mark R. Bannister <cambridge-Rn4VEauK+AKRv+LV9MX5ug@public.gmane.org=
e.net>
> .\" =A0 =A0 =A0 =A0based on text in mkfifoat.3 Copyright (c) 2006, Mi=
chael Kerrisk
> .\"
> .\" This is free documentation; you can redistribute it and/or
> .\" modify it under the terms of the GNU General Public License as
> .\" published by the Free Software Foundation; either version 3 of
> .\" the License, or (at your option) any later version.
> .\"
> .\" The GNU General Public License's references to "object code"
> .\" and "executables" are to be interpreted as the output of any
> .\" document formatting or typesetting system, including
> .\" intermediate and printed output.
> .\"
> .\" This manual is distributed in the hope that it will be useful,
> .\" but WITHOUT ANY WARRANTY; without even the implied warranty of
> .\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the
> .\" GNU General Public License for more details.
> .\"
> .\" You should have received a copy of the GNU General Public
> .\" License along with this manual; if not, write to the Free
> .\" Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA=
 02111,
> .\" USA.
> .\"
> .TH SCANDIRAT 3 2011-11-15 "Linux" "Linux Programmer's Manual"
> .SH NAME
> scandirat \- scan a directory relative to a directory file descriptor
> .SH SYNOPSIS
> .nf
> .B #include <fcntl.h> =A0 =A0 =A0 =A0 =A0 /* Definition of AT_* const=
ants */
> .B #include <dirent.h>
> .sp
> .fi
> .BI "int scandir(int " dirfd ", const char *" dirp ","

scandirat

> .BI "struct dirent ***" namelist ,
> .nf
> .RS
> .BI "int (*" filter ")(const struct dirent *),"
> .BI "int (*" compar ")(const struct dirent **, const struct dirent **=
));"
> .RE
> .fi

Need to document feature test macro requirements. _GNU_SOURCE, I think

> .SH DESCRIPTION
> The
> .BR scandirat ()
> system call operates in exactly the same way as
> .BR scandir (3),
> except for the differences described in this manual page.
>
> If the pathname given in
> .I dirp
> is relative, then it is interpreted relative to the directory
> referred to by the file descriptor
> .I dirfd
> (rather than relative to the current working directory of
> the calling process, as is done by
> .BR scandir (3)
> for a relative pathname).
>
> If
> .I dirp
> is relative and
> .I dirfd
> is the special value
> .BR AT_FDCWD ,
> then
> .I dirp
> is interpreted relative to the current working
> directory of the calling process (like
> .BR scandir (3)).
>
> If
> .I dirp
> is absolute, then
> .I dirfd
> is ignored.
> .SH "RETURN VALUE"
> On success,
> .BR scandirat ()
> returns the number of directory entries selected.
> On error, \-1 is returned and
> .I errno
> is set to indicate the error.
> .SH ERRORS
> The same errors that occur for
> .BR scandir (3)
> can also occur for
> .BR scandirat ().
> The following additional errors can occur for
> .BR scandirat ():
> .TP
> .B EBADF
> .I dirfd
> is not a valid file descriptor.
> .TP
> .B ENOTDIR
> .I dirp
> is a relative path and
> .I dirfd
> is a file descriptor referring to a file other than a directory.
> .SH VERSIONS
> .BR scandirat ()
> was added to glibc in version 2.15.
> .SH "CONFORMING TO"
> This system call is non-standard but is proposed for inclusion in a
> future revision of POSIX.1.

I haven't checked this. Can you provide some details confirming that
this is on the schedule for POSIX.1?


> .SH NOTES
> See
> .BR openat (2)
> for an explanation of the need for
> .BR scandirat ().
> .SH "SEE ALSO"
> .BR openat (2),
> .BR scandir (3),
> .BR path_resolution (7).

No dot at end of SEE ALSO list.

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

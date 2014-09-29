From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: For review: pldd(1) man page
Date: Mon, 29 Sep 2014 11:06:02 +0200
Message-ID: <542920FA.9000400@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello all,

I've drafted a man page for the pldd command that glibc added
in version 2.15. Comments and suggestions for improvements=20
welcome. Rendered version of the page is below, followed=20
by the page source.

Thanks

Michael


PLDD(1)                     Linux User Manual                    PLDD(1=
)



NAME
       pldd - display dynamic shared objects linked into a process

SYNOPSIS
       pldd PID
       pldd OPTION

DESCRIPTION
       The  pldd  command  displays a list of the dynamic shared object=
s
       that are linked into the process with the specified  process  ID=
=2E
       The list includes the libraries that have been dynamically loade=
d
       using dlopen(3).

OPTIONS
       -?, --help
              Display program help message.

       --usage
              Display a short usage message.

       -V, --version
              Display the program version.

VERSIONS
       pldd is available since glibc 2.15.

CONFORMING TO
       The pldd command is not specified by POSIX.1.  Some other system=
s
       have a similar command.

EXIT STATUS
       On  success,  pldd  exits  with  the  status 0.  If the specifie=
d
       process does not exist, the user  does  not  have  permission  t=
o
       access  its  dynamic shared object list, or no command-line argu=
=E2=80=90
       ments are supplied, pldd exists with a status of 1.  If given  a=
n
       invalid option, it exits with the status 64.

EXAMPLE
       $ echo $$               # Display PID of shell
       1143
       $ pldd $$               # Display DSOs linked into the shell
       1143:     /usr/bin/bash
       linux-vdso.so.1
       /lib64/libtinfo.so.5
       /lib64/libdl.so.2
       /lib64/libc.so.6
       /lib64/ld-linux-x86-64.so.2
       /lib64/libnss_files.so.2

NOTES
       The command

            lsof -p PID

       also  shows  output that includes the dynamic shared objects tha=
t
       are linked into a process.

SEE ALSO
       ldd(1), lsof(1), dlopen(3), ld.so(8)



GNU                            2014-09-27                        PLDD(1=
)


=3D=3D=3D=3D
Page source


=2E\" Copyright (C) 2014 Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
=2E\"
=2E\" %%%LICENSE_START(VERBATIM)
=2E\" Permission is granted to make and distribute verbatim copies of t=
his
=2E\" manual provided the copyright notice and this permission notice a=
re
=2E\" preserved on all copies.
=2E\"
=2E\" Permission is granted to copy and distribute modified versions of=
 this
=2E\" manual under the conditions for verbatim copying, provided that t=
he
=2E\" entire resulting derived work is distributed under the terms of a
=2E\" permission notice identical to this one.
=2E\"
=2E\" Since the Linux kernel and libraries are constantly changing, thi=
s
=2E\" manual page may be incorrect or out-of-date.  The author(s) assum=
e no
=2E\" responsibility for errors or omissions, or for damages resulting =
from
=2E\" the use of the information contained herein.  The author(s) may n=
ot
=2E\" have taken the same level of care in the production of this manua=
l,
=2E\" which is licensed free of charge, as they might when working
=2E\" professionally.
=2E\"
=2E\" Formatted or processed versions of this manual, if unaccompanied =
by
=2E\" the source, must acknowledge the copyright and authors of this wo=
rk.
=2E\" %%%LICENSE_END
=2E\"
=2ETH PLDD 1 2014-09-27 "GNU" "Linux User Manual"
=2ESH NAME
pldd \- display dynamic shared objects linked into a process
=2ESH SYNOPSIS
=2Enf
=2EBI "pldd " "PID"
=2EBR pldd " OPTION"
=2Efi
=2ESH DESCRIPTION
The
=2EB pldd
command displays a list of the dynamic shared objects that are=20
linked into the process with the specified process ID.
The list includes the libraries that have been dynamically loaded using
=2EBR dlopen (3).
=2ESH OPTIONS
=2ETP
=2EBR \-? ", " \-\-help
Display program help message.
=2ETP
=2EBR \-\-usage
Display a short usage message.
=2ETP
=2EBR \-V ", " \-\-version
Display the program version.
=2ESH VERSIONS
=2EB pldd
is available since glibc 2.15.
=2ESH CONFORMING TO
The
=2EB pldd
command is not specified by POSIX.1.
Some other systems
=2E\" There are man pages on Solaris and HP-UX.
have a similar command.
=2ESH EXIT STATUS
On success,
=2EB pldd
exits with the status 0.
If the specified process does not exist,
the user does not have permission to access
its dynamic shared object list,
or no command-line arguments are supplied,
=2EB pldd
exists with a status of 1.
If given an invalid option, it exits with the status 64.
=2ESH EXAMPLE
=2Enf
$ \fBecho $$\fP               # Display PID of shell
1143
$ \fBpldd $$\fP               # Display DSOs linked into the shell
1143:	/usr/bin/bash
linux\-vdso.so.1
/lib64/libtinfo.so.5
/lib64/libdl.so.2
/lib64/libc.so.6
/lib64/ld\-linux\-x86\-64.so.2
/lib64/libnss_files.so.2
=2Efi
=2ESH NOTES
The command

     lsof -p PID

also shows output that includes the dynamic shared objects
that are linked into a process.
=2ESH SEE ALSO
=2EBR ldd (1),
=2EBR lsof (1),
=2EBR dlopen (3),
=2EBR ld.so (8)

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

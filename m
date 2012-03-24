From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: fcntl for mingw
Date: Sat, 24 Mar 2012 16:49:36 +1300
Message-ID: <CAKgNAkgz6rpP592MTYkL4-Pbpjbv-YNTmbnhqvfe5Z5wyoo-oA@mail.gmail.com>
References: <loom.20091211T001536-796@post.gmane.org> <200912111638.17976.bruno@clisp.org>
 <4B271BAA.2060802@byu.net>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4B271BAA.2060802-PGZyUNKar/Q@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Blake <ebb9-PGZyUNKar/Q@public.gmane.org>
Cc: Bruno Haible <bruno-nWNVUoHt2MvYtjvyW6yDsg@public.gmane.org>, bug-gnulib-mXXj517/zsQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

On Tue, Dec 15, 2009 at 6:16 PM, Eric Blake <ebb9-PGZyUNKar/Q@public.gmane.org> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> According to Bruno Haible on 12/11/2009 8:38 AM:
>>> + =A0switch (action)
>>> + =A0 =A0{
>>> + =A0 =A0case F_DUPFD_CLOEXEC:
>>> + =A0 =A0 =A0{
>>> + =A0 =A0 =A0 =A0int target =3D va_arg (arg, int);
>>
>> Is the arg of type 'int' or 'long'? POSIX says it's an 'int'. But
>> the Linux man page
>> =A0 <http://www.kernel.org/doc/man-pages/online/pages/man2/fcntl.2.h=
tml>
>> says it's 'long' "in most cases", and indeed glibc's fcntl.c impleme=
ntation
>> uses a 'void *', that is, the same as a 'long'.
>
> That's (hopefully) a bug in the Linux man page. =A0The return type is=
 int,
> and since the arg is an fd and the return type an fd, they had better=
 be
> the same type. =A0But all the same, I'm cc'ing the man page maintaine=
r.

Who is finally responding.

>> It makes a difference on big-endian 64-bit platforms (SPARC64, PPC64=
),
>
> No one writes fcntl(fd,F_DUPFD,1L), since that is contrary to POSIX; =
and
> if fcntl(fd,F_DUPFD,1) doesn't work, then that is a bug in the kernel=
=2E

Agreed. And POSIX explicitly says "int" for various other F_* commands
as well. I think in every case, where the man page says "long" it
should probably say "int". (I think the man page was written from the
kernel-source perspective, where everything really is "long", but I
would likewise consider this a bug if the user needed to specify "1L"
and so on.)

I have applied the patch below for man-pages-3.38. Comments welcome.

Thanks,

Michael

diff --git a/man2/fcntl.2 b/man2/fcntl.2
index b2a985a..4b1b14f 100644
--- a/man2/fcntl.2
+++ b/man2/fcntl.2
@@ -82,7 +82,7 @@ Whether or not this argument is required is determine=
d by
 The required argument type is indicated in parentheses after each
 .I cmd
 name (in most cases, the required type is
-.IR long ,
+.IR int ,
 and we identify the argument using the name
 .IR arg ),
 or
@@ -90,7 +90,7 @@ or
 is specified if the argument is not required.
 .SS "Duplicating a file descriptor"
 .TP
-.BR F_DUPFD " (\fIlong\fP)"
+.BR F_DUPFD " (\fIint\fP)"
 Find the lowest numbered available file descriptor
 greater than or equal to
 .I arg
@@ -106,7 +106,7 @@ See
 .BR dup (2)
 for further details.
 .TP
-.BR F_DUPFD_CLOEXEC " (\fIlong\fP; since Linux 2.6.24)"
+.BR F_DUPFD_CLOEXEC " (\fIint\fP; since Linux 2.6.24)"
 As for
 .BR F_DUPFD ,
 but additionally set the
@@ -139,7 +139,7 @@ Read the file descriptor flags;
 .I arg
 is ignored.
 .TP
-.BR F_SETFD " (\fIlong\fP)"
+.BR F_SETFD " (\fIint\fP)"
 Set the file descriptor flags to the value specified by
 .IR arg .
 .SS "File status flags"
@@ -166,7 +166,7 @@ Get the file access mode and the file status flags;
 .I arg
 is ignored.
 .TP
-.BR F_SETFL " (\fIlong\fP)"
+.BR F_SETFL " (\fIint\fP)"
 Set the file status flags to the value specified by
 .IR arg .
 File access mode
@@ -455,7 +455,7 @@ process group IDs are returned as negative values
(but see BUGS below).
 .I arg
 is ignored.
 .TP
-.BR F_SETOWN " (\fIlong\fP)"
+.BR F_SETOWN " (\fIint\fP)"
 Set the process ID or process group ID that will receive
 .B SIGIO
 and
@@ -663,7 +663,7 @@ the signal handler if installed with
 .I arg
 is ignored.
 .TP
-.BR F_SETSIG " (\fIlong\fP)"
+.BR F_SETSIG " (\fIint\fP)"
 Set the signal sent when input or output becomes possible
 to the value given in
 .IR arg .
@@ -774,7 +774,7 @@ or
 .BR truncate (2)
 the file referred to by that file descriptor.
 .TP
-.BR F_SETLEASE " (\fIlong\fP)"
+.BR F_SETLEASE " (\fIint\fP)"
 Set or remove a file lease according to which of the following
 values is specified in the integer
 .IR arg :
@@ -912,7 +912,7 @@ that has been accessed by another process.
 (This is useful if the caller holds leases against multiple files).
 .SS "File and directory change notification (dnotify)"
 .TP
-.BR F_NOTIFY " (\fIlong\fP)"
+.BR F_NOTIFY " (\fIint\fP)"
 (Linux 2.4 onward)
 Provide notification when the directory referred to by
 .I fd
@@ -1004,7 +1004,7 @@ See
 .BR inotify (7).
 .SS "Changing the capacity of a pipe"
 .TP
-.BR F_SETPIPE_SZ " (\fIlong\fP; since Linux 2.6.35)"
+.BR F_SETPIPE_SZ " (\fIint\fP; since Linux 2.6.35)"
 Change the capacity of the pipe referred to by
 .I fd
 to be at least


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

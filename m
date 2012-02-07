From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: suggestion for improvement to vfork() man page
Date: Wed, 8 Feb 2012 10:38:05 +1300
Message-ID: <CAKgNAkgmHE1FwzNv0A2xR0PYuJdz81PT8UA3R=enqR5PrAynjA@mail.gmail.com>
References: <6.2.5.6.2.20120118221253.03aad598@binnacle.cx> <201201191336.54114.vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201201191336.54114.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: starlight-Utvwg/EOxnhfq8cQ1yknNg@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

On Fri, Jan 20, 2012 at 7:36 AM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wro=
te:
> On Wednesday 18 January 2012 22:16:28 starlight-Utvwg/EOxnhfq8cQ1yknNg@public.gmane.org wrote:
>> Also I don't think it is unfortunate (or a bug)
>> that vfork() continues to exist in Linux aside
>> from the fact that the semantics differ from
>> other *nixes in subtle and potentially
>> confusing ways.
>>
>> As implemented in Linux vfork() is quite useful
>> and with the aforementioned clarifications to
>> the documentation, worth retaining.

Agreed. I inherited that text in the man page, but it never irritated
me quite *enough* to remove it. But all I needed was a little push.

> it also most likely won't ever be going away. =A0a few reasons:
> =A0 =A0 =A0 =A0- vfork() is really just a clone() with certain flags
> =A0 =A0 =A0 =A0- clone() is never going away as it is used to create =
threads
> =A0 =A0 =A0 =A0- vfork() is required for no-mmu systems (can't implem=
ent fork())
> -mike

Thanks for those notes also Mike.

I've applied the patch below:

=3D=3D=3D=3D=3D
--- a/man2/vfork.2
+++ b/man2/vfork.2
@@ -169,6 +169,40 @@ remaining blocked until the child either
terminates or calls
 and cannot rely on any specific behavior with respect to shared memory=
=2E
 .\" In AIXv3.1 vfork is equivalent to fork.
 .SH NOTES
+.PP
+Some consider the semantics of
+.BR vfork ()
+to be an architectural blemish, and the 4.2BSD man page stated:
+"This system call will be eliminated when proper system sharing mechan=
isms
+are implemented.
+Users should not depend on the memory sharing semantics of
+.BR vfork ()
+as it will, in that case, be made synonymous to
+.BR fork (2).\c
+"
+However, even though modern memory management hardware
+has decreased the performance difference between
+.BR fork ()
+and
+.BR vfork (2),
+there are various reasons why Linux and other systems have retained
+.BR vfork ():
+.IP * 3
+Some performance-critical applications require the small performance
+advantage conferred by
+.BR vfork ().
+.IP *
+.BR vfork (2)
+can be implemented on systems that lack a memory-management unit
+(typically, embedded systems), but
+.BR fork (2)
+can't be implemented on such systems.
+(However, on such systems,
+the preferred standard way of accomplishing the same result is to use
+.BR posix_spawn (3).)
+.\" http://stackoverflow.com/questions/4259629/what-is-the-difference-=
between-fork-and-vfork
+.\" http://developers.sun.com/solaris/articles/subprocess/subprocess.h=
tml
+.\" http://mailman.uclinux.org/pipermail/uclinux-dev/2009-April/000684=
=2Ehtml
 .SS Linux Notes
 Fork handlers established using
 .BR pthread_atfork (3)
@@ -208,16 +242,7 @@ Since 2.2.0-pre9 (on i386, somewhat later on
 other architectures) it is an independent system call.
 Support was added in glibc 2.0.112.
 .SH BUGS
-It is rather unfortunate that Linux revived this specter from the past=
=2E
-The BSD man page states:
-"This system call will be eliminated when proper system sharing mechan=
isms
-are implemented.
-Users should not depend on the memory sharing semantics of
-.BR vfork ()
-as it will, in that case, be made synonymous to
-.BR fork (2).\c
-"

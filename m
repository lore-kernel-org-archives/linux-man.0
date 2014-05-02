From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] stpcpy.3, stpncpy.3: Correct history
Date: Fri, 02 May 2014 15:58:36 +0200
Message-ID: <5363A48C.7060709@gmail.com>
References: <20140224003705.GB28413@iris.usta.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140224003705.GB28413-1ywcXMbTzNIuZeo0DBJMuQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ingo Schwarze <schwarze-mcycREo4Un4@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Ingo,

On 02/24/2014 01:37 AM, Ingo Schwarze wrote:
> Hi,
> 
> i just noticed that the stpcpy(3) manual contains a speculation
> that appears to be untrue on closer investigation:  That function
> did not originate in MS DOS, but in Lattice C on AmigaDOS.
> 
> Here is a patch against the git master HEAD to fix that, and add
> some more historical information.  To provide some background and
> allow you to more easily verify the correctness of the patch, i'm
> appending my mail to <misc-7YlrpqBBQ3VAfugRpC6u6w@public.gmane.org>, where i'm giving some more
> details about the history and pointing to some primary sources.
> That mail also contains the (similar, but shorter) patch i just
> committed to the OpenBSD manual page.
> 
> Yours,
>   Ingo
>
> diff --git a/man3/stpcpy.3 b/man3/stpcpy.3
> index 4718a96..1952df1 100644
> --- a/man3/stpcpy.3
> +++ b/man3/stpcpy.3
> @@ -76,9 +76,10 @@ function is thread-safe.
>  .SH CONFORMING TO
>  This function was added to POSIX.1-2008.
>  Before that, it was not part of
> -the C or POSIX.1 standards, nor customary on UNIX systems, but was not a
> -GNU invention either.
> -Perhaps it came from MS-DOS.
> +the C or POSIX.1 standards, nor customary on UNIX systems.
> +It first appeared in the Lattice C AmigaDOS compiler (1986 or earlier),
> +then in the GNU fileutils and GNU textutils in 1989,
> +and in the GNU C library until 1992.
>  It is also present on the BSDs.
>  .SH BUGS
>  This function may overrun the buffer
> diff --git a/man3/stpncpy.3 b/man3/stpncpy.3
> index 60042e6..5bc084d 100644
> --- a/man3/stpncpy.3
> +++ b/man3/stpncpy.3
> @@ -96,6 +96,7 @@ function is thread-safe.
>  .SH CONFORMING TO
>  This function was added to POSIX.1-2008.
>  Before that, it was a GNU extension.
> +It first appeared in version 1.07 of the GNU C library in 1993.
>  .SH SEE ALSO
>  .BR strncpy (3),
>  .BR wcpncpy (3)
> 
> P.S.
> I'd like to apologize that our linker is using strong language
> to express its opinion regarding these functions; back in 2012,
> the developer implementing them wasn't exactly amused that they
> finally made it into POSIX...  ;-)

Thanks for this note.

Now, leaving aside the fingerpointing ;-).... the patch seems more or 
less okay to me, but given that The ImagaDOS compiler is the merely the 
oldest instance you could find, I'd prefer a slightly more open wording.
How would this be:

[[
--- a/man3/stpcpy.3
+++ b/man3/stpcpy.3
@@ -76,9 +76,11 @@ function is thread-safe.
 .SH CONFORMING TO
 This function was added to POSIX.1-2008.
 Before that, it was not part of
-the C or POSIX.1 standards, nor customary on UNIX systems, but was not a
-GNU invention either.
-Perhaps it came from MS-DOS.
+the C or POSIX.1 standards, nor customary on UNIX systems.
+It first appeared at least as early as 1986,
+in the Lattice C AmigaDOS compiler,
+then in the GNU fileutils and GNU textutils in 1989,
+and in the GNU C library until 1992.
 It is also present on the BSDs.
 .SH BUGS
 This function may overrun the buffer

]]

?

Cheers,

Michael

PS It does seem sad that it ended up in POSIX. I wonder how that came about.


> ----- Forwarded message from Ingo Schwarze <schwarze-mcycREo4Un4@public.gmane.org> -----
> 
> From: Ingo Schwarze <schwarze-mcycREo4Un4@public.gmane.org>
> Date: Sun, 23 Feb 2014 23:29:19 +0100
> Cc: misc-7YlrpqBBQ3VAfugRpC6u6w@public.gmane.org
> Subject: Re: while trying to compile gettext 0.18.3.2 I see questionable
> 	messages
> 
> Hi Lorenzo,
> 
> Lorenzo Beretta wrote on Sun, Feb 23, 2014 at 05:29:54PM +0100:
>> dc-tZh0T7QEfwVBDgjK7y7TUQ@public.gmane.org wrote on Sun, Feb 23, 2014 at 08:54:34AM -0500:
> 
>>> ../gnulib-lib/.libs/libgettextlib.so: warning:
>>> stpcpy() is dangerous GNU crap; don't use it
> 
>> Yet stpcpy(3) on linux says:
>> CONFORMING TO
>>        This function was added to POSIX.1-2008.  Before that, it was
>>        not part of the C or POSIX.1 standards, nor customary on UNIX
>>        systems, but was not a GNU invention either.  Perhaps it came
>>        from MS-DOS.  It is also present on the BSDs.
> 
> I checked the following without finding any references to stpcpy:
>  - AT&T UNIX v3 to v7 including PWB and 32v
>  - System III AT&T Unix
>  - all versions of CSRG BSD from 1BSD to 4.4BSD-Lite2 including SCCS
> 
> The earliest occurrence of stpcpy() i was able to find was in
> the Lattice C AmigaDOS Compiler Version 3 Programmers Reference
> Guide (1986-09-12)(Lattice Inc.), which explicitly classifies the
> function as "TYPE: LATTICE", see
> https://archive.org/details/Lattice_C_AmigaDOS_Compiler_Version_3_Programmers_Reference_Guide_1986-09-12_Lattice_Inc.
> 
> So the claim by Terry Lambert that it originated in Borland Turbo C
> is definitely untrue.  The first release of Borland Turbo C
> happened in May 1987.  I can confirm it was in Borland Turbo C 2.0
> in 1989, though.
> 
> The 386BSD 0.1 release contains GNU textutils-1.3 and GNU fileutils-3.2
> which both contain a file lib/stpcpy.c with a 1989 FSF Copyright.
> This is confirmed by looking at the initial commits of the git
> history of the GNU coreutils package.
> 
> The function stpcpy() was contained in the initial git import of
> glibc on Feb 18, 1995.  The file string.texi says "@comment Unknown
> origin" at this point in time.  The file sysdeps/generic/stpcpy.c
> says "Copyright (C) 1992 Free Software Foundation, Inc." at this
> point in time.  The ChangeLog reports a bugfix to the function on
> Jan 7, 1992 by Roland McGrath.
> 
> In the BSDs, here is when it appeared:
>  - FreeBSD: Oct 3, 2002 by obrien@, written himself
>  - DragonFly: Apr 7, 2009 ported by pavalos@ from FreeBSD
>  - NetBSD: May 1, 2009 ported by perry@ from FreeBSD
>  - OpenBSD: Jan 17, 2012 by kettenis@, reluctantly written himself
> 
> The function stpncpy first appears in glibc with a 1993 FSF Copyright;
> according to the ChangeLog, it was introduced on Oct 29, 1993 by
> Roland McGrath, and according to the NEWS file, it was first released
> with Version 1.07.
> 
> So, to summarize, the Linux manual is rather misleading.  Even
> though stpcpy() indeed wasn't a GNU invention, it was first introduced
> into the UNIX world by extensive use in the GNU coreutils (then
> called fileutils and textutils) in 1989, only very few years after
> its original appearance.  The glibc was the first UNIX-like C library
> to include it only three years later, nearly a decade before FreeBSD,
> about 15 years before POSIX, and more than two decades before OpenBSD
> reluctantly followed, forced by POSIX.  That said,
> 
>   stpcpy() is dangerous DOS crap; don't use it
> 
> would be slightly more accurate, but given who pushed it during the
> early years,
> 
>   stpcpy() is dangerous GNU crap; don't use it
>   
> isn't that far off the mark, either.
> 
> Anyway, we should update our manual, see below.
> 
> Yours,
>   Ingo
> 
> 
> Index: stpcpy.3
> ===================================================================
> RCS file: /cvs/src/lib/libc/string/stpcpy.3,v
> retrieving revision 1.5
> diff -u -p -r1.5 stpcpy.3
> --- stpcpy.3	25 Sep 2013 21:50:18 -0000	1.5
> +++ stpcpy.3	23 Feb 2014 22:06:06 -0000
> @@ -174,9 +174,11 @@ and
>  functions conform to
>  .St -p1003.1-2008 .
>  .Sh HISTORY
> -The
> +The function
>  .Fn stpcpy
> -and
> +first appeared in the Lattice C AmigaDOS compiler (1986 or earlier).
> +The function
>  .Fn stpncpy
> -functions first appeared in
> +first appeared in the GNU C library version 1.07 (1993).
> +Both functions have been available since
>  .Ox 5.1 .
> 
> ----- End forwarded message -----
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

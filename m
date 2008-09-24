From: Daniel Gollub <dgollub-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [LTP] ltp getdents syscalls testcases and 2.6.27-rcX
Date: Wed, 24 Sep 2008 16:05:24 +0200
Message-ID: <200809241605.24925.dgollub@suse.de>
References: <200809161427.36373.dgollub@suse.de> <1222260480.5395.17.camel@subratamodak.linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1222260480.5395.17.camel-NRFfyExJdYpgXGGE5LP+UZlqa2bBAFbm0E9HWUfgJXw@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: subrata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, Garrett Cooper <yanegomi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: ltp-list-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Adrian Bunk <bunk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wednesday 24 September 2008 14:48:00 Subrata Modak wrote:
> On Tue, 2008-09-16 at 14:27 +0200, Daniel Gollub wrote:
> > Hi,
> >
> > with 2.6.27-rc1(?) linux/dirent.h got removed Kbuild headers_instal=
l
> > targe and dirent struct got removed:
> >
> >
> > commit cf6ae8b50e0ee3f764392dadd1970e3f03c40773
> > Author: Adrian Bunk <bunk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Date: =C2=A0 Fri Jul 25 01:46:46 2008 -0700
> >
> > =C2=A0 =C2=A0 remove the in-kernel struct dirent{,64}
> > =C2=A0 =C2=A0
> > =C2=A0 =C2=A0 The kernel struct dirent{,64} were different from the=
 ones in
> > =C2=A0 =C2=A0 userspace.
> > =C2=A0 =C2=A0
> > =C2=A0 =C2=A0 Even worse, we exported the kernel ones to userspace.
> > =C2=A0 =C2=A0
> > =C2=A0 =C2=A0 But after the fat usages are fixed we can remove the =
conflicting
> > =C2=A0 =C2=A0 kernel versions.
> >
> >
> > This broke the build of some LTP syscalls testcases for "getdents",=
 since
> > the <linux/dirent.h> include is missing and the "internal" dirent s=
truct
> > get/got used in:
> >
> > testcases/kernel/syscalls/getdents/getdents01.c =C2=A0
> > testcases/kernel/syscalls/getdents/getdents03.c
> > testcases/kernel/syscalls/getdents/getdents02.c =C2=A0
> > testcases/kernel/syscalls/getdents/getdents04.c
> >
> > http://ltp.cvs.sourceforge.net/ltp/ltp/testcases/kernel/syscalls/ge=
tdents
> >/
> >
> > Is it safe to use the userspace dirent struct from <dirent.h> to fi=
x the
> > build of this? Or what should be used for testing the getdents inte=
rface
> > instead?
>
> Yes, it is. There are numerous test cases in LTP which use:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct dirent,
> by including /usr/include/dirent.h. The interesting part is, this guy
> (/usr/include/dirent.h) in turn includes /usr/include/bits/dirent.h,
> where the definition of struct resides. Following is the patch which
> solves this issue along with page.h header file removal from 2.6.25
> onwards, reported by Garret earlier.

Tried the patch - ltp build with 2.6.27-rc linux headers sucessfully.
Thanks for the info and the patch!

Btw. man pages need to get also updated ... there are some pages which =
still=20
mention <linux/dirent.h>.

Garret, with 2.6.25 <asm/page.h> got removed - right?
If so swapon(2) man page needs also get fixed:

dgollub@marvin:~/projects/man-pages> grep -r "asm\/page.h" *
man2/swapon.2:.B #include <asm/page.h>     /* to find PAGE_SIZE */

best regards,
Daniel

---

diff --git a/man2/getdents.2 b/man2/getdents.2
index bd9d261..eb13258 100644
--- a/man2/getdents.2
+++ b/man2/getdents.2
@@ -30,8 +30,8 @@ getdents \- get directory entries
 .SH SYNOPSIS
 .nf
 .B #include <unistd.h>
+.B #include <dirent.h>
 .B #include <linux/types.h>
-.B #include <linux/dirent.h>
 .B #include <linux/unistd.h>
 .B #include <errno.h>
=20
diff --git a/man2/readdir.2 b/man2/readdir.2
index a757da1..b831320 100644
--- a/man2/readdir.2
+++ b/man2/readdir.2
@@ -30,8 +30,8 @@
 readdir \- read directory entry
 .SH SYNOPSIS
 .nf
+.B #include <dirent.h>
 .B #include <linux/types.h>
-.B #include <linux/dirent.h>
 .sp
 .BI "int readdir(unsigned int " fd ", struct dirent *" dirp ","
 .BI "            unsigned int " count );
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

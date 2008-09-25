From: Daniel Gollub <dgollub-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [LTP] ltp getdents syscalls testcases and 2.6.27-rcX
Date: Thu, 25 Sep 2008 11:17:30 +0200
Message-ID: <200809251117.30959.dgollub@suse.de>
References: <200809161427.36373.dgollub@suse.de> <200809241605.24925.dgollub@suse.de> <364299f40809250108x714a5ba7ob31fb89b0d7c195c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <364299f40809250108x714a5ba7ob31fb89b0d7c195c-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Garrett Cooper <yanegomi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: subrata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, ltp-list-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Adrian Bunk <bunk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thursday 25 September 2008 10:08:28 Garrett Cooper wrote:
> >> Yes, it is. There are numerous test cases in LTP which use:
> >> =A0 =A0 =A0 =A0 struct dirent,
> >> by including /usr/include/dirent.h. The interesting part is, this =
guy
> >> (/usr/include/dirent.h) in turn includes /usr/include/bits/dirent.=
h,
> >> where the definition of struct resides. Following is the patch whi=
ch
> >> solves this issue along with page.h header file removal from 2.6.2=
5
> >> onwards, reported by Garret earlier.

^^^^^^^^^

> >
> > Tried the patch - ltp build with 2.6.27-rc linux headers sucessfull=
y.
> > Thanks for the info and the patch!
> >
> > Btw. man pages need to get also updated ... there are some pages wh=
ich
> > still mention <linux/dirent.h>.
> >
> > Garret, with 2.6.25 <asm/page.h> got removed - right?
> > If so swapon(2) man page needs also get fixed:
> >
> > dgollub@marvin:~/projects/man-pages> grep -r "asm\/page.h" *
> > man2/swapon.2:.B #include <asm/page.h> =A0 =A0 /* to find PAGE_SIZE=
 */
> >
> > best regards,
> > Daniel
> >
> > ---
> >
[...]


> I find it interesting because I honestly don't remember mentioning th=
is
> :D..
>
> Would you perhaps mean linux/signalfd.h vs sys/signalfd.h?

I don't know either - i was just refering to Subrata's reply...
Anyway, asm/page.h is really gone:

commit ed7b1889da256977574663689b598d88950bbd23
Author: Kirill A. Shutemov <k.shutemov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date:   Thu Feb 7 00:15:56 2008 -0800

    Unexport asm/page.h

    Do not export asm/page.h during make headers_install.  This removes=
=20
PAGE_SIZE
    from userspace headers.



Garret, just to refresh your memory ..... ;)=20
http://article.gmane.org/gmane.linux.ltp/4873


best regards,
Daniel

---

diff --git a/man2/swapon.2 b/man2/swapon.2
index 4c7008a..2a22be7 100644
--- a/man2/swapon.2
+++ b/man2/swapon.2
@@ -40,8 +40,6 @@ swapon, swapoff \- start/stop swapping to file/device
 .SH SYNOPSIS
 .B #include <unistd.h>
 .br
-.B #include <asm/page.h>     /* to find PAGE_SIZE */
-.br
 .B #include <sys/swap.h>
 .sp
 .BI "int swapon(const char *" path ", int " swapflags );

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

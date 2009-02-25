From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: timeradd(3)
Date: Thu, 26 Feb 2009 08:40:35 +1300
Message-ID: <cfd18e0f0902251140j490ab762s375826ca9787f714@mail.gmail.com>
References: <49A53D50.8070405@alpha-bit.de> <49A53E4F.7020509@alpha-bit.de>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <49A53E4F.7020509-TAFHyoIWub4hFhg+JK9F0w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Gebert <martin.gebert-TAFHyoIWub4hFhg+JK9F0w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, jkmaline-kf+aQKke1yb1KXRcyAk9cg@public.gmane.org, mark-hostap-6pk7R1svBr8dnm+yROfE0A@public.gmane.org, Ulrich Drepper <drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

[CC+=linux-man, and other possibly interested parties]

On 2/26/09, Martin Gebert <martin.gebert-TAFHyoIWub4hFhg+JK9F0w@public.gmane.org> wrote:
> And on a related note, my local /usr/include/sys/time.h:163 states
>
> "NOTE: `timercmp' does not work for >= or <=."
>
> IMHO this should be mentioned in the man page, shouldn't it?

It's a good point.  I had missed that comment when I wrote the
timeradd.3 man page for timercmp() and friends.

However, like Jouni Malinen in the thread at
http://lists.shmoo.com/pipermail/hostap/2003-October/004748.html ,
I was puzzled because the implementation of timercmp() in glibc looks
as though it should work for <= and >=.

The mystery deepens, when one sees that on some systems (HP-UX
http://docs.hp.com/en/B9106-90009/getitimer.2.html, Tru64, Irix) the
man pages explicitly document this restriction, but on others (e.g.,
FreeBSD timercmp(3)) they do not.  (Comments in the HP-UX headers also
note that == does not work.)  And the OpenBSD 3.1 man page goes even
further, explicitly noting that all values of CMP are allowed:

     timercmp(a, b, CMP) compares two time values in the form a CMP b, where
     CMP is <, <=, ==, !=, >=, or > .

Googling found this patch, which, I think, unravels the mystery:

http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/sys/time.h.diff?r1=1.5&r2=1.6

That diff contains the following:

=====
-/*
- * Operations on timevals.
- *
- * NB: timercmp does not work for >= or <=.
- */
-#define	timerisset(tvp)		((tvp)->tv_sec || (tvp)->tv_usec)
-#define	timercmp(tvp, uvp, cmp)	\
-	((tvp)->tv_sec cmp (uvp)->tv_sec || \
-	 (tvp)->tv_sec == (uvp)->tv_sec && (tvp)->tv_usec cmp (uvp)->tv_usec)
+/* Operations on timevals. */
 #define	timerclear(tvp)		(tvp)->tv_sec = (tvp)->tv_usec = 0
+#define	timerisset(tvp)		((tvp)->tv_sec || (tvp)->tv_usec)
+#define	timercmp(tvp, uvp, cmp)				\
+	(((tvp)->tv_sec == (uvp)->tv_sec) ?			\
+	    ((tvp)->tv_usec cmp (uvp)->tv_usec) :			\
+	    ((tvp)->tv_sec cmp (uvp)->tv_sec))
=====

The old version corresponds to that found on systems such as HP-UX,
Irix, and Tru64 with a broken timercmp().  The new version corresponds
to the implementation in glibc.  As far as I can se, glibc has always
had that implementation -- at least as far back as glibc 2.0, so that
the comment in the glibc sources appears to be wrong.

Now, having said all of that, the man pages probably should say
something about this.  I've added a note that on some systems
(but not glibc), CMP of <=, >=, or == does not work wth
timercmp(), and pointing out the portable alternatives
(!timercmp(..., >), !timercmp(..., <), and !timercmp(..., !=), respectively).

The change will be in man-pages-3.20.

Thanks for this report, Martin.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

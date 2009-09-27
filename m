From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCHES] Typos and questions
Date: Sun, 27 Sep 2009 09:36:22 +0200
Message-ID: <cfd18e0f0909270036x454a5f42q91dce7e9252bf6f5@mail.gmail.com>
References: <20090926054751.GA11597@nekral.nekral.homelinux.net>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090926054751.GA11597-pDMkYksm/NDBVznEOA0nCqMXiC8k1aZu0e7PPNI6Mm0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Nicolas_Fran=E7ois?= <nicolas.francois-Fa7rcPG4DJn7nK0/Xc0eeg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Salut Nicolas,

On Sat, Sep 26, 2009 at 7:47 AM, Nicolas Fran=E7ois
<nicolas.francois-Fa7rcPG4DJn7nK0/Xc0eeg@public.gmane.org> wrote:
> Hello,
>
> Please find attached a set of patches.
> They should have a explicit name, and some have additional info in th=
e
> header if needed.
>
> In my opinion, the patches starting with 0 can be applied as is (afte=
r a
> short review).

Yes. A great set of patches! Thanks! one or two comments below.

> The patches starting with a 9 need to be reviewed. Some of them are n=
ot
> patches, but questions:
> =A0* 904-tcp.7-list_separator.patch
> =A0* 919_cpuset.7-question.patch
>
> Please let me know if after a short look some of them should be repor=
ted
> first to bugzilla.

I will cover the 9* patches in a separate reply.

> The patches should apply to current git. The order should not be an i=
ssue.

I applied all of the 0* patches except for two.

009:
I see why you wanted to change this, but the change is not correct.
Really, "current processor" is best made into "host system". (The
domain name is a property of the system, not a process.)

018:

The first part of the patch isn't right (but again, I can see why you
wanted to malke a change). "waied for" is a qualify phrase for
"children". Adding a hyphen helps make that clear.

I applied this:

--- a/man2/sigaction.2
+++ b/man2/sigaction.2
@@ -304,10 +304,10 @@ The
 .I si_utime
 and
 .I si_stime
-fields do not include the times used by waited for children (unlike
+fields do not include the times used by waited-for children (unlike
 .BR getrusage (2)
 and
-.BR time (2).
+.BR time (2)).
 In kernels up to 2.6, and since 2.6.27, these fields report
 CPU time in units of
 .IR sysconf(_SC_CLK_TCK) .

Thanks very much for all of these!!

Cheers,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Watch my Linux system programming book progress to publication!
http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

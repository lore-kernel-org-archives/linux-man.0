From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [OVERVIEW 0/9] Cleanup Time
Date: Sun, 17 Jan 2010 18:35:13 +1300
Message-ID: <cfd18e0f1001162135s7a9bf828oe08694374022199b@mail.gmail.com>
References: <1263080737-2868-1-git-send-email-mfwitten@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1263080737-2868-1-git-send-email-mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael,

On Sun, Jan 10, 2010 at 12:45 PM, Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
> This patch series is a medley of cleanups
> focused mainly on issues related to time.

Thanks for the very nicely broken down patch set. All patches
processed now, I think.

Cheers,

Michael


> Subjects:
>
> =A0 =A0[PATCH 1/9] tzset.3: Cleanup grammar/clarity
> =A0 =A0[PATCH 2/9] stime.2, strftime.3, tzset.3, zic.8: GMT -> UTC (w=
here appropriate)
> =A0 =A0[PATCH 3/9] strftime.3: Clarification of %z
> =A0 =A0[PATCH 4/9] strftime.3: %z is defined by the SUSv3
> =A0 =A0[PATCH 5/9] strftime.3: Move 822-compliant date format example=
 to EXAMPLES section
> =A0 =A0[PATCH 6/9] strftime.3: Expanded introduction
> =A0 =A0[PATCH 7/9] "timezone" -> "time zone"
> =A0 =A0[PATCH 8/9] Consistently define the Epoch
> =A0 =A0[PATCH 9/9] "null terminated" -> "null-terminated"
>
> Overall diffstat
>
> =A0 =A0man2/gettimeofday.2 =A0| =A0 =A04 +-
> =A0 =A0man2/stime.2 =A0 =A0 =A0 =A0 | =A0 =A04 +-
> =A0 =A0man2/time.2 =A0 =A0 =A0 =A0 =A0| =A0 =A04 +-
> =A0 =A0man2/utimensat.2 =A0 =A0 | =A0 =A06 ++--
> =A0 =A0man3/ctime.3 =A0 =A0 =A0 =A0 | =A0 13 +++++------
> =A0 =A0man3/difftime.3 =A0 =A0 =A0| =A0 =A06 ++--
> =A0 =A0man3/ftime.3 =A0 =A0 =A0 =A0 | =A0 =A06 ++--
> =A0 =A0man3/fts.3 =A0 =A0 =A0 =A0 =A0 | =A0 =A08 +++---
> =A0 =A0man3/getdate.3 =A0 =A0 =A0 | =A0 =A02 +-
> =A0 =A0man3/getnetent.3 =A0 =A0 | =A0 =A02 +-
> =A0 =A0man3/getprotoent.3 =A0 | =A0 =A02 +-
> =A0 =A0man3/getrpcent.3 =A0 =A0 | =A0 =A02 +-
> =A0 =A0man3/getservent.3 =A0 =A0| =A0 =A02 +-
> =A0 =A0man3/getspnam.3 =A0 =A0 =A0| =A0 =A04 +-
> =A0 =A0man3/getsubopt.3 =A0 =A0 | =A0 =A02 +-
> =A0 =A0man3/mq_receive.3 =A0 =A0| =A0 =A02 +-
> =A0 =A0man3/mq_send.3 =A0 =A0 =A0 | =A0 =A02 +-
> =A0 =A0man3/putgrent.3 =A0 =A0 =A0| =A0 =A02 +-
> =A0 =A0man3/rtime.3 =A0 =A0 =A0 =A0 | =A0 =A04 +-
> =A0 =A0man3/sem_wait.3 =A0 =A0 =A0| =A0 =A02 +-
> =A0 =A0man3/strcat.3 =A0 =A0 =A0 =A0| =A0 =A04 +-
> =A0 =A0man3/strcpy.3 =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0 =A0man3/strftime.3 =A0 =A0 =A0| =A0 58 ++++++++++++++++++++++++++=
+++++++----------------
> =A0 =A0man3/strptime.3 =A0 =A0 =A0| =A0 =A07 ++---
> =A0 =A0man3/sysconf.3 =A0 =A0 =A0 | =A0 =A02 +-
> =A0 =A0man3/timeradd.3 =A0 =A0 =A0| =A0 =A03 +-
> =A0 =A0man3/tzset.3 =A0 =A0 =A0 =A0 | =A0 44 +++++++++++++++++++-----=
--------------
> =A0 =A0man4/console_ioctl.4 | =A0 =A02 +-
> =A0 =A0man4/rtc.4 =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +-
> =A0 =A0man5/core.5 =A0 =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0 =A0man5/proc.5 =A0 =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0 =A0man5/tzfile.5 =A0 =A0 =A0 =A0| =A0 18 +++++++-------
> =A0 =A0man7/environ.7 =A0 =A0 =A0 | =A0 =A02 +-
> =A0 =A0man7/hier.7 =A0 =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0 =A0man7/icmp.7 =A0 =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0 =A0man7/time.7 =A0 =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0 =A0man8/tzselect.8 =A0 =A0 =A0| =A0 10 ++++----
> =A0 =A0man8/zdump.8 =A0 =A0 =A0 =A0 | =A0 =A02 +-
> =A0 =A0man8/zic.8 =A0 =A0 =A0 =A0 =A0 | =A0 30 +++++++++++++---------=
----
> =A0 =A039 files changed, 146 insertions(+), 129 deletions(-)
>
> Sincerely,
> Michael Witten
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

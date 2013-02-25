From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] clock_getres.2: Add linux specific clock ids
Date: Mon, 25 Feb 2013 10:06:52 +0100
Message-ID: <CAKgNAki91M-Nor=uGpLj-CdmQ0dmXQC7__MHcg6jhn8brkq3pQ@mail.gmail.com>
References: <20130220170123.GA4969@rei>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130220170123.GA4969@rei>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: chrubis-AlSwsSmVLrQ@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jiri Bohac <jbohac-AlSwsSmVLrQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Cyril,

On Wed, Feb 20, 2013 at 6:01 PM,  <chrubis-AlSwsSmVLrQ@public.gmane.org> wrote:
> Hi!
> Attached patch adds following clock ids:
>
> CLOCK_REALTIME_COARSE
> CLOCK_MONOTONIC_COARSE
> CLOCK_BOOTTIME

Thanks for these patches. I've applied. Note that I do like to get
patches inline, for review purposes (and you can attach them also, if
you are worried about mailers breaking something).

Thanks also for including the commit hashes. I think the CLOCK_BOOTIME
has should however be 70a08cca1227dc31c784ec930099a4417a06e7d0 and I
amended accordingly.

Cheers,

Michael


diff --git a/man2/clock_getres.2 b/man2/clock_getres.2
index 794dd65..d82e883 100644
--- a/man2/clock_getres.2
+++ b/man2/clock_getres.2
@@ -27,8 +27,6 @@
 .\" 2003-08-24 aeb, large parts rewritten
 .\" 2004-08-06 Christoph Lameter <clameter-sJ/iWh9BUns@public.gmane.org>, SMP note
 .\"
-.\" FIXME: Linux 2.6.39 adds CLOCK_BOOTTIME
-.\"
 .TH CLOCK_GETRES 2 2012-11-07 "" "Linux Programmer's Manual"
 .SH NAME
 clock_getres, clock_gettime, clock_settime \- clock and time functions
@@ -130,6 +128,12 @@ and by the incremental adjustments performed by
 .BR adjtime (3)
 and NTP.
 .TP
+.BR CLOCK_REALTIME_COARSE " (since Linux 2.6.32; Linux-specific)"
+.\" Added in commit da15cfdae03351c689736f8d142618592e3cebc3
+Faster but less precise version of
+.BR CLOCK_REALTIME.
+Use when you need very fast, but not fine-grained timestamps.
+.TP
 .B CLOCK_MONOTONIC
 Clock that cannot be set and represents monotonic time since
 some unspecified starting point.
@@ -148,6 +152,19 @@ that is not subject to NTP adjustments or
 the incremental adjustments performed by
 .BR adjtime (3).
 .TP
+.BR CLOCK_MONOTONIC_COARSE " (since Linux 2.6.32; Linux-specific)"
+.\" Added in commit da15cfdae03351c689736f8d142618592e3cebc3
+Faster but less precise version of
+.BR CLOCK_MONOTONIC.
+Use when you need very fast, but not fine-grained timestamps.
+.TP
+.BR CLOCK_BOOTTIME " (since Linux 2.6.39; Linux-specific)"
+.\" Added in commit 7fdd7f89006dd5a4c702fa0ce0c272345fa44ae0
+Identical to
+.BR CLOCK_MONOTONIC ,
+except it also includes any time spent in suspend. This allows applications to
+get a suspend aware monotonic clock.
+.TP
 .B CLOCK_PROCESS_CPUTIME_ID
 High-resolution per-process timer from the CPU.
 .TP
-- 
1.7.8.6
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

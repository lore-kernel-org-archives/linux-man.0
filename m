From: Rasmus Villemoes <linux-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: clock_gettime.2: _COARSE clocks are not always faster...
Date: Sat, 09 Apr 2016 18:50:47 +0200
Message-ID: <87k2k67ml4.fsf@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael

The other day, I was curious how the vdso was implemented on ppc, and I
noted that neither ppc32 or ppc64 handle the _COARSE versions of
CLOCK_{REALTIME,MONOTONIC} in the vdso, so they fall back to an actual
syscall. And sure enough, measuring CLOCK_MONOTONIC
vs. CLOCK_MONOTONIC_COARSE shows that the latter has three times as much
overhead as the former.

Whether it's worth adding a note to the man page is up to you.

Best,
Rasmus
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

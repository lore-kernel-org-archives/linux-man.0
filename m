From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] small improvement for ptrace.2
Date: Thu, 8 Sep 2011 16:05:54 +0200
Message-ID: <CAKgNAkg_AT16FZvFnuoPttH0O4twT2HAZ_nACLHN6RAFnoC3xw@mail.gmail.com>
References: <20110223105355.1ae142f1@keeper.home.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110223105355.1ae142f1-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, Feb 23, 2011 at 8:53 AM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wrote=
:
> Hello.
>
> --- ptrace.2 =9A =9A2010-12-26 12:01:43.615106727 +0300
> +++ /tmp/ptrace.2 =9A =9A =9A 2011-02-23 10:52:27.371001084 +0300
> @@ -206,7 +206,7 @@
> =9A.TP
> =9A.BR PTRACE_O_TRACESYSGOOD " (since Linux 2.4.6)"
> =9AWhen delivering syscall traps, set bit 7 in the signal number
> -(i.e., deliver \fI(SIGTRAP | 0x80)\fP
> +(i.e., deliver \fI(SIGTRAP | 0x80)\fP.
> =9AThis makes it easy for the tracer to tell the difference
> =9Abetween normal traps and those caused by a syscall.
> =9A.RB ( PTRACE_O_TRACESYSGOOD

Applied for 3.33.

Thanks,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

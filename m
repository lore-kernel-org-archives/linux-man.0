From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: ptrace.2: PTRACE_KILL needs a stopped process too
Date: Mon, 23 Apr 2012 06:56:43 +1200
Message-ID: <CAKgNAkhtu8d0NKcTwWyCA8qWgz8Lag+GcpEE1=YMVe_Nh8XJ9Q@mail.gmail.com>
References: <20091216004533.22261.qmail@kosh.dhis.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20091216004533.22261.qmail-ptgZXYu0fikgsBAKwltoeQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: pacman-ptgZXYu0fikgsBAKwltoeQ@public.gmane.org
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

[widening CC]

Denys, (Oleg, Tejun,)

Would you be able to take a look at this report that is now already a
long time in my inbox. Is there something here that still needs to be
fixed after your recent changes to ptrace.2, Denys?

Thanks,

Michael



---------- Forwarded message ----------
=46rom:  <pacman-ptgZXYu0fikgsBAKwltoeQ@public.gmane.org>
Date: Wed, Dec 16, 2009 at 1:45 PM
Subject: ptrace.2: PTRACE_KILL needs a stopped process too
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org


The man page says "For requests other than PTRACE_KILL, the child proce=
ss
must be stopped."

But experience[1] shows that PTRACE_KILL also requires the child proces=
s to
be stopped. gdb older than 7.0 doesn't always make sure its child proce=
ss is
stopped before attempting a PTRACE_KILL (try SIGTERMing gdb while the c=
hild
process is running).

That was fixed in gdb 7.0 by the addition of a SIGSTOP and wait before =
the
PTRACE_KILL, so the kernel and latest gdb get along well now, which lea=
ves
the man page as the only thing that's out of sync.

If the man page is describing actual intended kernel behavior, then it'=
s a
fairly long-standing kernel bug. But I get the feeling this was just an
assumption by the original man page author that never got checked.

[1] http://lists.gnu.org/archive/html/bug-coreutils/2009-11/msg00267.ht=
ml
=A0 =A0http://lists.gnu.org/archive/html/bug-coreutils/2009-12/msg00025=
=2Ehtml
=A0 =A0http://lists.gnu.org/archive/html/bug-coreutils/2009-12/msg00094=
=2Ehtml


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

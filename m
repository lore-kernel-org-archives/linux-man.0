From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: ptrace(PTRACE_SYSCALL) and data field
Date: Mon, 30 Mar 2009 13:38:33 +1300
Message-ID: <cfd18e0f0903291738j650868b5xe1ff345a182e9ae3@mail.gmail.com>
References: <200903172346.32372.vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <200903172346.32372.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Roland McGrath <roland-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Mar 18, 2009 at 4:46 PM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wro=
te:
> the ptrace(2) page doesnt say anything about the data field (ignored =
or
> otherwise). =A0it seems to be ignored, but i didnt trace the kernel
> exhaustively. =A0the examples found via google shows that it's ignore=
d. =A0strace
> usage seems odd (it passes in an irrelevant pointer), which would ind=
icate
> it's ignored as well ...
> -mike

Mike,

=46or man-pages-3.20, I've upated the PTRACE_SYSCALL documentation to
note that 'data' is used as for PTRACE_CONT.  I've also added similar
text to PTRAC_SYSEMU*.

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
=46ound a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

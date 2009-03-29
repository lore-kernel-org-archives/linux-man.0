From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] ptrace(2): only reference sys/user.h
Date: Mon, 30 Mar 2009 09:34:54 +1300
Message-ID: <cfd18e0f0903291334s491578e0v7ff55caac2b3b188@mail.gmail.com>
References: <1237334281-20353-1-git-send-email-vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1237334281-20353-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Mike,

On Wed, Mar 18, 2009 at 12:58 PM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wr=
ote:
> The kernel no longer installs linux/user.h, so update references to
> sys/user.h.

Thanks.  Applied for 3.20.

Cheers,

Michael


> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> ---
> =A0man2/ptrace.2 | =A0 =A05 ++---
> =A01 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/man2/ptrace.2 b/man2/ptrace.2
> index f75435d..0611bfe 100644
> --- a/man2/ptrace.2
> +++ b/man2/ptrace.2
> @@ -133,8 +133,7 @@ Reads a word at offset
> =A0.I addr
> =A0in the child's USER area,
> =A0which holds the registers and other information about the process
> -(see \fI<linux/user.h>\fP and \fI<sys/user.h>\fP).
> -The word is returned as the result of the
> +(see \fI<sys/user.h>\fP). =A0The word is returned as the result of t=
he
> =A0.BR ptrace ()
> =A0call.
> =A0Typically the offset must be word-aligned, though this might vary =
by
> @@ -165,7 +164,7 @@ some modifications to the USER area are disallowe=
d.
> =A0.BR PTRACE_GETREGS ", " PTRACE_GETFPREGS
> =A0Copies the child's general purpose or floating-point registers,
> =A0respectively, to location \fIdata\fP in the parent.
> -See \fI<linux/user.h>\fP for information on
> +See \fI<sys/user.h>\fP for information on
> =A0the format of this data.
> =A0(\fIaddr\fP is ignored.)
> =A0.TP
> --
> 1.6.2
>
>



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

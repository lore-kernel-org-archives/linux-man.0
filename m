From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] execve(2): pending signals are not cleared
Date: Tue, 21 Apr 2009 04:41:28 +0200
Message-ID: <cfd18e0f0904201941l69190228t134f2a701ba0303b@mail.gmail.com>
References: <1239584543-13548-1-git-send-email-vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1239584543-13548-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Mike,

On Mon, Apr 13, 2009 at 3:02 AM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wro=
te:
> As pointed out by Christopher Head <chead-EynCeXvFgoheoWH0uzbU5w@public.gmane.org>, the sigpending(=
2)
> contradicts the execve(2) page.
>
> The sigpending(2) page states:
> ... the pending signal set is preserved across an execve(2).
>
> While the execve(2) page states:
> The set of pending signals is cleared (sigpending(2)).
>
> POSIX supports the sigpending(2) statement, so the line from execve(2=
)
> should be dropped. =A0See this page:
> http://www.opengroup.org/onlinepubs/9699919799/functions/exec.html
> Where it states:
> The new process shall inherit at least the following attributes from =
the
> calling process image:
> =A0* Pending signal (see sigpending())

Yes, the statement in execve.2 is clearly wrong.  I suspect that I may
even have written it, but I don't know what I could have been thinking
of when I did so.  I applied your pattch for man-pages-3.22.

Cheers,

Michael

> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> ---
> =A0man2/execve.2 | =A0 =A03 ---
> =A01 files changed, 0 insertions(+), 3 deletions(-)
>
> diff --git a/man2/execve.2 b/man2/execve.2
> index 0602a56..c3a43e1 100644
> --- a/man2/execve.2
> +++ b/man2/execve.2
> @@ -118,9 +118,6 @@ glibc 2.
> =A0All process attributes are preserved during an
> =A0.BR execve (),
> =A0except the following:
> -.IP * 3
> -The set of pending signals is cleared
> -.RB ( sigpending (2)).
> =A0.IP *
> =A0The dispositions of any signals that are being caught are
> =A0reset to being ignored.
> --
> 1.6.2.2
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

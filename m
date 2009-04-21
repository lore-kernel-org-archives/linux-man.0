From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] sigpending(2): fix typos in NOTES
Date: Tue, 21 Apr 2009 04:44:15 +0200
Message-ID: <cfd18e0f0904201944m2e88a709gb9776a5d9708d352@mail.gmail.com>
References: <1239583361-13442-1-git-send-email-vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1239583361-13442-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Apr 13, 2009 at 2:42 AM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wro=
te:
> As Christopher Head <chead-EynCeXvFgoheoWH0uzbU5w@public.gmane.org> describes:
> In NOTES, there is the sentence "The set of signals that is pending f=
or a
> thread is the union of the set of signals that is pending for that th=
read
> and the set of threads that is peding for the process as a whole; see
> signal(7).". =A0The word "pending" is misspelt (missing a letter "n")=
; also,
> "the set of threads that is pending" should be "the set of signals th=
at is
> pending".

Thanks.  Applied for man-pages-3.22.

Cheers,

Michael

> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> ---
> =A0man2/sigpending.2 | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/man2/sigpending.2 b/man2/sigpending.2
> index e70b614..b5a2715 100644
> --- a/man2/sigpending.2
> +++ b/man2/sigpending.2
> @@ -64,8 +64,8 @@ See
> =A0for details on manipulating signal sets.
>
> =A0The set of signals that is pending for a thread
> -is the union of the set of signals that is pending for that thread
> -and the set of threads that is peding for the process as a whole; se=
e
> +is the union of the set of signals that are pending for that thread
> +and the set of signals that are pending for the process as a whole; =
see
> =A0.BR signal (7).
>
> =A0A child created via
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

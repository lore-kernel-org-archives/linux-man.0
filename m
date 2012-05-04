From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] nsswitch.conf.5: tfix
Date: Fri, 4 May 2012 15:46:04 +1200
Message-ID: <CAKgNAkirUN6HOkoD7QUTH7ya3WXmmP=iz4XU_6e9FBAMQ2aPqg@mail.gmail.com>
References: <1336101819-29364-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1336101819-29364-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi David,

Already found and fixed. thanks,

Michael

On Fri, May 4, 2012 at 3:23 PM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrot=
e:
> Remove extra line committed by mistake in 7534ec
> ---
> =A0man5/nsswitch.conf.5 | =A0 =A01 -
> =A01 file changed, 1 deletion(-)
>
> diff --git a/man5/nsswitch.conf.5 b/man5/nsswitch.conf.5
> index 5f9d310..9b6f266 100644
> --- a/man5/nsswitch.conf.5
> +++ b/man5/nsswitch.conf.5
> @@ -31,7 +31,6 @@ is used by the GNU C Library to determine
> =A0the sources from which to obtain name-service information in
> =A0a range of categories,
> =A0and in what order.
> -(The "
> =A0Each category of information is identified by a database name.
> =A0.LP
> =A0The file is plain ASCII text, with columns separated by spaces or =
tab
> --
> 1.7.10
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

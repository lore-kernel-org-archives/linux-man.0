From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 3/9] strftime.3: Clarification of %z
Date: Sun, 17 Jan 2010 08:26:16 +1300
Message-ID: <cfd18e0f1001161126o5eded557uc55e45518dbd068e@mail.gmail.com>
References: <1263080737-2868-1-git-send-email-mfwitten@gmail.com>
	 <1263080737-2868-4-git-send-email-mfwitten@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1263080737-2868-4-git-send-email-mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael,

On Sun, Jan 10, 2010 at 12:45 PM, Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
> Signed-off-by: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> =A0man3/strftime.3 | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)


Thanks. Applied for 3.24.

Cheers,

Michael


> diff --git a/man3/strftime.3 b/man3/strftime.3
> index e356ccb..9b1b0b0 100644
> --- a/man3/strftime.3
> +++ b/man3/strftime.3
> @@ -242,7 +242,7 @@ The year as a decimal number without a century (r=
ange 00 to 99).
> =A0The year as a decimal number including the century.
> =A0.TP
> =A0.B %z
> -The time-zone as hour offset from UTC.
> +The +hhmm or -hhmm numeric time zone (that is, the hour and minute o=
ffset from UTC).
> =A0Required to emit RFC\ 822-conformant dates
> =A0(using "%a,\ %d\ %b\ %Y\ %H:%M:%S\ %z"). (GNU)
> =A0.TP
> --
> 1.6.6.102.gd6f8f
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

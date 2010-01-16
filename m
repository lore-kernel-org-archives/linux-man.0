From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 4/9] strftime.3: %z is defined by the SUSv3
Date: Sun, 17 Jan 2010 08:29:47 +1300
Message-ID: <cfd18e0f1001161129g5640e86aj9413c1c7e7ab661@mail.gmail.com>
References: <1259879998-1140-1-git-send-email-mfwitten@gmail.com>
	 <1259879998-1140-2-git-send-email-mfwitten@gmail.com>
	 <1259879998-1140-3-git-send-email-mfwitten@gmail.com>
	 <1259879998-1140-4-git-send-email-mfwitten@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1259879998-1140-4-git-send-email-mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael

On Fri, Dec 4, 2009 at 11:39 AM, Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wr=
ote:
> On my system, `man 3p strftime' defines %z (much more rigorously).
> You can see for yourself here:
>
> =A0http://www.opengroup.org/onlinepubs/009695399/functions/strftime.h=
tml
>
> So, it would appear that %z is no longer just a GNU extension.
> Hence, the `(GNU)' tag has been replaced with the `(SU)' tag.

Thanks. Applied for 3.24.

Cheers,

Michael


> Signed-off-by: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> =A0man3/strftime.3 | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/man3/strftime.3 b/man3/strftime.3
> index 9b1b0b0..0d925fa 100644
> --- a/man3/strftime.3
> +++ b/man3/strftime.3
> @@ -244,7 +244,7 @@ The year as a decimal number including the centur=
y.
> =A0.B %z
> =A0The +hhmm or -hhmm numeric time zone (that is, the hour and minute=
 offset from UTC).
> =A0Required to emit RFC\ 822-conformant dates
> -(using "%a,\ %d\ %b\ %Y\ %H:%M:%S\ %z"). (GNU)
> +(using "%a,\ %d\ %b\ %Y\ %H:%M:%S\ %z"). (SU)
> =A0.TP
> =A0.B %Z
> =A0The timezone or name or abbreviation.
> --
> 1.6.5.2.180.gc5b3e
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

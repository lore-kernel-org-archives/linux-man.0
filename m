From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] nroff syntax issue in man3/getutent.3
Date: Thu, 4 Nov 2010 07:28:02 +0100
Message-ID: <AANLkTikWtW1YyPGaHBzu7Yf5j_wvR7yObvVWd_77qN+N@mail.gmail.com>
References: <AANLkTikF9UQ9+q1TB3voccYwDPWOYKC-B+1hAe2YQh=-@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTikF9UQ9+q1TB3voccYwDPWOYKC-B+1hAe2YQh=-@mail.gmail.com>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, Nov 2, 2010 at 12:18 AM, Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote=
:
> Hello Michael,
>
> Here is another one, other pages look fine.

Thanks Denis. Fixed in a different way after a report by Yuri Kozlov. S=
ee git.

Thanks,

Michael


> diff --git a/man3/getutent.3 b/man3/getutent.3
> index 13bd9e7..8e160d2 100644
> --- a/man3/getutent.3
> +++ b/man3/getutent.3
> @@ -209,7 +209,7 @@ Glibc adds reentrant versions
> =A0.sp
> =A0.nf
> =A0.BR "#define _GNU_SOURCE" " =A0 =A0/* or _SVID_SOURCE or _BSD_SOUR=
CE;
> -.R "\& =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0see featur=
e_test_macros(7) */
> +\& =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0see feature_te=
st_macros(7) */
> =A0.B #include <utmp.h>
> =A0.sp
> =A0.BI "int getutent_r(struct utmp *" ubuf ", struct utmp **" ubufp )=
;
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

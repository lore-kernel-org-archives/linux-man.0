From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: small typo in the proc.5 (+ to mail list)
Date: Sat, 22 May 2010 08:33:53 +0200
Message-ID: <AANLkTimkugvnKCsoKIJyNjSS2KtW_wpfhIFqyUhheERk@mail.gmail.com>
References: <20100501211725.14934451@keeper.home.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100501211725.14934451-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Yuri,

On Sat, May 1, 2010 at 7:17 PM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wrote:
> Hello.
>
> --- proc.5 =A0 =A0 =A02010-03-26 17:46:41.000000000 +0300
> +++ /tmp/proc.5 2010-05-01 12:58:03.000000000 +0400
> @@ -633,7 +633,7 @@
> =A0The controlling terminal of the process.
> =A0(The minor device number is contained in the combination of bits
> =A031 to 20 and 7 to 0;
> -the major device number is in bits 15 t0 8.)
> +the major device number is in bits 15 to 8.)
> =A0.TP
> =A0\fItpgid\fP %d
> =A0.\" This field and following, up to and including wchan added 0.99=
=2E1

Thanks. Applied for 3.25.

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

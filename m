From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch], ascii(7): Indent for "troff" makes table to wide
Date: Thu, 10 May 2012 11:52:30 +1200
Message-ID: <CAKgNAkgcbQFWLrHZeoeeO-9TJKmV1KH20HPwPkGzuXH=pry24A@mail.gmail.com>
References: <20120509194214.GA23489@rhi.hi.is>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120509194214.GA23489-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, May 10, 2012 at 7:42 AM, Bjarni Ingi Gislason
<bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org> wrote:
> Package: man-pages
> Version: 3.40
> Severity: minor
> Tags: patch
>
> =A0From "groff -t -ww ...":
>
> warning: around line 53: table wider than line width
>
> =A0Extra indent for "troff" makes the table look misplaced
> (default "ps" output).

Thanks Bjarni. Applied!

Cheers,

Michael


> =A0Patch:
>
> --- ascii.7 =A0 =A0 2012-04-26 22:58:39.000000000 +0000
> +++ ascii.7.new 2012-05-09 00:46:03.000000000 +0000
> @@ -45,7 +45,6 @@
> =A0.LP
> =A0C program \f(CW\(aq\eX\(aq\fP escapes are noted.
> =A0.if t \{\
> -.in 1i
> =A0.ft CW
> =A0\}
> =A0.TS
>
> --
> Bjarni I. Gislason



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

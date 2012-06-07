From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch], suffixes(7): Warnings from "grotty"
Date: Thu, 7 Jun 2012 23:48:45 +1200
Message-ID: <CAKgNAkhEd8fo4sej8iyV2f5JrKxuq9+zXdiRnmEcro3YEK6Gmg@mail.gmail.com>
References: <20120518174722.GA22613@rhi.hi.is>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120518174722.GA22613-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Okay -- already dealt with in
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D673436

Thanks,

Michael

On Sat, May 19, 2012 at 5:47 AM, Bjarni Ingi Gislason
<bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org> wrote:
> Package: manpages
> Version: 3.40
> Severity: minor
> Tags: patch
>
> =A0From "man ..." ("nroff ..."):
>
> grotty:<standard input> (<standard input>):1763: character above firs=
t line discarded
> grotty:<standard input> (<standard input>):2688: character above firs=
t line discarded
> grotty:<standard input> (<standard input>):3286: character above firs=
t line discarded
>
> =A0"man" ("nroff") needs a long page to avoid (imaginary) page
> breaks for the long tables.
>
> =A0The culprit is "Dl 0 -xxxx" (vertical line) where "xxxx" is
> one line (40 nroff units) too long. =A0Or there is a bug in
> "grotty". =A0"nroff" or "tbl" makes an empty line where a page
> break is.
>
> =A0Patch:
>
> --- suffixes.7 =A02012-04-26 22:58:40.000000000 +0000
> +++ suffixes.7.new =A0 =A0 =A02012-05-18 01:22:54.000000000 +0000
> @@ -35,6 +35,9 @@
> =A0.\" FIXME, mtk, May 2007: rendering this page yields the error:
> =A0.\" grotty:suffixes.7:1725: character above first line discarded
> =A0.\"
> +.\" "nroff" ("man") (or "tbl") needs a long page to avoid warnings
> +.\" from "grotty" (at imagined page breaks). =A0Bug in grotty?
> +.if n .pl 1000v
> =A0.TH SUFFIXES 7 =A02000-11-16 "Linux" "Linux Programmer's Manual"
> =A0.SH NAME
> =A0suffixes \- list of file suffixes
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

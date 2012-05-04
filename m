From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: realpath(3) bugs
Date: Sat, 5 May 2012 10:54:10 +1200
Message-ID: <CAKgNAkgjjKXx_Aw5iF_Phe7c7ixpqtfLSiV6fkTttN5ge4CGww@mail.gmail.com>
References: <201205041122.q44BMDEO002270@ucsinet22.oracle.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201205041122.q44BMDEO002270-Og0DlWfCjE/25RUcvsgne1aTQe2KTcn/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Casper.Dik-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andries Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Casper,

On Fri, May 4, 2012 at 11:22 PM,  <Casper.Dik-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org> wrote:
>
>
> For some reason, many of the realpath() manual pages =A0(BSD, Linux) =
have
> words to the following effect:
>
> =A0 =A0 =A0 =A0Solaris may return a relative pathname when the path a=
rgument is relative.
>
> I have looked through the Solaris source files and have found no
> such bug reported or fixed; the implementation from at least 1997 and
> beyond certainly doesn't have this problem and even the older version=
s
> prepend getcwd() or chdir() to dirname and run getcwd() in that
> directory.
>
> Solaris does have a system call which may return relative pathnames:
> resolvepath(). =A0I believe that that function may have confused earl=
ier
> writers of realpath() manual pages and this was later copied without
> verifying that fact.
>
> realpath() existed in Solaris 2.0 as it came from SVr4.0 and even at =
that
> time i t returned the full, non-relative path.

There is unfortunately no indication of how that text came to be in
the page. It appears to have been added when Andries rewrote the Linux
man page in 1999, so I've CCed Andries on the small chance he may
remember something of where the text came from.

Given the info you've provided, I've deleted this text from the Linux
page (well, commented it out in the source). Thanks for the report.

Cheers,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

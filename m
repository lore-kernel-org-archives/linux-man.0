From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Type bug in man 7 glob's text
Date: Mon, 23 Apr 2012 23:55:23 +1200
Message-ID: <CAKgNAkjJFe17+mcSmjD8TMhaQd9guiGDXMvBDs1=5QnnxNmvPg@mail.gmail.com>
References: <BANLkTim1FwHOgiSfaUwaCTx-Du-xkgVDHw@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BANLkTim1FwHOgiSfaUwaCTx-Du-xkgVDHw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitriy Krasil'nikov <krasilnikov.d.o-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sat, Apr 16, 2011 at 4:59 AM, Dmitriy Krasil'nikov
<krasilnikov.d.o-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello!
> I'm using man-pages package of version 3.28 on my Gentoo Linux which =
is
> up-to-date and I've found a type bug in text of "man 7 glob" manual p=
age.
> The bug is in the 34 line in section "Ranges". Below is the text that=
 I
> think is wrong:
>
> "[--0]" matches the three characters '-', '.', '0'
>
> If I understand right, correct string should be:=A0 "[-.0]" matches t=
he three
> characters '-', '.', '0', but I'm not sure in it.

Hello Dmitriy,

This is not correct. Have a careful read of the *whole* sentence
tehre, and also look at "man 7 ascii".

Thanks,

Michael



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

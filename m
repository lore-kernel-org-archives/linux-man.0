From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: errno man page query
Date: Mon, 23 Apr 2012 09:14:01 +1200
Message-ID: <CAKgNAkhu1C3xf0gfdcN61TKiM+HKBN36KWKG=F5hR7wdwzwKfg@mail.gmail.com>
References: <4F93E8C2.5000903@jguk.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F93E8C2.5000903-hus3n9K41k0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Jon,

On Sun, Apr 22, 2012 at 11:17 PM, Jon Grant <jg-hus3n9K41k0@public.gmane.org> wrote:
> Hello
>
> Quoting from this page:
>
> http://man7.org/linux/man-pages/man3/errno.3.html
>
> "a function that succeeds is allowed to change errno."
>
> ^ This sounds clear, e.g. open() can change errno to 0, when it retur=
ns a
> valid fd handle.
>
>
> "Valid error numbers are all nonzero; errno is never set to zero by a=
ny
> system
> =A0 =A0 =A0 call or library function."
>
> ^ This seems to be counter what the earlier line said. Therefore, ope=
n()
> wouldn't be allowed to change errno to 0.
>
> Have I missed something?

I don't really see the problem. The first part says functions may
change errno. The second part adds a qualification; they'll never
change it to zero.

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

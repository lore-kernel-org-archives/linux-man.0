From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] tzset.3: fix description of "n" format
Date: Sat, 24 Mar 2012 16:11:17 +1300
Message-ID: <CAKgNAkiTtKVi-_uVLHjS2GOpFr0c7cZUgXyJXqoxk5dDc6XHhQ@mail.gmail.com>
References: <4EBC16EC.30905@redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4EBC16EC.30905-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Peter,

On Fri, Nov 11, 2011 at 7:24 AM, Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> w=
rote:
> Hello,
>
> according to [1], description of start/end format of TZ variable says=
:
> ...
> Jn
> This specifies the Julian day, with n between 1 and 365. February 29 =
is
> never counted, even in leap years.
> n
> This specifies the Julian day, with n between 0 and 365. February 29 =
is
> counted in leap years.
> ...
>
> This is correct and works. However, man page tzset(3) says:
> ...
> Jn This specifies the Julian day with n between 1 and 365. Febru=E2=80=
=90
> ary 29 is never counted even in leap years.
>
> n This specifies the Julian day with n between 1 and 365. Febru=E2=80=
=90
> ary 29 is counted in leap years.
> ...
>
> For "n" format, interval should be "between 0 and 365". Attached patc=
h is
> solving this issue.
>
> Version of man pages: 3.35
>
>
> peter
>
>
> [1] http://www.gnu.org/s/hello/manual/libc/TZ-Variable.html

Thanks. I applied your patch for man-pages-3.38.

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

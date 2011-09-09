From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Minor typo in man 7 unix: says tcp_socket, but should say unix_socket
Date: Fri, 9 Sep 2011 15:46:50 +0200
Message-ID: <CAKgNAkh9N_=MHoQTJsHSNCJYy8zyenNSEK-T3JAA_8CN7Y6QyQ@mail.gmail.com>
References: <CAARyMpAY7yeKjFxwsKkhKSxhHjvz30pO8Qwuq1LTKxzxrZj=kQ@mail.gmail.com>
 <CAKgNAkgLzcink7h5hdzS+FDrjTdGoFmzhxNY7sNv+V=138mb+Q@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkgLzcink7h5hdzS+FDrjTdGoFmzhxNY7sNv+V=138mb+Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joey Adams <joeyadams3.14159-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

[Resending to linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org]

On Thu, Sep 8, 2011 at 6:21 PM, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org=
> wrote:
> On Sun, Jul 31, 2011 at 12:02 AM, Joey Adams <joeyadams3.14159@gmail.=
com> wrote:
>> Under man 7 unix, it says:
>>
>> Ioctls
>> =A0 =A0 =A0 The following ioctl(2) calls return information in value=
=2E =A0The
>> correct syntax is:
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0int value;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0error =3D ioctl(tcp_socket, ioctl_type, &=
value);
>>
>> The last line should read:
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0error =3D ioctl(unix_socket, ioctl_type, =
&value);
>>
>> I'm on Fedora 15, with Linux man-pages version 3.32. =A0The date at =
the
>> bottom of this page is 2010-11-15.
>
> Thanks. Fixed for man-pages-3.33.
>
> Cheers,
>
> Michael
>
>
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Author of "The Linux Programming Interface"; http://man7.org/tlpi/
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

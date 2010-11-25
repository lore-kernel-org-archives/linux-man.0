From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: inconsistent redundancy in chdir.2
Date: Thu, 25 Nov 2010 06:36:52 +0100
Message-ID: <AANLkTi=0r0=gh5NrjQxVpYwCjWmi-BY5fVT0v-kscBnA@mail.gmail.com>
References: <4CE99B70.6080702@gmx.de>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4CE99B70.6080702-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Eberhard Schauer <Martin.E.Schauer-Mmb7MZpHnFY@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Martin,

On Sun, Nov 21, 2010 at 11:21 PM, Martin Eberhard Schauer
<Martin.E.Schauer-Mmb7MZpHnFY@public.gmane.org> wrote:
> =A0 =A0 =A0 =A0 =A0 =A0Dear Mr. Kerrisk,
>
> thank you for maintaining the Linux man-pages.

You're welcome!

> Updating the outdated translation of chdir.2 for manpages-de I found
>
> Feature Test Macro Requirements for glibc (see feature_test_macros(7)=
):
>
> =A0 =A0 =A0fchdir():
> =A0 =A0 =A0 =A0 =A0_BSD_SOURCE || _XOPEN_SOURCE >=3D 500 ||
> =A0 =A0 =A0 =A0 =A0_XOPEN_SOURCE && _XOPEN_SOURCE_EXTENDED
> =A0 =A0 =A0 =A0 =A0|| /* Since glibc 2.12: */ _POSIX_C_SOURCE >=3D 20=
0809L
>>
>
> and as last (third) part of NOTES
>
>>
> The prototype for fchdir() is only available if _BSD_SOURCE is define=
d,
> =A0 =A0 =A0or _XOPEN_SOURCE is defined with the value 500.
>>
>
> This is almost the same of the first two possibilities above.
>
> Please check whether >=3D or =3D is right and consider dropping/exten=
ding the
> last
> paragraph of the NOTES.

Thanks for reporting this. The piece in notes is redundannt and
incorrect, and as you suggest, I removed it, for man-pages-3.32.




--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

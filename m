From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: struct aiocb structure man page
Date: Mon, 4 Oct 2010 06:31:44 +0200
Message-ID: <AANLkTim=mstwVRSs5aHnRukXn95tGYtiRsm6kPC8J90-@mail.gmail.com>
References: <AANLkTimurYOmpjhewOJTKnR1LNeFA9E4JY+kAPn6uh5A@mail.gmail.com>
 <AANLkTi=n8mtx9aE75V_bmdH_RSaa5mf6k0UVXQrv0miu@mail.gmail.com> <AANLkTi=4SaK0xHJzgn8kDKw_Cs4YGykFbVQd8Dh9kzDr@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTi=4SaK0xHJzgn8kDKw_Cs4YGykFbVQd8Dh9kzDr-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Jon,

On Sun, Oct 3, 2010 at 9:06 PM, Jon Grant <jg-hus3n9K41k0@public.gmane.org> wrote:
> Hello Michael
>
> On 3 October 2010 17:06, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> [.]
>> I've just now pushed to git a new aio(7) man pages that documents th=
e
>> aiocb structure. Also, various pages have been updated to point to t=
he
>> recently added sigevent(7) page, which documents SIGEV_*. The change=
s
>> will be released in man-pages-3.28.
>
> Fantastic you have been able to add aio(7) and the sigevent(7) page i=
s
> really useful.
>
>
> Looking at this page:
> http://www.kernel.org/doc/man-pages/online/pages/man2/timer_create.2.=
html
>
> int timer_create(clockid_t clockid, struct sigevent *evp,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0timer_t *timerid);
>
> Re parameter "struct sigevent *evp":
>
> I don't know if this is possible, but could the function parameters
> also be hyperlinked to the structure definition page?

It's a nice idea, but difficult to drive this from my current scripts.

> Thank you again for adding aio(7).

You're welcome.

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

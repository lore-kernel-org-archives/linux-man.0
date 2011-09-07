From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: timer_create(2) typo
Date: Wed, 7 Sep 2011 21:30:39 +0200
Message-ID: <CAKgNAkjisPZPsR4mH3+nZOFT+tE2oxxLsrwOS9e8_D4=XJC-1w@mail.gmail.com>
References: <CAN98ibaftoKgk-7uPsBE+aTUPEvd-qNo2S2OruseM3uSW79BnA@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAN98ibaftoKgk-7uPsBE+aTUPEvd-qNo2S2OruseM3uSW79BnA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Timmy Lee <scuttimmy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linux Manpage <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Timmy,

On Thu, Sep 1, 2011 at 1:32 AM, Timmy Lee <scuttimmy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> http://www.kernel.org/doc/man-pages/online/pages/man2/timer_create.2.=
html
>
> There is an example which demonstrate the use of timer_create().
>
> I believe the line:=A0 ./a.out 1 10=A0=A0=A0=A0 should be ./a.out 1 1=
00
>
> According to the description, the overrun count and the code, the tim=
er
> frequency should be 100 nanoseconds.

Thanks. Fixed for 3.33.

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

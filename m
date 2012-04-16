From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH/RFC 0/6] ld.so.8: some improvements from Debian
Date: Mon, 16 Apr 2012 19:26:58 +1200
Message-ID: <CAKgNAkgbcL3deJ4x0DEV==vtiAmYie7+Gw+c=K_dAJhWE4va1Q@mail.gmail.com>
References: <20111020070037.GA11392@elie.hsd1.il.comcast.net>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111020070037.GA11392-E4JsH6yu/ca99If2fRKg35Ea+QML8DWm@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>, Aurelien Jarno <aurelien-rXXEIb44qovR7s880joybQ@public.gmane.org>, Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Jonathan,

This patch series fell on the floor. Are you interested in having
another go? If yes, let's discuss some details first.

Cheers,

Michael


On Thu, Oct 20, 2011 at 8:01 PM, Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
> Hi,
>
> I would like to see Debian using the ld.so(8) page from the man-pages
> project instead of its own custom copy, so people making improvements
> to that documentation would not need to choose which to contribute to=
=2E
> Here are some changes that might make it easier to use the upstream
> ld.so.8 as a drop-in replacement.
>
> I have tried to be very conservative, when in doubt matching what is
> in Debian's libc-bin package. =A0Some comments on this in the mails w=
ith
> each patch.
>
> Anyway, some of these seem to me like good improvements to the page
> regardless. =A0What do you think?
>
> Jonathan Nieder (6):
> =A0ld.so.8: clarify synopsis
> =A0ld.so.8: move important information toward the top
> =A0ld.so.8: document LD_ASSUME_KERNEL
> =A0ld.so.8: document Debian's /etc/ld.so.nohwcap extension
> =A0ld.so.8: document $PLATFORM and $LIB expansion
> =A0ld.so.8: document how hwcaps affect search path
>
> =A0man8/ld.so.8 | =A0181 +++++++++++++++++++++++++++++++++++++++++---=
--------------
> =A01 files changed, 128 insertions(+), 53 deletions(-)
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

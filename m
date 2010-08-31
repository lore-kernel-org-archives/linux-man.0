From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: mq_send(3) copypaste error
Date: Tue, 31 Aug 2010 06:24:19 +0200
Message-ID: <AANLkTimx9LKgqpq3dnN07aKiy87-Jw-1=XC8EFkFDaxH@mail.gmail.com>
References: <20100830193421.28262.qmail@stuge.se>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100830193421.28262.qmail-Y+HMSxxDrH8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Stuge <peter-Y+HMSxxDrH8@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Peter,

On Mon, Aug 30, 2010 at 9:34 PM, Peter Stuge <peter-Y+HMSxxDrH8@public.gmane.org> wrote:
> Hello, both mq_send(3) and mq_receive(3) in 3.25 read as follows:
>
> --8<--
> ERRORS
> =A0 =A0 =A0 EAGAIN The queue was empty, and the O_NONBLOCK flag =A0wa=
s =A0set =A0for =A0the
> =A0 =A0 =A0 =A0 =A0 =A0 =A0message queue description referred to by m=
qdes.
> -->8--
>
> This is only accurate for mq_receive(). For mq_send() I think
>
> s/empty/full/
>
> would be in place. Thanks!

Agreed.

=46ixed for man-pages-3.26.

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

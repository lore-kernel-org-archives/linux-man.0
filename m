From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Typos introduced in 5fab2e7?
Date: Mon, 4 Oct 2010 08:47:37 +0200
Message-ID: <AANLkTi=ruo2KYfTy9-CrAnX7sqwDg5hrmj7xyswH-rOE@mail.gmail.com>
References: <AANLkTi=ZkHV97T49vsJaY8scUngP0JAGj12NnOvhTQb3@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTi=ZkHV97T49vsJaY8scUngP0JAGj12NnOvhTQb3-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Denis,

On Mon, Oct 4, 2010 at 6:41 AM, Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello,
>
> =A0$ git show 5fab2e7 | grep forward
> =A0-The listing below is a TCP forwarding program that forwards
> =A0+The listing below is a TCP forwarding program that forward
> =A0-The above program properly forwards most kinds of TCP connections
> =A0+The above program properly forward most kinds of TCP connections
> =A0-pointed to by \fIs\fP instead of forwards from the beginning.
> =A0+pointed to by \fIs\fP instead of forward from the beginning.
> The first 2 change look wrong to me.

You're right of course. I'll fix.

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

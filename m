From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: clarification on siginterrupt(3)
Date: Wed, 14 Sep 2011 08:08:20 +0200
Message-ID: <CAKgNAkg1-vA-XZqB3jO9o_TVVa_p0vhcHod=1XyXVWkuKPZ=Zg@mail.gmail.com>
References: <BANLkTikpHjPgG8yyc0gGYTuQ2AgNxU7WqQ@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BANLkTikpHjPgG8yyc0gGYTuQ2AgNxU7WqQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Luis Javier Merino <ninjalj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Luis,

On Sun, May 8, 2011 at 10:10 PM, Luis Javier Merino <ninjalj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
 wrote:
> Hi,
>
> I'm not sure on the meaning of the following excerpt from
> siginterrupt(3), in particular the last sentence:
>
> "If the flag argument is false (0), then system
> =A0calls will be restarted if interrupted by the specified signal sig=
=2E =A0This is
> =A0the default behavior in Linux. =A0However, when a new signal handl=
er is
> =A0specified with the signal(2) function, the system call is interrup=
ted by
> =A0default."
>
> I interpret the second sentence ("This is the default behavior in
> Linux") as meaning that signal(2) by default is equivalent to
> sigaction(2) with SA_RESTART set. The last sentence seems to mean the
> opposite, which is untrue in the default case. So, what was the inten=
t
> of that sentence?
>
> I came across this on a question at StackOverflow:
> http://stackoverflow.com/questions/5929309/recvfrom-timeout-with-alar=
m/5929386#5929386
> the "wrongness" of the manpage was first noticed by Zachary Weinberg.

I would guess that the sentence cam about because of someone's
confusion with the signal(2) system call versus the glibc wrapper (or
the siginterrupt(3) page was written long ago in libc[45] days; see
the signal(2) man page).

The simple solution is to remove the last sentence for man-pages-3.33,
and that's what I have done for man-pages-3.33.

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

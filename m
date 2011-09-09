From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: man getrlimit(2) not updated for Linux 3.0
Date: Fri, 9 Sep 2011 17:34:44 +0200
Message-ID: <CAKgNAkh38N9v=2EAGUcH_izVwKxgvaPV=jgLNut=g+Chhx2Kqw@mail.gmail.com>
References: <CAHrWx2wMOmQmi7C-YWsQ=5oSmAeytEaZhqRah_sgx0BTuqF=Bw@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHrWx2wMOmQmi7C-YWsQ=5oSmAeytEaZhqRah_sgx0BTuqF=Bw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ryan Mullen <rmmullen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Ryan,

On Sat, Jul 30, 2011 at 3:27 AM, Ryan Mullen <rmmullen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote=
:
> From man 2 getrlimit:
>
> RLIMIT_CPU
> =A0 =A0 =A0 =A0 =A0 =A0 =A0CPU =A0time =A0limit =A0in seconds. =A0Whe=
n the process reaches
> the soft limit, it is sent a SIGXCPU signal. =A0The default action fo=
r
> this signal is to terminate the process. =A0However, the signal can b=
e
> caught,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0and the handler can return control to the =
main program.
> If the process continues to consume CPU time, it will be sent SIGXCPU
> once per second until the hard limit is reached, at which time it is
> sent
> =A0 =A0 =A0 =A0 =A0 =A0 =A0SIGKILL. =A0 (This =A0latter =A0point =A0d=
escribes =A0Linux 2.2
> through 2.6 behavior. =A0Implementations vary in how they treat
> processes which continue to consume CPU time after reaching the soft
> limit. =A0Portable
> =A0 =A0 =A0 =A0 =A0 =A0 =A0applications that need to catch this signa=
l should
> perform an orderly termination upon first receipt of SIGXCPU.)
>
>
> Instead of defining a window between Linux 2.2 and 2.6, can we not sa=
y
> "This latter point describes behavior since Linux 2.2" to avoid the
> versioning headaches, especially now that we're on 3.0? Note that I
> haven't confirmed whether this behavior has changed for 3.0 - I'm
> expecting it hasn't.

Thanks for the report. What I did was to remove all mention of
versions, since the behavior applies since at least 2.2, but probably
earlier also.

The change will be in man-pages-3.33.

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

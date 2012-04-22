From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Error in the example of getaddrinfo
Date: Sun, 22 Apr 2012 19:18:43 +1200
Message-ID: <CAKgNAkjzid0Z-itUOsaqUa=H5J5VHnzstSetuFbSZd1fLB8U7Q@mail.gmail.com>
References: <AANLkTinnWoSuV-oYxDMF-9yK22hpncerkEfD7R0h2YJk@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTinnWoSuV-oYxDMF-9yK22hpncerkEfD7R0h2YJk-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wimpunk <wimpunk-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, Feb 3, 2011 at 10:39 PM, wimpunk <wimpunk-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org=
> wrote:
> Hi,
>
> I believe there is a bug in de client example code of getaddrinfo. =A0=
It
> is in the ubuntu 10.10 man pages (Version: 3.24-1ubuntu1) and also on
> http://www.kernel.org/doc/man-pages/online/pages/man3/getaddrinfo.3.h=
tml.
> The 'close(sfd);' will never happen and using the code in a loop, it
> will cause your system running out of filedescriptors (at least,
> that's what happened to me). =A0To use the code cleanly, you should c=
ode
> the sfd after the last printf.

Am I missing something? The close() will happen whenever bind() fails,
which is what is desired.

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

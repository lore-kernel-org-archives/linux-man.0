From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: suggestion for improvement to vfork() man page
Date: Wed, 8 Feb 2012 12:04:51 +1300
Message-ID: <CAKgNAkjT05H1a9bk+d4XsEEsjUu0YEP10DDACCtBVsJ6OEsRYw@mail.gmail.com>
References: <6.2.5.6.2.20120207164707.03c1f410@binnacle.cx>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6.2.5.6.2.20120207164707.03c1f410-Utvwg/EOxnhfq8cQ1yknNg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: starlight-Utvwg/EOxnhfq8cQ1yknNg@public.gmane.org
Cc: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

On Wed, Feb 8, 2012 at 10:50 AM,  <starlight-Utvwg/EOxnhfq8cQ1yknNg@public.gmane.org> wrote:
> +(However, on such systems,
> +the preferred standard way of accomplishing the same result is to us=
e
> +.BR posix_spawn (3).)
>
> I'm not sure I agree on this. =A0Linux posix_spawn()
> calls fork()

I think isn't quite correct. I believe glibc's posix_spawn uses
vfork() where it can. See sysdeps/posix/spawni.c::spawni().

> which for us is undesirable on MMU systems
> due to the cost of copying large page tables.
>
> To the extent that we would add support for non-MMU
> platforms, we would stick with direct invocation of
> vfork() even if the posix_spawn() on those targets
> used vfork() instead of fork(). =A0One less #ifdef,
> of which we have far too many as it is.

So, I'll change that last sentence to

[[
(POSIX.1-2008 removed vfork() from the standard; the POSIX rationale
for  the posix_spawn(3) function notes that that function, which
provides functionality equivalent to fork(2)+exec(3) is designed to be
implementable on systems that lack an MMU.)
]]

What do you think?

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

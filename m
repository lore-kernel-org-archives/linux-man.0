From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Obsoletions by POSIX.1-2008
Date: Sun, 15 Mar 2009 08:17:55 +1300
Message-ID: <cfd18e0f0903141217y3158eb6fneb9440771e5bd8aa@mail.gmail.com>
References: <alpine.LSU.2.00.0903141255530.5204@fbirervta.pbzchgretzou.qr>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LSU.2.00.0903141255530.5204-vVwEwcwQeYFPkBl3ERsXe1l1cybopEuJUBSOeVevoDU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jan Engelhardt <jengelh-nopoi9nDyk+ELgA04lAiVw@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Jan,

(Please CC bug reports to linux-man@)

On Sun, Mar 15, 2009 at 1:01 AM, Jan Engelhardt <jengelh-nopoi9nDyk+ELgA04lAiVw@public.gmane.org> wr=
ote:
> Hi,
>
>
> in man-pages 3.13 (version shipped by openSUSE), some man-pages have
> notes about the new POSIX.1-2008 standard, e.g. gethostbyname:
>
> "CONFORMING TO
> =A0 =A0 =A0 =A0[...]
> =A0 =A0 =A0 =A0POSIX.1-2008 removes the specifications of gethostbyna=
me(),..."
>
> This also affects gettimeofday at least.
>
> The man pages however do not tell which replacement POSIX provides. B=
ut
> there is a page which mentions the replacement functions:
>
> http://www.opengroup.org/onlinepubs/9699919799/functions/time.html
> (for gettimeofday)
>
> Could you incorporate this information about new functions into the m=
an
> pages (if not already done in >3.13)?

That makes sense.  For 3.20, I added such information to the pages
where it is missing

gettimeofday(2)
getitimer(2)
asctime(3)
bcopy(3)
bsd_signal(3)
bzero(3)
ctime(3)
getcontext(3)
getwd(3)
ecvt(3)
gcvt(3)
index(3)
gethostbyname(3)
makecontext(3)
scalb(3)

And for these functions that POSIX.1-2008 marks obsolescent, I added
the alternatives:

siginterrupt(3)
sigset(3)

And for these functions, I added an explanation of why POSIX.1-2008
marks them as obsolescent:

isalpha(3) (isascii(3))
toascii(3)

Thanks for your report!

Cheers,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
=46ound a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

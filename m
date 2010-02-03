From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] getopt.3: Fix feature test macro requirements for
	getopt()
Date: Wed, 3 Feb 2010 07:30:28 +0100
Message-ID: <cfd18e0f1002022230v2030f97aja0e4b94615fee26b@mail.gmail.com>
References: <20091127040505.GA21636@progeny.tock>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20091127040505.GA21636-Zz+2AvWe3NP1iTQCbxR7ew@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Jonathan,

On Fri, Nov 27, 2009 at 5:05 AM, Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
> The synopsis previously stated that getopt requires
> _POSIX_C_SOURCE >=3D 2 || _XOPEN_SOURCE || _POSIX_SOURCE, but that
> would be impossible, since _POSIX_SOURCE is a synonym for
> _POSIX_C_SOURCE >=3D 1.
>
> getopt was introduced to POSIX in POSIX.2. =A0The glibc headers
> correctly test for that version.

Agreed. I applied your patch. The change will be in man-pages-3.24.

I also discovered and fixed similar errors in popen(2) and confstr(3)!

Thanks!

Cheers,

Michael


> Signed-off-by: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> Hi,
>
> I noticed this when trying to compile a program that uses getopt with
> _POSIX_SOURCE. =A0Checking the headers, I see that unistd.h does not
> include getopt.h unless __USE_POSIX2 is defined, and getopt.h does no=
t
> choose the standards-conforming implementation unless __USE_POSIX2 &&
> !__USE_POSIX_IMPLICITLY && !__USE_GNU is defined.
>
> The POSIX-1 2008 documentation [1] suggests that SVr2 had a getopt,
> and the FreeBSD manpage [2] says BSD 4.3 had one, too. =A0So maybe
> getopt should be exposed if either _BSD_SOURCE or _SVID_SOURCE is
> defined. =A0But it isn=92t currently.
>
> Anyway, I hope the patch is of some use.
>
> Thanks,
> Jonathan
>
> [1] http://www.opengroup.org/onlinepubs/9699919799/functions/getopt.h=
tml
> [2] http://svn.freebsd.org/viewvc/base/head/lib/libc/stdlib/getopt.3?=
view=3Dmarkup
>
> =A0man3/getopt.3 | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/man3/getopt.3 b/man3/getopt.3
> index 503f689..97ff60a 100644
> --- a/man3/getopt.3
> +++ b/man3/getopt.3
> @@ -68,7 +68,7 @@ Feature Test Macro Requirements for glibc (see
> =A0.in
> =A0.sp
> =A0.BR getopt ():
> -_POSIX_C_SOURCE\ >=3D\ 2 || _XOPEN_SOURCE || _POSIX_SOURCE
> +_POSIX_C_SOURCE\ >=3D\ 2 || _XOPEN_SOURCE
> =A0.br
> =A0.BR getopt_long (),
> =A0.BR getopt_long_only ():
> --
> 1.6.5.3
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] err.3: clean up description of error message source
Date: Sat, 17 Sep 2011 07:15:09 +0200
Message-ID: <CAKgNAkjnh0a3V-yS3WOJf9_+Ki-xdkL7DazKdFSnZr_vYvedhA@mail.gmail.com>
References: <4E5E4634.80609@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E5E4634.80609-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Seonghun,

2011/8/31 Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> man-pages version: latest git repository
> why:
> In the second paragraph of DESCRIPTION section, one of the
> sources of error messages is incorrect: the four functions obtain
> error message only from errno, and "a code" is just relavant
> with errc() and warnc(), which are not present on Linux.
> see http://www.unix.com/man-page/freebsd/3/ERR/ .
>
> Then, the third paragraph becomes a duplicate.

Thanks. Applied for 3.33.

Cheers,

Michael


> diff --git a/man3/err.3 b/man3/err.3
> --- a/man3/err.3
> +++ b/man3/err.3
> @@ -83,7 +83,7 @@ and
> .BR vwarn ()
> functions append an error message obtained from
> .BR strerror (3)
> -based on a code or the global variable
> +based on the global variable
> .IR errno ,
> preceded by another colon and space unless the
> .I fmt
> @@ -91,16 +91,6 @@ argument is
> NULL.
> .PP
> The
> -.BR err (),
> -.BR verr (),
> -.BR warn (),
> -and
> -.BR vwarn ()
> -functions use the global variable
> -.I errno
> -to look up the error message.
> -.PP
> -The
> .BR errx ()
> and
> .BR warnx ()
>
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

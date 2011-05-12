From: Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] setbuf.3: stdio buffers are allocated by mmap() not malloc()
Date: Thu, 12 May 2011 18:11:13 +0300
Message-ID: <BANLkTin6ogPpQFDAkezygqAVtcfRZnoMMA@mail.gmail.com>
References: <4DCAFFE0.7030307@tacc.utexas.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4DCAFFE0.7030307-Tmo6s3XX3Xr5xfTjtVVUew@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Hammond <jhammond-Tmo6s3XX3Xr5xfTjtVVUew@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

A little peer review before the maintainer gets a chance to reply...

On Thu, May 12, 2011 at 12:30 AM, John Hammond <jhammond-Tmo6s3XX3XpAj+jmLmNEOA@public.gmane.org=
u> wrote:
> ---
> --- a/man3/setbuf.3
> +++ b/man3/setbuf.3
> @@ -83,7 +83,7 @@ may be used to force the block out early.
> =A0.BR fclose (3).)
> =A0Normally all files are block buffered.
> =A0When the first I/O operation occurs on a file,
> -.BR malloc (3)
> +.BR mmap (2)
> =A0is called, and a buffer is obtained.
> =A0If a stream refers to a terminal (as
> =A0.I stdout

Are you sure this applies to older glibc versions as well? When
behavior of a glibc function has changed in time, usually (or I should
probably rephrase this as "in the most fortunate cases..." :), but
let's not be that pessimistic ) the man page specifies that; if it's
the case here, it might be good to say: "mmap is used since glibc x.y,
malloc was used before".

Thanks,
Stefan.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

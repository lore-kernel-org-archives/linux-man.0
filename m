From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fts.3 is not available in LFS builds
Date: Sat, 15 Mar 2014 15:47:26 +0100
Message-ID: <CAKgNAkgqXUf0yWaXyAD7yBJgivp9Jmwvz4EAnh_DpyActuoGwA@mail.gmail.com>
References: <20140315135416.GA10430@infradead.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140315135416.GA10430-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Christoph,

On Sat, Mar 15, 2014 at 2:54 PM, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org> wrote:
> As pointed out during a recent discussion on libc-hacker the fts(3)
> APIs can't be used with large file offsets:
>
>         https://sourceware.org/bugzilla/show_bug.cgi?id=15838
>
> The manpage should mention this.  Note: the text probably needs some
> better formatting at least, but I couldn't come up with proper markup
> for compiler arguments.
>
> Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
>
> diff --git a/man3/fts.3 b/man3/fts.3
> index 9374463..2b14c0d 100644
> --- a/man3/fts.3
> +++ b/man3/fts.3
> @@ -774,6 +774,10 @@ The options were invalid.
>  These functions are available in Linux since glibc2.
>  .SH CONFORMING TO
>  4.4BSD.
> +.SH BUGS
> +All the APIs described in this manpage are not safe when compiling

Should this perhaps better read "not safe on 32-bit systems"?

> +a program using the LFS APIs, e.g. by using
> +-D_FILE_OFFSET_BITS=64.
>  .\" The following statement is years old, and seems no closer to
>  .\" being true -- mtk
>  .\" The
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

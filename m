From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] realpath.3: use past tense with ancient history
Date: Mon, 13 Aug 2012 09:36:51 +0200
Message-ID: <CAKgNAkiT1UyAA62OsMipbcN3Rw5YyzoHdv5D366FCQMyRuF8nQ@mail.gmail.com>
References: <1344283133-29884-1-git-send-email-shawnlandden@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1344283133-29884-1-git-send-email-shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Landden <shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Shawn,

Yes, that seems a reasobale change. Applied.

Thanks,

Michael

On Mon, Aug 6, 2012 at 9:58 PM, Shawn Landden <shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> ---
>  man3/realpath.3 |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/man3/realpath.3 b/man3/realpath.3
> index 1b90a34..615548c 100644
> --- a/man3/realpath.3
> +++ b/man3/realpath.3
> @@ -205,11 +205,11 @@ The
>  feature, not standardized in POSIX.1-2001,
>  but standardized in POSIX.1-2008, allows this design problem to be avoided.
>  .LP
> -The libc4 and libc5 implementation contains a buffer overflow
> +The libc4 and libc5 implementation contained a buffer overflow
>  (fixed in libc-5.4.13).
>  Thus, set-user-ID programs like
>  .BR mount (8)
> -need a private version.
> +needed a private version.
>  .SH "SEE ALSO"
>  .BR readlink (2),
>  .BR canonicalize_file_name (3),
> --
> 1.7.9.5
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

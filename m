From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] stat.2: tfix
Date: Sun, 23 Sep 2012 17:01:56 +0200
Message-ID: <CAKgNAkiWmh+8tRH8ZeDk4JuFqjEqTq8Qi7zXmT8RRbO04cQXng@mail.gmail.com>
References: <1347227196-9772-1-git-send-email-guillem@hadrons.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1347227196-9772-1-git-send-email-guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks. Applied.

On Sun, Sep 9, 2012 at 11:46 PM, Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org> wrote:
> Signed-off-by: Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
> ---
>  man2/stat.2 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man2/stat.2 b/man2/stat.2
> index 791bfb8..0b82e1d 100644
> --- a/man2/stat.2
> +++ b/man2/stat.2
> @@ -413,7 +413,7 @@ the macros
>  etc.
>  The
>  .BR S_IF*
> -constants are present in POSIX.1-2011 and later.
> +constants are present in POSIX.1-2001 and later.
>
>  The
>  .BR S_ISLNK ()
> --
> 1.7.10.4
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

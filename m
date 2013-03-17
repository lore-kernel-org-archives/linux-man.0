From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] readdir.3: Add description of the function is not thread-safe
Date: Sun, 17 Mar 2013 11:08:21 +0100
Message-ID: <CAKgNAkhqokJWDwVsNNStav5KFzK+1qW76d6dWJT=mwJ8kA3nQg@mail.gmail.com>
References: <1363085038-7097-1-git-send-email-penght@cn.fujitsu.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363085038-7097-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Peng,

On Tue, Mar 12, 2013 at 11:43 AM, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org> wrote:
> The data returned by readdir() may be overwritten by subsequent calls to
> readdir() for the same directory stream, so it is not thread-safe.

I've applied this patch in my local branch.

See also my general comments in the reply to the ecvt.3 patch.

Thanks for the patch.

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/readdir.3 | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/man3/readdir.3 b/man3/readdir.3
> index c788ba9..b70dc85 100644
> --- a/man3/readdir.3
> +++ b/man3/readdir.3
> @@ -31,7 +31,7 @@
>  .\"     Rework discussion of nonstandard structure fields.
>  .\" 2008-09-11, mtk, Document readdir_r().
>  .\"
> -.TH READDIR 3  2012-07-07 "" "Linux Programmer's Manual"
> +.TH READDIR 3  2013-03-12 "" "Linux Programmer's Manual"
>  .SH NAME
>  readdir, readdir_r \- read a directory
>  .SH SYNOPSIS
> @@ -142,6 +142,15 @@ returns 0, and returns NULL in
>  .TP
>  .B EBADF
>  Invalid directory stream descriptor \fIdirp\fP.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR readdir ()
> +function is not thread-safe.
> +.LP
> +The
> +.BR readdir_r ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  SVr4, 4.3BSD, POSIX.1-2001.
>  .SH NOTES
> --
> 1.8.1.4
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

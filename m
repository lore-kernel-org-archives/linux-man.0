From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] index.3: ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 01 Apr 2014 20:41:37 +0200
Message-ID: <533B0861.4070204@gmail.com>
References: <1396325423-22394-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396325423-22394-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao.

Applied.

Cheers,

Michael




On 04/01/2014 06:10 AM, Peng Haitao wrote:
> The functions index() and rindex() are thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/index.3 | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/index.3 b/man3/index.3
> index 64c95b4..8fb9d58 100644
> --- a/man3/index.3
> +++ b/man3/index.3
> @@ -28,7 +28,7 @@
>  .\"     386BSD man pages
>  .\" Modified Mon Apr 12 12:54:34 1993, David Metcalfe
>  .\" Modified Sat Jul 24 19:13:52 1993, Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
> -.TH INDEX 3 2011-09-21 "GNU" "Linux Programmer's Manual"
> +.TH INDEX 3 2014-04-01 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  index, rindex \- locate character in string
>  .SH SYNOPSIS
> @@ -59,6 +59,13 @@ and
>  .BR rindex ()
>  functions return a pointer to
>  the matched character or NULL if the character is not found.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR index ()
> +and
> +.BR rindex ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  4.3BSD; marked as LEGACY in POSIX.1-2001.
>  POSIX.1-2008 removes the specifications of
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

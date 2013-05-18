From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fmtmsg.3: ATTRIBUTES: Note function that is thread-safe
Date: Sat, 18 May 2013 20:15:58 +0200
Message-ID: <5197C55E.5060704@gmail.com>
References: <1366861744-16118-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1366861744-16118-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/25/13 05:49, Peng Haitao wrote:
> Before glibc 2.16, fmtmsg() is not thread-safe.
> Since glibc 2.16, it is thread-safe, the patch can refer to URL:
> http://sourceware.org/git/?p=glibc.git;a=commit;h=7724defcf8873116fe4efab256596861eef21a94

Applied to my local branch for this work.

Thank you, Peng.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/fmtmsg.3 | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/man3/fmtmsg.3 b/man3/fmtmsg.3
> index f4b3d6f..3e3d3f9 100644
> --- a/man3/fmtmsg.3
> +++ b/man3/fmtmsg.3
> @@ -222,6 +222,16 @@ is the string printed when a message of this class is processed by
>  .SH VERSIONS
>  .BR fmtmsg ()
>  is provided in glibc since version 2.1.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +Before glibc 2.16, the
> +.BR fmtmsg ()
> +uses a static variable that is not protected, so it is not thread-safe.
> +
> +Since glibc 2.16, the
> +.BR fmtmsg ()
> +uses a lock to protect static variable, so it is thread-safe.
> +.\" Modified in commit 7724defcf8873116fe4efab256596861eef21a94
>  .SH CONFORMING TO
>  The functions
>  .BR fmtmsg ()
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

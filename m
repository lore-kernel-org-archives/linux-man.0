From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] matherr.3: Reformat thread-safety information
Date: Fri, 17 Oct 2014 09:10:07 +0200
Message-ID: <5440C0CF.4070108@gmail.com>
References: <1413529378-10372-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413529378-10372-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao. Applied.

Cheers,

Michael



On 10/17/2014 09:02 AM, Peng Haitao wrote:
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/matherr.3 | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/man3/matherr.3 b/man3/matherr.3
> index af761da..ad74007 100644
> --- a/man3/matherr.3
> +++ b/man3/matherr.3
> @@ -273,10 +273,17 @@ fmod(x,0)	DOMAIN	x	y	EDOM
>  remainder(x,0)	DOMAIN	NAN	y	EDOM	\" retval is 0.0/0.0
>  .TE
>  .SH ATTRIBUTES
> -.SS Multithreading (see pthreads(7))
> -The
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lb lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
>  .BR matherr ()
> -function is thread-safe.
> +T}	Thread safety	MT-Safe
> +.TE
>  .SH EXAMPLE
>  The example program demonstrates the use of
>  .BR matherr ()
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

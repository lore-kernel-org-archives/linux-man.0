From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] memchr.3: Reformat thread-safety information
Date: Thu, 16 Oct 2014 12:10:41 +0200
Message-ID: <543F99A1.4080802@gmail.com>
References: <1413276478-14050-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413276478-14050-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao. Applied.

Cheers,

Michael


On 10/14/2014 10:47 AM, Peng Haitao wrote:
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/memchr.3 | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/man3/memchr.3 b/man3/memchr.3
> index 7e35784..815af17 100644
> --- a/man3/memchr.3
> +++ b/man3/memchr.3
> @@ -122,13 +122,19 @@ first appeared in glibc in version 2.1.
>  .BR memrchr ()
>  first appeared in glibc in version 2.2.
>  .SH ATTRIBUTES
> -.SS Multithreading (see pthreads(7))
> -The
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw32 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
>  .BR memchr (),
>  .BR memrchr (),
> -and
>  .BR rawmemchr ()
> -functions are thread-safe.
> +T}	Thread safety	MT-Safe
> +.TE
>  .SH CONFORMING TO
>  The
>  .BR memchr ()
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

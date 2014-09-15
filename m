From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pthread_setaffinity_np.3: Reformat thread-safety information
Date: Mon, 15 Sep 2014 11:12:19 +0200
Message-ID: <5416AD73.2000308@gmail.com>
References: <1410749354-14343-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410749354-14343-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao. Applied in the attributes_reformat_2 branch.

Cheers,

Michael


On 09/15/2014 04:49 AM, Peng Haitao wrote:
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/pthread_setaffinity_np.3 | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/man3/pthread_setaffinity_np.3 b/man3/pthread_setaffinity_np.3
> index 6878dfd..e136355 100644
> --- a/man3/pthread_setaffinity_np.3
> +++ b/man3/pthread_setaffinity_np.3
> @@ -119,12 +119,18 @@ could be found.
>  .SH VERSIONS
>  These functions are provided by glibc since version 2.3.4.
>  .SH ATTRIBUTES
> -.SS Multithreading (see pthreads(7))
> -The
> -.BR pthread_setaffinity_np ()
> -and
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw25 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR pthread_setaffinity_np (),
>  .BR pthread_getaffinity_np ()
> -functions are thread-safe.
> +T}	Thread safety	MT-Safe
> +.TE
>  .SH CONFORMING TO
>  These functions are nonstandard GNU extensions;
>  hence the suffix "_np" (nonportable) in the names.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

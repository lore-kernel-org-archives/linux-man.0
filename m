From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] madvise.2: specify MADV_REMOVE returns EINVAL for hugetlbfs
Date: Sat, 04 Apr 2015 08:21:16 +0100
Message-ID: <551F90EC.20600@gmail.com>
References: <alpine.DEB.2.10.1504021517540.9951@chino.kir.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.10.1504021517540.9951-X6Q0R45D7oAcqpCFd4KODRPsWskHk0ljAL8bYrjMMd8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Rientjes <rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "Kirill A. Shutemov" <kirill.shutemov-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/02/2015 11:21 PM, David Rientjes wrote:
> madvise(2) actually returns with error EINVAL for MADV_REMOVE when used 
> for hugetlb vmas, not EOPNOTSUPP, and this has been the case since 
> MADV_REMOVE was introduced in commit f6b3ec238d12 ("madvise(MADV_REMOVE): 
> remove pages from tmpfs shm backing store").

Thanks David. Applied. I'd already fixed the appropriate piece in
the ERRORS list a while back, but missed that piece in the main text.

Cheers,

Michael


> Specify the exact behavior.
> 
> Signed-off-by: David Rientjes <rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> ---
>  man2/madvise.2 | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/man2/madvise.2 b/man2/madvise.2
> index a3d93bb..00db39d 100644
> --- a/man2/madvise.2
> +++ b/man2/madvise.2
> @@ -184,7 +184,9 @@ any filesystem which supports the
>  .BR FALLOC_FL_PUNCH_HOLE
>  mode also supports
>  .BR MADV_REMOVE .
> -Other filesystems fail with the error
> +Hugetlbfs will fail with the error
> +.BR EINVAL
> +and other filesystems fail with the error
>  .BR EOPNOTSUPP .
>  .TP
>  .BR MADV_DONTFORK " (since Linux 2.6.16)"
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

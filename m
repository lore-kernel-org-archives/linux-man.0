From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] readv.2: document RWF_NOWAIT
Date: Tue, 14 Nov 2017 08:26:03 +0100
Message-ID: <CAKgNAkge-GKLbF_6rOxUh9jWoN-WU13_VSBaKrYoZCws0UUpUw@mail.gmail.com>
References: <20171110215410.9943-1-hch@lst.de>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171110215410.9943-1-hch-jcswGhMUV9g@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Milosz Tanski <milosz-B5zB6C1i6pkAvxtiuMwx3w@public.gmane.org>, Matthew Wilcox <willy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 10 November 2017 at 22:54, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org> wrote:
> Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
> ---

Thanks, Christoph. (And thanks, Matthew, for the help.)

Patch applied.

Cheers,

Michael

> Changes since V1:
>  - better wording provided by Matthew Wilcox
>
>  man2/readv.2 | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/man2/readv.2 b/man2/readv.2
> index 831cf6260..880435edf 100644
> --- a/man2/readv.2
> +++ b/man2/readv.2
> @@ -232,6 +232,25 @@ This flag is meaningful only for
>  .BR pwritev2 (),
>  and its effect applies only to the data range written by the system call.
>  .\" commit e864f39569f4092c2b2bc72c773b6e486c7e3bd9
> +.TP
> +.BR RWF_NOWAIT " (since Linux 4.14)"
> +Do not wait for data which is not immediately available.
> +If this flag is specified the
> +.BR preadv2 ()
> +system call will return instantly if it would have to read data from
> +the backing storage or wait for a lock.
> +If some data was successfully read, it will return the number of bytes read.
> +If no bytes were read, it will return -1 and set
> +.IR errno
> +to
> +.BR EAGAIN .
> +This flag is meaningful only for
> +.BR preadv2 ()
> +at the moment.
> +.\" commit 3239d834847627b6634a4139cf1dc58f6f137a46
> +.\" commit 91f9943e1c7b6638f27312d03fe71fcc67b23571
> +
> +
>  .SH RETURN VALUE
>  On success,
>  .BR readv (),
> --
> 2.14.2
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

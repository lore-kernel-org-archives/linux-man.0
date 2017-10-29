From: Matthew Wilcox <willy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH] readv.2: document RWF_NOWAIT
Date: Sun, 29 Oct 2017 02:41:06 -0700
Message-ID: <20171029094106.GA15945@bombadil.infradead.org>
References: <20171029084023.8463-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171029084023.8463-1-hch-jcswGhMUV9g@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, milosz-B5zB6C1i6pkAvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sun, Oct 29, 2017 at 10:40:23AM +0200, Christoph Hellwig wrote:
> Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
> ---
>  man2/readv.2 | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/man2/readv.2 b/man2/readv.2
> index 831cf6260..21d82849e 100644
> --- a/man2/readv.2
> +++ b/man2/readv.2
> @@ -232,6 +232,25 @@ This flag is meaningful only for
>  .BR pwritev2 (),
>  and its effect applies only to the data range written by the system call.
>  .\" commit e864f39569f4092c2b2bc72c773b6e486c7e3bd9
> +.TP
> +.BR RWF_NOWAIT " (since Linux 4.14)"
> +Dot not wait for data when it cannot be instantly retreived.  If this flag
> +is specified the
> +.BR preadv2 ()
> +system call will return instantly when it would have to read data from
> +the backing storage or wait for a lock.  Instead it will return -1 and set
> +.I errno
> +to
> +.BR EAGAIN
> +if no data could be read, or return less bytes than requested if some data
> +could be read.
> +This flag is meaningful only for
> +.BR preadv2 ()
> +at the moment.
> +.\" commit 3239d834847627b6634a4139cf1dc58f6f137a46
> +.\" commit 91f9943e1c7b6638f27312d03fe71fcc67b23571

The phrasing is a bit tortured ... try this:

.TP
.BR RWF_NOWAIT " (since Linux 4.14)"
Do not wait for data which is not immediately available.
If this flag is specified the
.BR preadv2 ()
system call will return instantly if it would have to read data from
the backing storage or wait for a lock.
If some data was successfully read, it will return the number of bytes read.
If no bytes were read, it will return -1 and set
.IR errno to
.BR EAGAIN .
This flag is meaningful only for
.BR preadv2 ()
at the moment.
.\" commit 3239d834847627b6634a4139cf1dc58f6f137a46
.\" commit 91f9943e1c7b6638f27312d03fe71fcc67b23571
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

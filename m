From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] perf_event_open.2 E2BIG documentation
Date: Sat, 26 Oct 2013 11:22:19 +1300
Message-ID: <526AEF1B.9050607@gmail.com>
References: <alpine.DEB.2.10.1310101718250.4689@vincent-weaver-1.um.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.10.1310101718250.4689-6xBS8L8d439fDsnSvq7Uq4Se7xf15W0s1dQoKJhdanU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11.10.2013 10:20, Vince Weaver wrote:
> 
> The following documents the E2BIG error return for perf_event_open().
> 
> I actually ran into this error the hard way and it took me half a day
> to figure out why my ->size value was changing.
> 
> Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>

Thanks, Vince. Applied.

Cheers,

Michael


> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index 71a09d5..f4cb5bd 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -2121,6 +2121,21 @@ returns the new file descriptor, or \-1 if an error occurred
>  is set appropriately).
>  .SH ERRORS
>  .TP
> +.B E2BIG
> +Returned if the perf_event_attr
> +.I size
> +value is too small
> +(smaller than
> +.BR PERF_ATTR_SIZE_VER0 ),
> +too big (larger than the page size),
> +or larger than the kernel supports and the extra bytes are not zero.
> +When
> +.B E2BIG
> +is returned, the perf_event_attr
> +.I size 
> +field is over-written by the kernel to be the size of the structure
> +it was expecting.
> +.TP
>  .B EINVAL
>  Returned if the specified event is not available.
>  .TP
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
My next Linux/UNIX system programming course:
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

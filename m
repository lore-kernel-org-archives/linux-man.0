From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] perf_event_open.2 PERF_COUNT_SW_DUMMY support
Date: Fri, 08 Nov 2013 06:11:28 +1300
Message-ID: <527BC9C0.5070806@gmail.com>
References: <alpine.DEB.2.10.1311061324070.26649@vincent-weaver-1.um.maine.edu> <alpine.DEB.2.10.1311061327180.26649@vincent-weaver-1.um.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.10.1311061327180.26649-6xBS8L8d439fDsnSvq7Uq4Se7xf15W0s1dQoKJhdanU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/07/13 07:28, Vince Weaver wrote:
> 
> Support for the PERF_COUNT_SW_DUMMY event type was added in Linux 3.12.

Thanks, Vince. Applied.

Cheers,

Michael


> Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
> 
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index 4ff9690..a443b6e 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -468,6 +468,13 @@ This counts the number of emulation faults.
>  The kernel sometimes traps on unimplemented instructions
>  and emulates them for user space.
>  This can negatively impact performance.
> +.TP
> +.BR PERF_COUNT_SW_DUMMY " (Since Linux 3.12)"
> +This is a placeholder event that counts nothing.
> +Informational sample record types such as mmap or comm
> +must be associated with an active event.
> +This dummy event allows gathering such records without requiring
> +a counting event.
>  .RE
>  
>  .RS
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

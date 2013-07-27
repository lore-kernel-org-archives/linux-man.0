From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: perf_event_open.2 : fix indentation of the MMAP layout section
Date: Sat, 27 Jul 2013 12:17:08 +0200
Message-ID: <51F39E24.1040206@gmail.com>
References: <alpine.DEB.2.10.1307252238220.27580@vincent-weaver-1.um.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.10.1307252238220.27580-6xBS8L8d439fDsnSvq7Uq4Se7xf15W0s1dQoKJhdanU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/26/13 04:38, Vince Weaver wrote:
> 
> The indentation of the MMAP layout section wasn't quite right.
> I think this improves things but I admit I'm not an expert at the
> low-level indentation directives.

Thanks, Vince. Applied.

Cheers,

Michael


> Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
> 
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index b1a7114..20e2d71 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -1749,8 +1749,8 @@ Sample happened in the guest kernel.
>  Sample happened in guest user code.
>  .RE
>  
> -In addition, one of the following bits can be set:
>  .RS
> +In addition, one of the following bits can be set:
>  .TP
>  .B PERF_RECORD_MISC_MMAP_DATA
>  This is set when the mapping is not executable;
> @@ -1766,6 +1766,7 @@ See also
>  .TP
>  .B PERF_RECORD_MISC_EXT_RESERVED
>  This indicates there is extended data available (currently not used).
> +.RE
>  .TP
>  .I size
>  This indicates the size of the record.
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

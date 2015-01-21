From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] perf_event_open.2 remove innaccurate paragaph describing
 attr.config
Date: Wed, 21 Jan 2015 08:57:48 +0100
Message-ID: <54BF5BFC.9070100@gmail.com>
References: <alpine.DEB.2.11.1501202204120.21805@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.11.1501202204120.21805-6xBS8L8d439fDsnSvq7Uqyn2WXadKZNJe7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/21/2015 04:04 AM, Vince Weaver wrote:
> 
> Remove an inaccurate paragraph about values in the attr.config 
> field.  This information was never true in any released kernel; 
> it somehow snuck into the manpage because it is still described
> this way in tools/perf/design.txt in the kernel source tree.

Thanks, Vince. Applied.

Cheers,

Michael


> Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
> 
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index cccb880..003a8b2 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -352,12 +352,6 @@ fields are also taken into account in cases where 64 bits is not
>  enough to fully specify the event.
>  The encoding of these fields are event dependent.
>  
> -The most significant bit (bit 63) of
> -.I config
> -signifies CPU-specific (raw) counter configuration data;
> -if the most significant bit is unset, the next 7 bits are an event
> -type and the rest of the bits are the event identifier.
> -
>  There are various ways to set the
>  .I config
>  field that are dependent on the value of the previously
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] perf_event_open.c : clarify issues with the exclusive
 bit
Date: Fri, 27 Dec 2013 07:36:40 +1300
Message-ID: <52BC7738.1000701@gmail.com>
References: <alpine.DEB.2.10.1312191206260.29792@vincent-weaver-1.um.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.10.1312191206260.29792-6xBS8L8d439fDsnSvq7Uq4Se7xf15W0s1dQoKJhdanU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/20/13 06:09, Vince Weaver wrote:
> 
> Warn that using the perf_event_open "exclusive" bit, while it might seem 
> like a good idea, might lead to all 0 results in some common usage cases.


Thanks, Vince! Applied.


A couple of things to note about your patches:

* The subject lines often are not quite right for my workflow. For 
  example, sometimes you forget the extension on the page name. In
  your two recent patches, you wrote ".c" instead of ".2".
* Your patches often introduce unneeded whitespace at the end 
  of lines. I'd prefer not to have those.

The above is minor stuff, but if you could fix for future patches,
it would streamline things for me. As usual, thanks for your great
work in keeping this page up to date.

Cheers,

Michael


> Reported-by: Sudhanshu Goswami <Sudhanshu.Goswami-mb1K0bWo544@public.gmane.org>
> Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
> 
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index 6d42c41..ebda700 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -775,6 +775,13 @@ it should be the only group using the CPU's counters.
>  In the future this may allow monitoring programs to
>  support PMU features that need to run alone so that they do not
>  disrupt other hardware counters.
> +
> +Note that many unexpected situations may prevent events with the
> +.I exclusive
> +bit set from ever running.  
> +This includes any users running a system-wide
> +measurement as well as any kernel use of the performance counters 
> +(including the commonly enabled NMI Watchdog Timer interface).
>  .TP
>  .IR "exclude_user"
>  If this bit is set, the count excludes events that happen in user space.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

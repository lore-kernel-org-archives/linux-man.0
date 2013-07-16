From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: perf_event_open() -- update PERF_IOC_FLAG_GROUP info
Date: Tue, 16 Jul 2013 10:08:11 +0200
Message-ID: <51E4FF6B.7070302@gmail.com>
References: <alpine.DEB.2.10.1307121718200.28192@vincent-weaver-1.um.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.10.1307121718200.28192-6xBS8L8d439fDsnSvq7Uq4Se7xf15W0s1dQoKJhdanU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/12/13 23:22, Vince Weaver wrote:
> 
> It turns out PERF_IOC_FLAG_GROUP was broken from
> 75f937f24bd9 (in Linux 2.6.31, the initial perf_event release) 
> until 724b6daa1 (Linux 3.4).
> 
> I've done some extensive kernel source code digging plus running tests of 
> various kernels and I hope the info presented is accurate now.
> 
> Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>

Thanks, Vince. Applied.

Cheers,

Michael



> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index 504e801..ff7e4af 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -1803,7 +1803,8 @@ file descriptor argument.
>  If the
>  .B PERF_IOC_FLAG_GROUP
>  bit is set in the ioctl argument, then all events in a group are
> -enabled, even if the event specified is not the group leader.
> +enabled, even if the event specified is not the group leader
> +(note this flag was broken until Linux 3.4).
>  .TP
>  .B PERF_EVENT_IOC_DISABLE
>  Disables the individual counter or event group specified by the
> @@ -1819,7 +1820,8 @@ stops that counter from counting but doesn't affect any other counter.
>  If the
>  .B PERF_IOC_FLAG_GROUP
>  bit is set in the ioctl argument, then all events in a group are
> -disabled, even if the event specified is not the group leader.
> +disabled, even if the event specified is not the group leader
> +(note this flag was broken until Linux 3.4).
>  .TP
>  .B PERF_EVENT_IOC_REFRESH
>  Non-inherited overflow counters can use this
> @@ -1848,14 +1850,9 @@ values.
>  If the
>  .B PERF_IOC_FLAG_GROUP
>  bit is set in the ioctl argument, then all events in a group are
> -reset, even if the event specified is not the group leader.
> +reset, even if the event specified is not the group leader
> +(note this flag was broken until Linux 3.4).
>  
> -If the
> -.B PERF_IOC_FLAG_GROUP
> -bit is not set, then the behavior is somwhat unexpected:
> -when sent to a group leader only the leader is reset
> -(children are left alone);
> -when sent to a child all events in a group are reset.
>  .TP
>  .B PERF_EVENT_IOC_PERIOD
>  IOC_PERIOD is the command to update the period; it
> @@ -2042,6 +2039,12 @@ Linux 2.6.36 and Linux 3.0 that ignores the
>  was chosen if the union has a
>  non-zero value in it.
>  
> +From Linux 2.6.31 to Linux 3.4 the 
> +.B PERF_IOC_FLAG_GROUP
> +ioctl argument was broken and would repeatedly operate
> +on the event specified rather than iterating across
> +all sibling events in a group.
> +
>  Always double-check your results!
>  Various generalized events have had wrong values.
>  For example, retired branches measured
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

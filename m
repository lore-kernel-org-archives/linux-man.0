From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: perf_event_open() -- improve PERF_SAMPLE_BRANCH_STACK documentation
Date: Tue, 09 Jul 2013 02:27:39 +0200
Message-ID: <51DB58FB.6090608@gmail.com>
References: <alpine.DEB.2.10.1307081544020.10386@vincent-weaver-1.um.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.10.1307081544020.10386-6xBS8L8d439fDsnSvq7Uq4Se7xf15W0s1dQoKJhdanU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/08/13 21:47, Vince Weaver wrote:
> 
> Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>


Thanks. Applied!

Cheers,

Michael


> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index 504e801..1fc4e27 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -654,8 +654,13 @@ Records additional data, if applicable.
>  Usually returned by tracepoint events.
>  .TP
>  .BR PERF_SAMPLE_BRANCH_STACK " (Since Linux 3.4)"
> -Records the branch stack.
> -See branch_sample_type.
> +This provides a record of recent branches, as provided
> +by CPU branch sampling hardware (such as Intel Last Branch Record).
> +Not all hardware supports this feature.
> +
> +See the
> +.I branch_sample_type
> +field for how to filter which branches are reported.
>  .TP
>  .BR PERF_SAMPLE_REGS_USER " (Since Linux 3.7)"
>  Records the current user-level CPU register state
> @@ -960,8 +965,17 @@ is a further extension of the
>  field.
>  .TP
>  .IR "branch_sample_type" " (Since Linux 3.4)"
> -This is used with the CPUs hardware branch sampling, if available.
> -It can have one of the following values:
> +If 
> +.B PERF_SAMPLE_BRANCH_STACK
> +is enabled, then this specifies what branches to include
> +in the branch record.
> +If the user does not set privilege level explicitly, the kernel
> +will use the event's privilege level.
> +Event and branch privilege levels do not have to match.
> +The value is formed by ORing together zero or more of the following values,
> +although 
> +.B PERF_SAMPLE_BRANCH_ANY
> +covers all branch types.
>  .RS
>  .TP
>  .B PERF_SAMPLE_BRANCH_USER
> @@ -1545,9 +1559,31 @@ is enabled, then a 64-bit value indicating
>  the number of records is included, followed by
>  .I bnr
>  .I perf_branch_entry
> -structures.
> -These structures have from, to, and flags values indicating
> -the from and to addresses from the branches on the callstack.
> +structures which each include the fields:
> +.RS
> +.TP
> +.I from
> +indicating the source instruction (may not be a branch)
> +.TP
> +.I to
> +the branch target
> +.TP
> +.I mispred
> +the branch target was mispredicted
> +.TP
> +.I predicted
> +the branch target was predicted.
> +.RE
> +The entries are from most to least recent, so the first entry
> +has the most recent branch.
> +
> +Support for 
> +.I mispred 
> +and 
> +.I predicted 
> +is optional; if not supported both
> +values will be 0.
> +
>  .TP
>  .IR abi ", " regs[weight(mask)]
>  If
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

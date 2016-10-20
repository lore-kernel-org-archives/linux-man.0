From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] perf_event_open.2: add cycles field in LBR records
Date: Thu, 20 Oct 2016 07:54:13 +0200
Message-ID: <d12eac86-231d-f8cb-c03a-43ad63d2225a@gmail.com>
References: <alpine.DEB.2.20.1610191108080.16261@macbook-air>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.20.1610191108080.16261@macbook-air>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andi Kleen <ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Vince,


On 10/19/2016 05:10 PM, Vince Weaver wrote:
> 
> Linux 4.3 (71ef3c6b9d4665ee7afbbe4c208a98917dcfc32f)
> added a cycles field to the PERF_SAMPLE_BRANCH_STACK
> last branch records.
> 
> The kernel commit was a bit vague on this, but you can find
> a few more details on this in the Intel Architectural Manual
> vol3B.  The field indicates the number of core cycles elapsed
> since the previous update to the LBR stack.
> 
> This feature is only found on Skylake and newer Intel chips,
> as well as Intel Atom Goldmont chips.  I'm not sure if it's
> worth adding this info to the manpage, as it seems a bit
> specific and will probably get rapidly out of date.
> 
> I'm also not sure about the manpage project's opinion on
> Oxford commas.

We like them!

Patch applied. One comment below.
> 
> Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
> 
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index d64adaf..c9555c6 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -2183,15 +2183,18 @@ The branch was in a transactional memory transaction.
>  .IR abort " (since Linux 3.11)"
>  .\" commit 135c5612c460f89657c4698fe2ea753f6f667963
>  The branch was in an aborted transactional memory transaction.
> +.TP
> +.IR cycles " (since Linux 4.3)"
> +.\" commit 71ef3c6b9d4665ee7afbbe4c208a98917dcfc32f
> +This reports the number of cycles elapsed since the
> +previous branch stack update.
>  .P
>  The entries are from most to least recent, so the first entry
>  has the most recent branch.
>  
>  Support for
> -.I mispred
> -and
> -.I predicted
> -is optional; if not supported, both
> +.IR mispred ", " predicted " and " cycles

Rather than the previous, I mostly prefer something like:

Support for
.IR mispred ,
.IR predicted , 
and
.IR cycles

I actually find source in that format a little easier to
read, and a lot easier to script against.

Cheers,

Michael


> +is optional; if not supported, those
>  values will be 0.
>  
>  The type of branches recorded is specified by the
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

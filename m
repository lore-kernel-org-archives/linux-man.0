From: Petr Cermak <petrcermak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2] proc.5: Add description of CLEAR_REFS_MM_HIWATER_RSS
Date: Fri, 9 Sep 2016 10:43:56 +0100
Message-ID: <20160909094356.GA14216@google.com>
References: <20160909060313.733-1-namhyung@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160909060313.733-1-namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Namhyung Kim <namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, Sep 09, 2016 at 03:03:13PM +0900, Namhyung Kim wrote:
> The Linux kernel commit 695f05593693 ("fs/proc/task_mmu.c: add
> user-space support for resetting mm->hiwater_rss (peak RSS)") added a
> way to reset peak RSS of a process but missed to update manpage.
> 
> Cc: Petr Cermak <petrcermak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Namhyung Kim <namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  man5/proc.5 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man5/proc.5 b/man5/proc.5
> index 14588fe..cf32e0f 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -340,7 +340,7 @@ process during the measured interval.
>  If one is interested only in inspecting the selected mapping types,
>  then the value 2 or 3 can be used instead of 1.
>  
> -A further value can be written to affect a different bit:
> +A further value can be written to affect different properties:
>  .RS
>  .TP
>  4 (since Linux 3.11)
> @@ -352,6 +352,11 @@ by the check-point restore system to discover which pages of a process
>  have been dirtied since the file
>  .IR /proc/[pid]/clear_refs
>  was written to.
> +.TP
> +5 (since Linux 4.0)
> +.\" Internally: CLEAR_REFS_MM_HIWATER_RSS
> +Reset the peak resident set size ("high water mark") to the process'
> +current value.
>  .RE
>  .IP
>  Writing any value to
> -- 
> 2.9.3

Please also change "A further value" to "Further values" since there are
now two (CLEAR_REFS_SOFT_DIRTY (4) and CLEAR_REFS_MM_HIWATER_RSS (5)).
Thanks!
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: shawn <shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] prctl.2, proc.5: document arm alignment trap via
 /proc/apu/alignment
Date: Sat, 04 Aug 2012 14:24:03 -0700
Message-ID: <1344115443.24952.233.camel@shawn-ssd>
References: <1344113204-4294-1-git-send-email-shawnlandden@gmail.com>
	 <1344113204-4294-3-git-send-email-shawnlandden@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1344113204-4294-3-git-send-email-shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

this interface has been like this from the pre-git days, and I did not
track down the specific version it was added to its present location (it
was once in sysfs)
On Sat, 2012-08-04 at 13:46 -0700, Shawn Landden wrote: 
> ---
>  man2/prctl.2 |    7 +++++--
>  man5/proc.5  |   21 ++++++++++++++++++++-
>  2 files changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/man2/prctl.2 b/man2/prctl.2
> index f4db191..b68bea2 100644
> --- a/man2/prctl.2
> +++ b/man2/prctl.2
> @@ -44,7 +44,7 @@
>  .\" 2012-08-03 Shawn Landden, Document PR_SET_NO_NEW_PRIVS, PR_GET_NO_NEW_PRIVS,
>  .\"       SECCOMP_MODE_STRICT, SECCOMP_MODE_FILTER
>  .\"       (thx Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org> 259e5e6c)
> -.\"       PR_SET_TIMERSLACK, PR_GET_TIMESLACK
> +.\"       PR_SET_TIMERSLACK, PR_GET_TIMESLACK, ARM alignment trap handler
>  .\"
>  .TH PRCTL 2 2012-08-03 "Linux" "Linux Programmer's Manual"
>  .SH NAME
> @@ -406,7 +406,10 @@ Pass
>  \fBPR_UNALIGN_NOPRINT\fP to silently fix up unaligned user accesses,
>  or \fBPR_UNALIGN_SIGBUS\fP to generate
>  .B SIGBUS
> -on unaligned user access.
> +on unaligned user access. ARM is set system-wide via /proc/cpu/alignment (see
> +.IR Documentation/arm/mem_alignment
> +or
> +.BR proc (5)).
>  .TP
>  .B PR_GET_UNALIGN
>  (see
> diff --git a/man5/proc.5 b/man5/proc.5
> index 2ba1daa..e7ca611 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -58,7 +58,7 @@
>  .\" to see what information could be imported from that file
>  .\" into this file.
>  .\"
> -.TH PROC 5 2012-05-03 "Linux" "Linux Programmer's Manual"
> +.TH PROC 5 2012-08-04 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  proc \- process information pseudo-file system
>  .SH DESCRIPTION
> @@ -1229,6 +1229,25 @@ cat /lib/modules/$(uname \-r)/build/.config
>  is only provided if the kernel is configured with
>  .BR CONFIG_IKCONFIG_PROC .
>  .TP
> +.IR /proc/cpu/alignment " (ARM only)"
> +Set the behavior of the user-mode alignment trap handler. When writing, takes a
> +number that is the sum of the fallowing: 1, print message to syslog; (signal) 2,
> +fix up the user process performing the unaligned access; (fixup) 4, send a
> +.BR SIGBUS
> +signal (
> +.BR SIGILL
> +before 2.6.35) to the user process performing the unaligned access. (signal)
> +Signal and fixup cannot be used together. On armv6+ either fixup or signal must
> +be used, to prevent possible deadlock.
> +
> +Reading will provide statistics on fixups performed since boot in user and
> +system mode, as well as the current user-mode trap behavior.
> +
> +Other architectures set this behavior on a per-process level, via
> +.B prctl(PR_SET_UNALIGN).
> +See
> +.BR prctl (2).
> +.TP
>  .I /proc/cpuinfo
>  This is a collection of CPU and system architecture dependent items,
>  for each supported architecture a different list.


-- 
-Shawn Landden

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

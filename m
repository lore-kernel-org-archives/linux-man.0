From: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
Subject: Re: [patch 10/10] perf_event_open.2: 4.0 update rdpmc documentation
Date: Fri, 17 Apr 2015 14:27:13 -0700
Message-ID: <55317AB1.5050001@amacapital.net>
References: <alpine.DEB.2.11.1504161419180.15181@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.11.1504161419180.15181-6xBS8L8d439fDsnSvq7Uqyn2WXadKZNJe7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Weaver <public-vincent.weaver-e7X0jjDqjFGHXe+LvDLADg-wOFGN7rlS/M9smdsby/KFg@public.gmane.org>, "Michael Kerrisk (man-pages)" <public-mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w-wOFGN7rlS/M9smdsby/KFg@public.gmane.org>
Cc: public-linux-man-u79uwXL29TY76Z2rM5mHXA-wOFGN7rlS/M9smdsby/KFg@public.gmane.org, public-linux-kernel-u79uwXL29TY76Z2rM5mHXA-wOFGN7rlS/M9smdsby/KFg@public.gmane.org, Peter Zijlstra <public-a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw-wOFGN7rlS/M9smdsby/KFg@public.gmane.org>, Paul Mackerras <public-paulus-eUNUBHrolfbYtjvyW6yDsg-wOFGN7rlS/M9smdsby/KFg@public.gmane.org>, Ingo Molnar <public-mingo-H+wXaHxf7aLQT0dZR+AlfA-wOFGN7rlS/M9smdsby/KFg@public.gmane.org>, Arnaldo Carvalho de Melo <public-acme-DgEjT+Ai2ygdnm+yROfE0A-wOFGN7rlS/M9smdsby/KFg@public.gmane.org>, Stephane Eranian <public-eranian-hpIqsD4AKlfQT0dZR+AlfA-wOFGN7rlS/M9smdsby/KFg@public.gmane.org>, Andy Lutomirski <public-luto-kltTT9wpgjJwATOyAt5JVQ-wOFGN7rlS/M9smdsby/KFg@public.gmane.org>, Kees Cook <public-keescook-F7+t8E8rja9g9hUCZPvPmw-wOFGN7rlS/M9smdsby/KFg@public.gmane.org>, Andrea Arcangeli <public-aarcange-H+wXaHxf7aLQT0dZR+AlfA-wOFGN7rlS/M9smdsby/KFg@public.gmane.org>, "hillf.zj" <public-hillf.zj-gPhfCIXyaqCqndwCJWfcng-wOFGN7rlS/M9smdsby/KFg@public.gmane.org>, Valdis Kletnieks <public-Valdis.Kletnieks-PjAqaU27lzQ-wOFGN7rlS/M9smdsby/KFg@public.gmane.org>, Linus Torvalds <public-torv>
List-Id: linux-man@vger.kernel.org



On 04/16/2015 11:20 AM, Vince Weaver wrote:
>
> The rdpmc instruction allows reading performance counters directly
> from usersapce.  Prior to Linux 4.0 any process could use this
> instruction when a perf event was running, even if the process itself
> did not have any open.  The following changesets changed the default
> behavior so that only processes with active events can use rdpmc.
>
> Note this change broke the ABI.  Previously:
> 	/sys/bus/event_source/devices/cpu/rdpmc
> Set to "1" meant allow across whole system.
>
> After the change "2" means the whole system, and "1" means per-process.
>
> Probably a better change would have been to add "2" to mean per-process
> and make that the default setting.  Probably too late to fix that now.

Good point.  I wish you'd thought of that sooner :(

--Andy

>
> 	commit a66734297f78707ce39d756b656bfae861d53f62
> 	Author: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
>
> 	perf/x86: Add /sys/devices/cpu/rdpmc=2 to allow rdpmc for all tasks
>
> 	commit 7911d3f7af14a614617e38245fedf98a724e46a9
> 	Author: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
>
> 	perf/x86: Only allow rdpmc if a perf_event is mapped
>
> 	Signed-off-by: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
> 	Signed-off-by: Peter Zijlstra (Intel) <peterz-wEGCiKHe2LqWVfeAwA7xHQ-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
> 	Cc: Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
> 	Cc: Arnaldo Carvalho de Melo <acme-DgEjT+Ai2ygdnm+yROfE0A-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
> 	Cc: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
> 	Cc: Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
> 	Cc: Vince Weaver <vince-yfjdyHUqu3OsTnJN9+BGXg-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
> 	Cc: "hillf.zj" <hillf.zj-gPhfCIXyaqCqndwCJWfcng-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
> 	Cc: Valdis Kletnieks <Valdis.Kletnieks-PjAqaU27lzQ-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
> 	Cc: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
> 	Link: http://lkml.kernel.org/r/caac3c1c707dcca48ecbc35f4def21495856f479.1414190806.git.luto-kltTT9wpgjJwATOyAt5JVQ-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org
> 	Signed-off-by: Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
>
> Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
>
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index 01ee579..c854d21 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -2377,6 +2377,16 @@ Support for this can be detected with the
>   .I cap_usr_rdpmc
>   field in the mmap page; documentation on how
>   to calculate event values can be found in that section.
> +
> +Originally when rdpmc support was enabled, any process (not just ones
> +with an active perf event) could use the rdpmc instruction to access
> +the counters.
> +Starting with Linux 4.0
> +.\" 7911d3f7af14a614617e38245fedf98a724e46a9
> +rdpmc support is only enabled if an event is currently enabled
> +in a process' context.
> +To restore the old behavior, write the value 2 to
> +.IR /sys/devices/cpu/rdpmc .
>   .SS perf_event ioctl calls
>   .PP
>   Various ioctls act on
> @@ -2552,11 +2562,18 @@ field of
>   .I perf_event_attr
>   to indicate that you wish to use this PMU.
>   .TP
> -.IR /sys/bus/event_source/devices/*/rdpmc " (since Linux 3.4)"
> +.IR /sys/bus/event_source/devices/cpu/rdpmc " (since Linux 3.4)"
>   .\" commit 0c9d42ed4cee2aa1dfc3a260b741baae8615744f
>   If this file is 1, then direct user-space access to the
>   performance counter registers is allowed via the rdpmc instruction.
>   This can be disabled by echoing 0 to the file.
> +
> +As of Linux 4.0
> +.\" a66734297f78707ce39d756b656bfae861d53f62
> +.\" 7911d3f7af14a614617e38245fedf98a724e46a9
> +the behavior has changed, so that 1 now means only allow access
> +to processes with active perf events, with 2 indicating the old
> +allow-anyone-access behavior.
>   .TP
>   .IR /sys/bus/event_source/devices/*/format/ " (since Linux 3.4)"
>   .\" commit 641cc938815dfd09f8fa1ec72deb814f0938ac33
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

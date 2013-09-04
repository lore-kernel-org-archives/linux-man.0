From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] clock_getres.2: Remove obsolete note on SMP systems
Date: Wed, 4 Sep 2013 14:32:49 +0200
Message-ID: <CAKgNAkj_SumnwDQ=rxSBubybzOSTS9u0RjDBSR-1=KrTK7=L_A@mail.gmail.com>
References: <1378202731-29738-1-git-send-email-rodrigo@sdfg.com.ar> <1378202731-29738-2-git-send-email-rodrigo@sdfg.com.ar>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1378202731-29738-2-git-send-email-rodrigo-aOqSs0FX/Gu4Tu3zPC53fQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rodrigo Campos <rodrigo-aOqSs0FX/Gu4Tu3zPC53fQ@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Rodrigo,

On Tue, Sep 3, 2013 at 12:05 PM, Rodrigo Campos <rodrigo-aOqSs0FX/Gu4Tu3zPC53fQ@public.gmane.org> wrote:
> As confirmed by peterz on IRC, this note is obsolete:
>
>         <peterz> rata: that section is obsolete; CLOCK_THREAD_CPUTIME_ID is good
>         <peterz> rata: CLOCK_PROCESS_CPUTIME_ID is also correct
>
> So this patch just removes it.

Clearly, the page needs amending. However, ideal would be to describe
*when* the section became obsolete (which kernel version). Do you or
Peter know, or have an idea how we can determine that information?

Cheers,

Michael


> ---
>  man2/clock_getres.2 |   32 --------------------------------
>  1 file changed, 32 deletions(-)
>
> diff --git a/man2/clock_getres.2 b/man2/clock_getres.2
> index 10ecd18..eac97cd 100644
> --- a/man2/clock_getres.2
> +++ b/man2/clock_getres.2
> @@ -218,38 +218,6 @@ indicate that
>  are available.
>  (See also
>  .BR sysconf (3).)
> -.SH NOTES
> -.SS Note for SMP systems
> -The
> -.B CLOCK_PROCESS_CPUTIME_ID
> -and
> -.B CLOCK_THREAD_CPUTIME_ID
> -clocks are realized on many platforms using timers from the CPUs
> -(TSC on i386, AR.ITC on Itanium).
> -These registers may differ between CPUs and as a consequence
> -these clocks may return
> -.B bogus results
> -if a process is migrated to another CPU.
> -.PP
> -If the CPUs in an SMP system have different clock sources then
> -there is no way to maintain a correlation between the timer registers since
> -each CPU will run at a slightly different frequency.
> -If that is the case then
> -.I clock_getcpuclockid(0)
> -will return
> -.B ENOENT
> -to signify this condition.
> -The two clocks will then be useful only if it
> -can be ensured that a process stays on a certain CPU.
> -.PP
> -The processors in an SMP system do not start all at exactly the same
> -time and therefore the timer registers are typically running at an offset.
> -Some architectures include code that attempts to limit these offsets on bootup.
> -However, the code cannot guarantee to accurately tune the offsets.
> -Glibc contains no provisions to deal with these offsets (unlike the Linux
> -Kernel).
> -Typically these offsets are small and therefore the effects may be
> -negligible in most cases.
>  .SH BUGS
>  According to POSIX.1-2001, a process with "appropriate privileges" may set the
>  .B CLOCK_PROCESS_CPUTIME_ID
> --
> 1.7.10.4
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Rodrigo Campos <rodrigo-aOqSs0FX/Gu4Tu3zPC53fQ@public.gmane.org>
Subject: [PATCH] clock_getres.2: Remove obsolete note on SMP systems
Date: Tue,  3 Sep 2013 11:05:31 +0100
Message-ID: <1378202731-29738-2-git-send-email-rodrigo@sdfg.com.ar>
References: <1378202731-29738-1-git-send-email-rodrigo@sdfg.com.ar>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1378202731-29738-1-git-send-email-rodrigo-aOqSs0FX/Gu4Tu3zPC53fQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rodrigo Campos <rodrigo-aOqSs0FX/Gu4Tu3zPC53fQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

As confirmed by peterz on IRC, this note is obsolete:

	<peterz> rata: that section is obsolete; CLOCK_THREAD_CPUTIME_ID is good
	<peterz> rata: CLOCK_PROCESS_CPUTIME_ID is also correct

So this patch just removes it.
---
 man2/clock_getres.2 |   32 --------------------------------
 1 file changed, 32 deletions(-)

diff --git a/man2/clock_getres.2 b/man2/clock_getres.2
index 10ecd18..eac97cd 100644
--- a/man2/clock_getres.2
+++ b/man2/clock_getres.2
@@ -218,38 +218,6 @@ indicate that
 are available.
 (See also
 .BR sysconf (3).)
-.SH NOTES
-.SS Note for SMP systems
-The
-.B CLOCK_PROCESS_CPUTIME_ID
-and
-.B CLOCK_THREAD_CPUTIME_ID
-clocks are realized on many platforms using timers from the CPUs
-(TSC on i386, AR.ITC on Itanium).
-These registers may differ between CPUs and as a consequence
-these clocks may return
-.B bogus results
-if a process is migrated to another CPU.
-.PP
-If the CPUs in an SMP system have different clock sources then
-there is no way to maintain a correlation between the timer registers since
-each CPU will run at a slightly different frequency.
-If that is the case then
-.I clock_getcpuclockid(0)
-will return
-.B ENOENT
-to signify this condition.
-The two clocks will then be useful only if it
-can be ensured that a process stays on a certain CPU.
-.PP
-The processors in an SMP system do not start all at exactly the same
-time and therefore the timer registers are typically running at an offset.
-Some architectures include code that attempts to limit these offsets on bootup.
-However, the code cannot guarantee to accurately tune the offsets.
-Glibc contains no provisions to deal with these offsets (unlike the Linux
-Kernel).
-Typically these offsets are small and therefore the effects may be
-negligible in most cases.
 .SH BUGS
 According to POSIX.1-2001, a process with "appropriate privileges" may set the
 .B CLOCK_PROCESS_CPUTIME_ID
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

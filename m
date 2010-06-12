From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] [4/4] Document the hwpoison prctls in 2.6.32
Date: Sat, 12 Jun 2010 16:50:55 +0200
Message-ID: <AANLkTiloYpJOYq8_r2O9pT2Zj336Zw2mca7XRWlqcy00@mail.gmail.com>
References: <20100320429.026463287@firstfloor.org> <20100320152931.17E2DB19E8@basil.firstfloor.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100320152931.17E2DB19E8-Oisruko67ZwogZNkvFMw5WD2FQJk+8+b@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Andi,

On Sat, Mar 20, 2010 at 5:29 PM, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org> wrote:
>
> Signed-off-by: Andi Kleen <ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>

Thanks for this patch. I've done a few language fixes, and also
attempted to refine some details. Could you review the below, which
will be in 3.25?

Thanks,

Michael


--- a/man2/prctl.2
+++ b/man2/prctl.2
@@ -37,6 +37,7 @@
 .\" 2008-06-13 Erik Bosman, <ejbosman-FV+mU1CFjts@public.gmane.org>
 .\"     Document PR_GET_TSC and PR_SET_TSC.
 .\" 2008-06-15 mtk, Document PR_SET_SECCOMP, PR_GET_SECCOMP
+.\" 2009-10-03 Andi Kleen, document PR_MCE_KILL_*
 .\"
 .TH PRCTL 2 2010-05-13 "Linux" "Linux Programmer's Manual"
 .SH NAME
@@ -324,6 +325,52 @@ on unaligned user access.
 for information on versions and architectures)
 Return unaligned access control bits, in the location pointed to by
 .IR "(int\ *) arg2" .
+.TP
+.BR PR_MCE_KILL " (since Linux 2.6.32)"
+Set the machine check memory corruption kill policy for the current thread.
+If
+.I arg2
+is
+.BR PR_MCE_KILL_CLEAR ,
+clear the thread memory corruption kill policy and use the system-wide default.
+(The system-wide default is defined by
+.IR /proc/sys/vm/memory_failure_early_kill ;
+see
+.BR proc (5).)
+If
+.I arg2
+is
+.BR PR_MCE_KILL_SET ,
+use a thread-specific memory corruption kill policy.
+In this case,
+.I arg3
+defines whether the policy is
+.I early kill
+.RB ( PR_MCE_KILL_EARLY ),
+.I late kill
+.RB ( PR_MCE_KILL_LATE ),
+or the system-wide default
+.RB ( PR_MCE_KILL_DEFAULT ).
+Early kill means that the task receives a
+.B SIGBUS
+signal as soon as hardware memory corruption is detected inside
+its address space.
+In late kill mode, the process is only killed when it accesses a
corrupted page.
+See
+.I sigaction(2)
+for more information on the
+.BR SIGBUS
+signal.
+The policy is inherited by children.
+The remaining unused
+.BR prctl ()
+arguments must be zero for future compatibility.
+.TP
+.BR PR_MCE_KILL_GET " (since Linux 2.6.32)"
+Return the current per-process machine check kill policy.
+All unused
+.BR prctl ()
+arguments must be zero.
 .SH "RETURN VALUE"
 On success,
 .BR PR_GET_DUMPABLE ,
@@ -331,6 +378,7 @@ On success,
 .BR PR_CAPBSET_READ ,
 .BR PR_GET_TIMING ,
 .BR PR_GET_SECUREBITS ,
+.BR PR_MCE_KILL_GET ,
 and (if it returns)
 .BR PR_GET_SECCOMP
 return the nonnegative values described above.
@@ -352,6 +400,16 @@ The value of
 is not recognized.
 .TP
 .B EINVAL
+.I option
+is
+.BR PR_MCE_KILL
+or
+.BR PR_MCE_KILL_GET ,
+and unused
+.BR prctl ()
+arguments were not specified as zero.
+.TP
+.B EINVAL
 .I arg2
 is not valid value for this
 .IR option .
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

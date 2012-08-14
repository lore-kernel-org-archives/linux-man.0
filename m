From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: proc(5): minor text updates
Date: Tue, 14 Aug 2012 20:59:45 +0200
Message-ID: <CAKgNAkhaWVFHx8-wAL+SpGjvdWiWKVY9r=mVx4BtWVd7g1q6WQ@mail.gmail.com>
References: <50202153.6030808@googlemail.com> <CAKgNAkhrmpZuF45iOA52akABSm4hUy4ygR=vEg4XQ_4Ri7DjRw@mail.gmail.com>
 <502935C1.60901@googlemail.com> <CAKgNAkh_PxqPy+jK0t6WG54KQXOkm2JBTDw69qEtqOsaeTVGAg@mail.gmail.com>
 <502A90A9.1030100@googlemail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <502A90A9.1030100-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tolga Dalman <tolga.dalman-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Tolga,
On Tue, Aug 14, 2012 at 7:53 PM, Tolga Dalman
<tolga.dalman-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> Hello Michael,
>
> On 08/13/12 22:41, Michael Kerrisk (man-pages) wrote:
>> Ahh -- yes, an easy mistake to make I think. The thing is there are two
>> unrelated sets of constants in the PF_* namespace. Take a look in
>> linux/sched.h to see the other set, which is (AFAICS) the set that is used
>> in this /proc file.
>
> Which other set of PF_ constants in <linux/sched.h> ? I only see SCHED_* and
> CLONE_* defined in that file. Aside from protocol family PF_* flags, there is
> only <linux/elf.h> defining permission flags (PF_R/W/X), which seems unlikely
> to me.

Ahhh -- sorry, I should have been a little clearer: what the page is
referring to is the kernel source file include/linux/sched.h. In that
file there are the definitions below. I'll amend the wording of the
page a little to make this clearer:

--- a/man5/proc.5
+++ b/man5/proc.5
@@ -702,8 +702,8 @@ terminal of the process.
 \fIflags\fP %u (%lu before Linux 2.6.22)
 The kernel flags word of the process.
 For bit meanings,
-see the PF_* defines in
-.IR <linux/sched.h> .
+see the PF_* defines in the kernel source file
+.IR include/linux/sched.h .
 Details depend on the kernel version.
 .TP
 \fIminflt\fP %lu

Hopefully that helps.

Cheers

Michael


/*
 * Per process flags
 */
#define PF_EXITING      0x00000004      /* getting shut down */
#define PF_EXITPIDONE   0x00000008      /* pi exit done on shut down */
#define PF_VCPU         0x00000010      /* I'm a virtual CPU */
#define PF_WQ_WORKER    0x00000020      /* I'm a workqueue worker */
#define PF_FORKNOEXEC   0x00000040      /* forked but didn't exec */
#define PF_MCE_PROCESS  0x00000080      /* process policy on mce errors */
#define PF_SUPERPRIV    0x00000100      /* used super-user privileges */
#define PF_DUMPCORE     0x00000200      /* dumped core */
#define PF_SIGNALED     0x00000400      /* killed by a signal */
#define PF_MEMALLOC     0x00000800      /* Allocating memory */
#define PF_NPROC_EXCEEDED 0x00001000    /* set_user noticed that
RLIMIT_NPROC was exceeded */
#define PF_USED_MATH    0x00002000      /* if unset the fpu must be
initialized before use */
#define PF_NOFREEZE     0x00008000      /* this thread should not be frozen */
#define PF_FROZEN       0x00010000      /* frozen for system suspend */
#define PF_FSTRANS      0x00020000      /* inside a filesystem transaction */
#define PF_KSWAPD       0x00040000      /* I am kswapd */
#define PF_LESS_THROTTLE 0x00100000     /* Throttle me less: I clean memory */
#define PF_KTHREAD      0x00200000      /* I am a kernel thread */
#define PF_RANDOMIZE    0x00400000      /* randomize virtual address space */
#define PF_SWAPWRITE    0x00800000      /* Allowed to write to swap */
#define PF_SPREAD_PAGE  0x01000000      /* Spread page cache over cpuset */
#define PF_SPREAD_SLAB  0x02000000      /* Spread some slab caches
over cpuset */
#define PF_THREAD_BOUND 0x04000000      /* Thread bound to specific cpu */
#define PF_MCE_EARLY    0x08000000      /* Early kill for mce process policy */
#define PF_MEMPOLICY    0x10000000      /* Non-default NUMA mempolicy */
#define PF_MUTEX_TESTER 0x20000000      /* Thread belongs to the rt
mutex tester */
#define PF_FREEZER_SKIP 0x40000000      /* Freezer should not count it
as freezable */

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

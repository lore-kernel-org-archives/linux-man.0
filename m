From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] clone.2: Adjust syscall prototype and expand CLONE_SETTLS
 description
Date: Sun, 25 Sep 2016 21:03:07 +0200
Message-ID: <5b7eb44c-0f9a-f143-9e3d-9927961b2139@gmail.com>
References: <20160824030607.GA2596@Kenos-MacBook-Pro-2.local>
 <2c257a1e-b7c5-c2bc-09ab-a2a685ae37b7@gmail.com>
 <20160904051102.hgatyfxspa7fjvzz@x>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160904051102.hgatyfxspa7fjvzz@x>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Josh Triplett <josh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Keno Fischer <keno-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

[CC += Mike Frysinger, since he also commented on this in the past]

On 09/04/2016 07:11 AM, Josh Triplett wrote:
> On Sun, Sep 04, 2016 at 04:30:44PM +1200, Michael Kerrisk (man-pages) wrote:
>> [CC += Josh]
>>
>> Josh, I know you were submitting patches relate to the clone() TLS argument a 
>> while back. Could you comment on this patch proposal below (also
>> https://bugzilla.kernel.org/show_bug.cgi?id=118241 is relevant).
> 
> Sure.
> 
>> On 08/24/2016 03:06 PM, Keno Fischer wrote:
>>> The prototype for the system call was added in 81f10dad, but looking at the
>>> kernel's fork.c, I believe the relevant definition is
>>>
>>> SYSCALL_DEFINE5(clone, unsigned long, clone_flags, unsigned long, newsp,
>>> int __user *, parent_tidptr,
>>> int __user *, child_tidptr,
>>> unsigned long, tls)
>>>
>>> so the last argument is the tls argument, not a pt_regs argument.
>>> I stumbled upon this while trying to understand CLONE_SETTLS, so I expanded
>>> that description a little to cover other architectures.
> 
> This description and patch looks correct to me.
> Reviewed-by: Josh Triplett <josh-iaAMLnmF4UmaiuxdJuQwMA@public.gmane.org>

Thanks, Josh.

> Ideally, I'd suggest a follow-up patch to improve the prototypes for the
> various architectures.  Rather than saying "x86 looks roughly this way,
> on these architectures swap these arguments, on these architectures
> ...", I'd suggest explicitly giving each of the four prototypes (normal,
> CONFIG_CLONE_BACKWARDS, CONFIG_CLONE_BACKWARDS2,
> CONFIG_CLONE_BACKWARDS3) and the corresponding architectures.

I applied the patch below. Okay?

Cheers,

Michael

diff --git a/man2/clone.2 b/man2/clone.2
index 5c1e301..26c6b30 100644
--- a/man2/clone.2
+++ b/man2/clone.2
@@ -54,11 +54,7 @@ clone, __clone2 \- create a child process
 .BI "          /* pid_t *" ptid ", void *" newtls \
 ", pid_t *" ctid " */ );"
 
-/* Prototype for the raw system call */
-
-.BI "long clone(unsigned long " flags ", void *" child_stack ,
-.BI "          int *" ptid ", int *" ctid ,
-.BI "          unsigned long " newtls );
+/* For the prototype of the raw system call, see NOTES */
 .fi
 .SH DESCRIPTION
 .BR clone ()
@@ -821,16 +817,58 @@ arguments of the
 .BR clone ()
 wrapper function are omitted.
 Furthermore, the argument order changes.
-The raw system call interface on x86 and many other architectures is roughly:
+In addition, there are variations across architectures.
+
+The raw system call interface on x86-64 and some other architectures
+(including sh, tile, and alpha) is roughly:
+
 .in +4
 .nf
+.BI "long clone(unsigned long " flags ", void *" child_stack ,
+.BI "           int *" ptid ", int *" ctid ,
+.BI "           unsigned long " newtls );
+.fi
+.in
+
+On x86-32, and several other common architectures
+(including score, microblaze, ARM, ARM 64, PA-RISC, arc, Power PC, xtensa,
+and MIPS),
+.\" CONFIG_CLONE_BACKWARDS
+the order of the last two arguments is reversed:
 
+.in +4
+.nf
 .BI "long clone(unsigned long " flags ", void *" child_stack ,
+.BI "          int *" ptid ", unsigned long " newtls ,
+.BI "          int *" ctid );
+.fi
+.in
+
+On the cris and s390 architectures,
+.\" CONFIG_CLONE_BACKWARDS2
+the order of the first two arguments is reversed:
+
+.in +4
+.nf
+.BI "long clone(void *" child_stack ", unsigned long " flags ,
 .BI "           int *" ptid ", int *" ctid ,
 .BI "           unsigned long " newtls );
+.fi
+.in
+
+On the microblaze architecture,
+.\" CONFIG_CLONE_BACKWARDS3
+an additional argument is supplied:
 
+.in +4
+.nf
+.BI "long clone(unsigned long " flags ", void *" child_stack ,
+.BI "           int " stack_size , "\fR         /* Size of stack */"
+.BI "           int *" ptid ", int *" ctid ,
+.BI "           unsigned long " newtls );
 .fi
 .in
+
 Another difference for the raw system call is that the
 .I child_stack
 argument may be zero, in which case copy-on-write semantics ensure that the
@@ -839,15 +877,11 @@ the stack.
 In this case, for correct operation, the
 .B CLONE_VM
 option should not be specified.

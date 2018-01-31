From: Heiko Carstens <heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>
Subject: Re: [man-pages PATCH 2/5] s390_runtime_instr.2: document the removal
 of the second argument
Date: Wed, 31 Jan 2018 08:20:02 +0100
Message-ID: <20180131072002.GA3939@osiris>
References: <20180114185627.GA23602@asgard.redhat.com>
 <20180120114126.GC6287@osiris>
 <CACGkJduq-h=RdranSq_jbg3g65dKPLa5+P-85kR4Z+nFyfYe0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACGkJduq-h=RdranSq_jbg3g65dKPLa5+P-85kR4Z+nFyfYe0w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Martin Schwidefsky <schwidefsky-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, QingFeng Hao <haoqf-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, Jan 22, 2018 at 01:16:25PM +0000, Eugene Syromyatnikov wrote:
> On Sat, Jan 20, 2018 at 11:41 AM, Heiko Carstens
> <heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org> wrote:
> > If you now document the above people will start using the system call with
> > only one parameter which isn't backwards compatible.
> >
> > I'd rather add the second parameter again to the system call so that code
> > stays backwards compatible.
> 
> Well, it ought to be documented somehow, especially if the syscall
> parameter will be added back, as there could be situation where
> application gets successful return code for the call non-zero value of
> the second argument and gets no signals as it is the one of the kernel
> releases where this parameter was removed. I can update the patch to
> reflect this once the patch that returns the second argument reaches
> the kernel tree.

So, I think something like the below should be ok:

>From 6c7e2113c62fbb95662fba03f7fa298f4b737c1f Mon Sep 17 00:00:00 2001
From: Heiko Carstens <heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>
Date: Wed, 31 Jan 2018 08:15:31 +0100
Subject: [PATCH] s390_runtime_instr.2: document signum argument behavior
 change

Document that the signum argument is ignored in newer kernels, but
that user space should pass a valid real-time signal number for
backwards compatibility.

Signed-off-by: Heiko Carstens <heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>
---
 man2/s390_runtime_instr.2 | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/man2/s390_runtime_instr.2 b/man2/s390_runtime_instr.2
index 18c2c0763eed..d5790e10f222 100644
--- a/man2/s390_runtime_instr.2
+++ b/man2/s390_runtime_instr.2
@@ -47,10 +47,9 @@ argument controls whether run-time instrumentation is started
 .PP
 The
 .IR signum
-argument specifies the number of a real-time signal.
-The real-time signal is sent to the thread if the run-time instrumentation
-buffer is full or if the run-time-instrumentation-halted interrupt
-occurred.
+argument specifies the number of a real-time signal. This argument has no
+effect, since support for signalling was never used and kernel support was
+removed.
 .SH RETURN VALUE
 On success,
 .BR s390_runtime_instr ()
@@ -67,9 +66,16 @@ is set to one of the error codes listed below.
 .B EINVAL
 The value specified in
 .IR command
-is not a valid command or the value specified in
+is not a valid command.
+.TP
+.B EINVAL
+The value specified in
 .IR signum
-is not a real-time signal number.
+is not a real-time signal number. With Linux 4.4 and newer kernel versions,
+the
+.IR signum
+argument has no effect, so that an invalid signal number will not result in an
+error.
 .TP
 .B ENOMEM
 Allocating memory for the run-time instrumentation control block failed.
@@ -85,6 +91,12 @@ The run-time instrumentation facility is available beginning with System z EC12.
 Glibc does not provide a wrapper for this system call, use
 .BR syscall (2)
 to call it.
+.PP
+Support for signalling was removed with Linux 4.4. With Linux 4.4
+also the check if
+.IR signum
+is a valid real-time signal was removed. For backwards compatibility with old
+kernels it is recommended to pass a valid real-time signal number.
 .SH SEE ALSO
 .BR syscall (2),
 .BR signal (7)
-- 
2.13.5

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

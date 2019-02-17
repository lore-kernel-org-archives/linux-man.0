From: =?UTF-8?Q?Niklas_Hamb=c3=bcchen?= <mail@nh2.me>
Subject: [PATCH] ptrace.2: Improve clarity for multi-threaded tracers
Date: Sun, 17 Feb 2019 17:34:46 +0100
Message-ID: <bfa474c6-5b13-652d-2fd8-16b2be7efb62@nh2.me>
References: <48bb7c89-abb9-1e88-fee3-fb42d4032d12@nh2.me>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <48bb7c89-abb9-1e88-fee3-fb42d4032d12@nh2.me>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: mtk.manpages@gmail.com
Cc: linux-kernel@vger.kernel.org, cleverca22@gmail.com, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

Until now, the man page said:

    Attachment and subsequent commands are per thread:
    in a multi‐ threaded process, every thread can be individually attached to a
    (potentially different) tracer, or left not attached and thus not debugged.
    Therefore, "tracee" always means "(one) thread", never "a (possibly
    multithreaded) process".

While the first sentence "Attachment ... [is] per thread" might be interpreted
as holding for both tracer and tracee, the rest talks only about the
multi-threadedness of the *tracee*, leaving some uncertainty in the reader on
whether the tracer may issue `ptrace()` from different threads.

This patch adds more explicitness, removing any doubt.

Relevant resources:

* LKML thread https://marc.info/?l=linux-kernel&m=155036848808748&w=2
  "ptrace() with multithreaded tracer"
  where I asked about this behaviour, in case anybody disagrees with my
  understanding
* https://stackoverflow.com/questions/18737866/can-a-thread-trace-a-process/
  where the previous ambiguity of the man page confused some users, and where
  and example program is given that confirms the behaviour I mention in this
  patch
* A program of mine, in which I have independently confirmed that using
  `ptrace()` from a thread that's not the tracer thread (a sibling thread in
  the process is the tracer instead) results in `ESRCH`
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/kernel/ptrace.c?id=96d4f267e40f9509e8a66e2b39e8b95655617693#n207
  where the comment on `ptrace_check_attach()` talks about `%current`, which
  is a thread

Signed-off-by: Niklas Hambüchen <mail@nh2.me>
---
 man2/ptrace.2 | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/man2/ptrace.2 b/man2/ptrace.2
index 3b6b6ea84..4058abe94 100644
--- a/man2/ptrace.2
+++ b/man2/ptrace.2
@@ -122,12 +122,18 @@ It is primarily used to implement breakpoint debugging and system
 call tracing.
 .PP
 A tracee first needs to be attached to the tracer.
-Attachment and subsequent commands are per thread:
-in a multithreaded process,
+Attachment and subsequent commands are per thread,
+on both the tracer and tracee side.
+Issuing a tracing command from a thread that is not the tracer of the given
+.I pid
+will result in an
+.B ESRCH
+error.
+In a multithreaded process to be traced,
 every thread can be individually attached to a
 (potentially different) tracer,
 or left not attached and thus not debugged.
-Therefore, "tracee" always means "(one) thread",
+Therefore, "tracer" or "tracee" always mean "(one) thread",
 never "a (possibly multithreaded) process".
 Ptrace commands are always sent to
 a specific tracee using a call of the form
@@ -2259,7 +2265,7 @@ or (on kernels before 2.6.26) be
 .TP
 .B ESRCH
 The specified process does not exist, or is not currently being traced
-by the caller, or is not stopped
+by the calling thread, or is not stopped
 (for requests that require a stopped tracee).
 .SH CONFORMING TO
 SVr4, 4.3BSD.
--
2.17.1

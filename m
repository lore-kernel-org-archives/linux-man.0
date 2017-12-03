From: Keno Fischer <keno@juliacomputing.com>
Subject: [PATCH RFC] stat.2: Document that stat can fail with EINTR
Date: Sat, 2 Dec 2017 19:23:59 -0500
Message-ID: <20171203002359.GA17037@juliacomputing.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: linux-man@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk, mtk.manpages@gmail.com, tuomas@tuxera.com
List-Id: linux-man@vger.kernel.org

Particularly on network file systems, a stat call may require
submitting a message over the network and waiting interruptably
for a reply.

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
---

The catalyst for this patch was me experiencing EINTR errors when
using the 9p file system. In linux commit 9523feac, the 9p file
system was changed to use wait_event_killable instead of
wait_event_interruptible, which does indeed address my problem,
but also makes me a bit unhappy, because uninterruptable waits
prevents things like ^C'ing the execution and some debugging
tools which depend on being able to cancel long-running operations
by sending signals. I'd like to ask the user space applications I
care about to properly handle such situations (either by using
SA_RESTART or by explicitly handling EINTR), but it's a bit of a
hard sell if EINTR isn't documented to be a possibility. I'm hoping
this doc PATCH will generate a discussion of whether EINTR is an
appropriate thing for stat (as a stand in for a file system call that's
not read/write) to return. If so, I'd be happy to submit
patches to other file system-related syscalls along these same lines.

I realize I'm probably 20 years too late here, but it feels like
clarificaion on what to expect from the kernel would still go a long
way here.  

 man2/stat.2 | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/man2/stat.2 b/man2/stat.2
index dad9a01..f10235a 100644
--- a/man2/stat.2
+++ b/man2/stat.2
@@ -452,6 +452,11 @@ Invalid flag specified in
 is relative and
 .I dirfd
 is a file descriptor referring to a file other than a directory.
+.TP
+.B EINTR
+The call was interrupted by delivery of a signal caught by a handler; see
+.BR signal (7).
+The possibility of this error is file-system dependent.
 .SH VERSIONS
 .BR fstatat ()
 was added to Linux in kernel 2.6.16;
-- 
2.8.1

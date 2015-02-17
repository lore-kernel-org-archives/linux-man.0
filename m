From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] futex.2: do not reference futex.7 semantics
Date: Tue, 17 Feb 2015 15:06:30 +0100
Message-ID: <1424181990-13202-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The futex.2 system call makes no assumption about the meaning
of the values of a futex.
It may check if the value changes.

The current futex.7 speaks of incrementing and decrementing
a futex. That choice is arbitrary and unwise as overflows may
occur.

If special considerations for the usage of futex.2 have to be made
in a futex.7 example, this should be explained in futex.7

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man2/futex.2 | 33 +--------------------------------
 1 file changed, 1 insertion(+), 32 deletions(-)

diff --git a/man2/futex.2 b/man2/futex.2
index 6c02da7..0ea7db2 100644
--- a/man2/futex.2
+++ b/man2/futex.2
@@ -68,16 +68,6 @@ When a futex operation did not finish uncontended in user space, a
 call needs to be made to the kernel to arbitrate.
 Arbitration can either mean putting the caller
 to sleep or, conversely, waking a waiting process or thread.
-.PP
-Callers of
-.BR futex ()
-are expected to adhere to the semantics described in
-.BR futex (7).
-As these semantics involve writing nonportable assembly instructions
-(see the example library referred to in SEE ALSO),
-this in turn probably means that most users will in fact be
-library authors and not general application developers.
-.\"
 .SS Arguments
 The
 .I uaddr
@@ -229,18 +219,6 @@ The arguments
 and
 .I val3
 are ignored.
-
-For
-.BR futex (7),
-this call is executed if decrementing the count gave a negative value
-(indicating contention),
-and will sleep until another process or thread releases
-the futex and executes the
-.B FUTEX_WAKE
-operation.
-.\"
-.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
-.\"
 .TP
 .BR FUTEX_WAKE " (since Linux 2.6.0)"
 .\" Strictly speaking, since Linux 2.5.x
@@ -266,15 +244,6 @@ The arguments
 and
 .I val3
 are ignored.

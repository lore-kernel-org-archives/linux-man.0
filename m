From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] getrandom.2: rework paragraphs marked with FIXME
Date: Thu, 22 Jan 2015 20:30:46 +0100
Message-ID: <1421955046-8296-1-git-send-email-xypron.glpk@gmx.de>
References: <CAKgNAkiQUXFZ82jDNqEPxpBmdkKOg03uQXg=iEuUNzg0rvgkZA@mail.gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkiQUXFZ82jDNqEPxpBmdkKOg03uQXg=iEuUNzg0rvgkZA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Theodore Ts'o <tytso-3s7WtUTddSA@public.gmane.org>, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The patch clarifies when blocking may occur while calling
getrandom().

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man2/getrandom.2 | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/man2/getrandom.2 b/man2/getrandom.2
index d01502e..cfbbf5f 100644
--- a/man2/getrandom.2
+++ b/man2/getrandom.2
@@ -55,20 +55,17 @@ Therefore
 should not be used for Monte Carlo simulations or other
 programs/algorithms which are doing probabilistic sampling.
 
-.\" FIXME is the following paragraph correct?
 By default,
 .BR getrandom ()
 draws entropy from the
 .IR /dev/urandom
-pool, and, if that pool has been initialized and
-.IR buflen
-is less than or equal to 256 (see NOTES, below),
-then the call never blocks when drawing from that pool
-and always returns the number of bytes requested in
-.IR buflen .
+pool.
 This behavior can be changed via the
 .I flags
 argument.
+If the
+.IR /dev/urandom
+pool has been initialized, reading from that pool never blocks.
 
 The
 .I flags
@@ -157,17 +154,27 @@ was introduced in version 3.17 of the Linux kernel.
 This system call is Linux-specific.
 .SH NOTES
 .SS Interruption by a signal handler
-.\" FIXME Here, I think there needs to be an opening paragraph that describes
-.\" the cases where getrandom() can block. This should cover the cases with
-.\" GRND_RANDOM and without GRND_RANDOM. Reading the existing page, I am
-.\" still not completely confident that I know what the cases are.
+A call to
+.BR getrandom ()
+can only block when called without the
+.B GRND_NONBLOCK
+flag.
+When reading from
+.I /dev/urandom
+.RB ( GRND_RANDOM
+is not set)
+blocking only occurs if the entropy pool has not been initialized yet.
+When reading from
+.I /dev/random
+.RB ( GRND_RANDOM
+is set)
+blocking occurs if not enough random bytes are available.
+
 The reaction of
 .BR getrandom ()
 in case of an interruption of a blocking call by a signal
 when reading from
 .I /dev/urandom
-.RB ( GRND_RANDOM
-is not set)
 depends on the initialization state of the entropy buffer
 and on the request size
 .IR buflen .
@@ -184,8 +191,6 @@ Instead, it will return all of the bytes that have been requested.
 .PP
 When reading from
 .I /dev/random
-.RB ( GRND_RANDOM
-is set)
 these guarantees do
 .I not
 apply.
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

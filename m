From: Colin Watson <cjwatson-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: execve signal reset
Date: Tue, 5 Jan 2010 14:21:36 +0000
Message-ID: <20100105142136.GI5847@riva.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Using man-pages 3.23 on Ubuntu lucid, I recently had cause to look up
what happens to signal handlers across execve(). The execve(2) manual
page contains the following sentence:

  The dispositions of any signals that are being caught are reset to
  being ignored.

As it happened, though, the signal I'm interested in right now defaults
to "terminate process", so I found this statement ambiguous, and looked
up POSIX, which says "Signals set to be caught by the calling process
image shall be set to the default action in the new process image".

How about the following patch?

diff --git a/man2/execve.2 b/man2/execve.2
index 0ea50db..11bec18 100644
--- a/man2/execve.2
+++ b/man2/execve.2
@@ -120,7 +120,8 @@ All process attributes are preserved during an
 except the following:
 .IP *
 The dispositions of any signals that are being caught are
-reset to being ignored.
+reset to the default action
+.RB ( signal (7)).
 .IP *
 Any alternate signal stack is not preserved
 .RB ( sigaltstack (2)).

Thanks,

-- 
Colin Watson                                       [cjwatson-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org]
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

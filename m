From: Peter LaDow <petela-OhJBICGVGq3cUClb0tpMAg@public.gmane.org>
Subject: [PATCH] execve: Add envp to the Linux notes about NULL pointers
Date: Thu, 13 Jun 2013 11:37:28 -0700
Message-ID: <CAN8Q1EdfNEyYMoMwu95ROZOCLg6t7ncQudqpV5c02n7H-073mA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is my first patch submission.  I've tried to follow the
directions found at https://www.kernel.org/doc/man-pages/patches.html,
but if I've screwed things up, please let me know.

During the review of static analysis results, we discovered a
functional, but non-portable, use of execve().  For example:

  char *cmd[] = { "/path/to/some/file", NULL };
  execve(cmd[0], cmd, NULL);

The call succeeds.  Yet, the static analysis tool (rightly) pointed
out that envp could be dereferenced.  But digging into glibc and the
kernel, it appears that like argv, envp when NULL is treated as if it
were an empty list.

So, to clear things up, I'm submitting this patch to update the man
page to indicate that envp is treated like argv.

I generated the below patch from git after pulling the latest.  I hope
there is sufficient information in the patch.

Thanks,
Pete

>From c2822b3ba5ef8769eed683e4856247274e016ea5 Mon Sep 17 00:00:00 2001
---
 man2/execve.2 | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/man2/execve.2 b/man2/execve.2
index cc91bff..a0b48fc 100644
--- a/man2/execve.2
+++ b/man2/execve.2
@@ -494,10 +494,12 @@ and white spaces in
 .I optional-arg
 are used to delimit the arguments.

-On Linux,
+On Linux, either
 .I argv
+or
+.I envp
 can be specified as NULL,
-which has the same effect as specifying this argument
+which has the same effect as specifying these arguments
 as a pointer to a list containing a single NULL pointer.
 .B "Do not take advantage of this misfeature!"
 It is nonstandard and nonportable:
--
1.8.3.1
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

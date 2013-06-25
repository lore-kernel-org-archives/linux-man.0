From: Peter LaDow <petela-OhJBICGVGq3cUClb0tpMAg@public.gmane.org>
Subject: [PATCH] execve.2: Add envp to the Linux notes about NULL pointers
Date: Tue, 25 Jun 2013 12:11:28 -0700
Message-ID: <CAN8Q1EeVd97caoWgRQeN-2HB9o1B5693ntkNLCZv7_biaAo3nw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is a resubmission of an earlier patch to execve.2.  I don't know
if the previous patch was considered (I never received any feedback),
but I notice I did not format the subject quite right.  Similar
changes to the glibc documentation were rejected since it describes
the API, not the system specific operation.  But given the execve.2
manpage does coverage Linux specific notes, this patch adds detail
about the treatment of a NULL envp.

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

I generated the below patch from git after pulling the latest.  I
hopethere is sufficient information in the patch.

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

From: "Dr. Tobias Quathamer" <toddy-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] lirc.4: srcfix
Date: Wed, 16 Mar 2016 20:15:31 +0100
Message-ID: <1458155731-10057-1-git-send-email-toddy@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael,

I'm using a script to collect authors and licensing
information for the various manpages. Currently, the
script cannot extract meaningful information from
lirc.4, because it relies on the information being
present before the ".TH" macro.

Would you consider this patch? Otherwise, I'll have
to make the script more robust ... :-)

Regards,
Tobias

---
 man4/lirc.4 | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/man4/lirc.4 b/man4/lirc.4
index c63a3f4..90d31e1 100644
--- a/man4/lirc.4
+++ b/man4/lirc.4
@@ -1,6 +1,3 @@
-.TH LIRC 4 "Aug 2015" "Linux" "Linux Programmer's Manual"
-

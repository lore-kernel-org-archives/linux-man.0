From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] namespaces(7): minor tweaks
Date: Sun,  2 Nov 2014 14:23:55 -0500
Message-ID: <1414956235-26135-1-git-send-email-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man7/namespaces.7 | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/man7/namespaces.7 b/man7/namespaces.7
index d14d258..0eeaf89 100644
--- a/man7/namespaces.7
+++ b/man7/namespaces.7
@@ -36,7 +36,6 @@ that are members of the namespace, but are invisible to other processes.
 One use of namespaces is to implement containers.
 
 Linux provides the following namespaces:

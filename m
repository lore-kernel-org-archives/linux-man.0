From: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Adding SO_MARK for socket(7)
Date: Sat, 30 Jun 2012 09:19:37 +0200
Message-ID: <4FEEA889.1080602@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050809040906030600020106"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------050809040906030600020106
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

In attachment a patch which adds a section on SO_MARK in man 7 socket, 
this was already marked in the todo of the page and has a bugzilla entry 
( https://bugzilla.kernel.org/show_bug.cgi?id=16461 ) which can be 
closed as well.

my 2 cents
E.
-- 
Elie De Brauwer


--------------050809040906030600020106
Content-Type: text/x-patch;
 name="0001-Added-entry-for-SO_MARK-fixes-bug-16461.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-Added-entry-for-SO_MARK-fixes-bug-16461.patch"

>From b350b4f4e368c001f98604f346eb8685eb180649 Mon Sep 17 00:00:00 2001
From: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Sat, 30 Jun 2012 09:15:00 +0200
Subject: [PATCH] Added entry for SO_MARK, fixes bug 16461


Signed-off-by: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man7/socket.7 |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man7/socket.7 b/man7/socket.7
index a0e186a..ee282f3 100644
--- a/man7/socket.7
+++ b/man7/socket.7
@@ -19,7 +19,6 @@
 .\" The following are not yet documented:
 .\"	SO_PEERNAME
 .\"	SO_TIMESTAMPNS
-.\"	SO_MARK (see https://bugzilla.kernel.org/show_bug.cgi?id=16461)
 .\"	SO_TIMESTAMPING (2.6.30)
 .\"	SO_RXQ_OVFL (2.6.33)
 .\"
@@ -320,6 +319,12 @@ When the socket is closed as part of
 .BR exit (2),
 it always lingers in the background.
 .TP
+.B SO_MARK " (since Linux 2.6.25)"
+Allows the specification of a mark which gets set on all outgoing
+messages (similar as the netfilter MARK target. This requires the
+.B CAP_NET_ADMIN
+capability.
+.TP
 .B SO_OOBINLINE
 If this option is enabled,
 out-of-band data is directly placed into the receive data stream.
-- 
1.7.10


--------------050809040906030600020106--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [patch] set_mempolicy.2: wfix
Date: Wed, 23 Apr 2014 13:58:43 +0200
Message-ID: <5357AAF3.2010200@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030707060804040401050507"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------030707060804040401050507
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michael,

sending minor wording fix for set_mempolicy(2) man page.

peter


--------------030707060804040401050507
Content-Type: text/x-patch;
 name="set_mempolicy.2.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="set_mempolicy.2.patch"

diff --git a/man2/set_mempolicy.2 b/man2/set_mempolicy.2
index f891cc4..843208c 100644
--- a/man2/set_mempolicy.2
+++ b/man2/set_mempolicy.2
@@ -99,7 +99,7 @@ are:
 A nonempty
 .I nodemask
 specifies physical node ids.
-Linux does will not remap the
+Linux will not remap the
 .I nodemask
 when the process moves to a different cpuset context,
 nor when the set of nodes allowed by the process's

--------------030707060804040401050507--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

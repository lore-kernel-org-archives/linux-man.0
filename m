From: FeRD <ferdnyc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] initrd.4: "normal root file" should read "...file system"
 in one location
Date: Fri, 03 Apr 2009 04:33:23 -0400
Message-ID: <49D5C9D3.9020900@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is admittedly minor, and pretty obvious contextually, but for 
correctness' sake....

Item 7 of the "Boot-Up Operation" listing discusses, "If the normal root 
file has directory /initrd..." -- this should clearly read "file 
system". Patch against the latest git sources follows.

-FeRD (Frank Dana)

diff --git a/man4/initrd.4 b/man4/initrd.4
index 47bd46e..b9980e0 100644
--- a/man4/initrd.4
+++ b/man4/initrd.4
@@ -142,7 +142,7 @@ file-system, then the behavior of the kernel is
 .BR UNSPECIFIED .
 See the NOTES section for the current kernel behavior.)
 .IP 7.
-If the normal root file has directory
+If the normal root file system has directory
 .IR /initrd ,
 device
 .I /dev/ram0


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Chris =?UTF-8?Q?=22=E3=82=AF=22?= Heath <chris-FSXMH2gLahXJKwlM9GxbOw@public.gmane.org>
Subject: Typo in sigprocmask(2)
Date: Wed, 19 Nov 2008 10:12:42 -0500
Message-ID: <1227107562.22091.7.camel@linux.heathens.co.nz>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Michael,

Here's a patch for a small typo I noticed.

Chris


diff --git a/man2/sigprocmask.2 b/man2/sigprocmask.2
index 524f3d3..e0b4a7b 100644
--- a/man2/sigprocmask.2
+++ b/man2/sigprocmask.2
@@ -82,7 +82,7 @@ is NULL, then the signal mask is unchanged (i.e.,
 is ignored),
 but the current value of the signal mask is nevertheless returned in
 .I oldset
-(it is not NULL).
+(if it is not NULL).
 
 The use of
 .BR sigprocmask ()


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

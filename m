From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [PATCH] small fix for uri.7
Date: Tue, 14 May 2013 18:52:50 +0400
Message-ID: <20130514185250.2dde706c@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello.

--- uri.7       2013-05-14 18:49:15.582908969 +0400
+++ uri-new.7   2013-05-14 18:50:06.158906925 +0400
@@ -268,7 +268,7 @@
 .PP
 This represents a file or directory accessible locally.
 As a special case,
-.I host
+.I ip_server
 can be the string "localhost" or the empty
 string; this is interpreted as "the machine from which the URL is
 being interpreted".

-- 
Best Regards,
Yuri Kozlov

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

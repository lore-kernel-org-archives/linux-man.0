From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: small typo in the proc.5 (+ to mail list)
Date: Sat, 1 May 2010 21:17:25 +0400
Message-ID: <20100501211725.14934451@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello.

--- proc.5      2010-03-26 17:46:41.000000000 +0300
+++ /tmp/proc.5 2010-05-01 12:58:03.000000000 +0400
@@ -633,7 +633,7 @@
 The controlling terminal of the process.
 (The minor device number is contained in the combination of bits
 31 to 20 and 7 to 0;
-the major device number is in bits 15 t0 8.)
+the major device number is in bits 15 to 8.)
 .TP
 \fItpgid\fP %d
 .\" This field and following, up to and including wchan added 0.99.1


-- 
Best Regards,
Yuri Kozlov

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

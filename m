From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [PATCH] small improvement for tcp.7
Date: Sat, 1 Feb 2014 18:54:59 +0400
Message-ID: <20140201185459.14c29a9b@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello.

 .IR "unsigned int"
 as an argument.
 When the value is greater than 0,
-it specifies the maximum amount of time in imilliseconds that transmitted
+it specifies the maximum amount of time in milliseconds that transmitted
 data may remain unacknowledged before TCP will forcibly close the
 corresponding connection and return
 .B ETIMEDOUT
@@ -1040,7 +1040,7 @@ Increasing user timeouts allows a TCP connection to survive e$
 periods without end-to-end connectivity.
 Decreasing user timeouts
 allows applications to "fail fast", if so desired.
-Otherwise, failure may take upto 20 minutes with
+Otherwise, failure may take up to 20 minutes with
 the current system defaults in a normal WAN environment.


-- 
Best Regards,
Yuri Kozlov

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

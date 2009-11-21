From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: typo in getaddrinfo.3
Date: Sat, 21 Nov 2009 23:18:24 +0300
Message-ID: <20091121231824.1962ea8e@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello.

Like after .SS Server program

--- /srv/d1/repo/git/man-pages/man3/getaddrinfo.3       2009-11-15
12:30:46.000000000 +0300 +++ getaddrinfo.3       2009-11-21
18:31:38.000000000 +0300 @@ -713,7 +713,7 @@
 }
 .fi
 .SS Client program
-.R " "
+\&
 .nf
 #include <sys/types.h>
 #include <sys/socket.h>

-- 
Best Regards,
Yuri Kozlov

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

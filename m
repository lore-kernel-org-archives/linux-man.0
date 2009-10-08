From: "Andries E. Brouwer" <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>
Subject: typo in clone(2)
Date: Thu, 8 Oct 2009 20:58:10 +0200
Message-ID: <20091008185805.GA28839@mette>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--- clone.2     2009-10-08 20:56:13.000000000 +0200
+++ clone.2a    2009-10-08 20:56:35.000000000 +0200
@@ -786,7 +786,7 @@
 .IR ptid ,
 .IR tls ,
 and
-.IT ctid .
+.IR ctid .
 .SH "RETURN VALUE"
 .\" gettid(2) returns current->pid;
 .\" getpid(2) returns current->tgid;

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

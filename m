From: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] minor formatting error in quotactl.2
Date: Wed, 16 Jun 2010 22:01:11 +0200
Message-ID: <AANLkTinJChI74JCJ5D3RahBo2mDGRbon9weyPUJPaOtn@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

 today's changes in man2/quotactl.2 introduced a minor formatting error:

--- a/man2/quotactl.2
+++ b/man2/quotactl.2
@@ -87,7 +87,7 @@ The
 .I subcmd
 value is one of the following:
 .TP 8
-.SB Q_QUOTAON
+.B Q_QUOTAON
 Turn on quotas for a file system.
 The
 .I id


Denis
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

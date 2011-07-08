From: =?iso-8859-2?q?K=F8i=B9tof_=AEelechovski?= <giecrilj-n4IAqcmFnHAX1+iMCFCb4w@public.gmane.org>
Subject: LC_MESSAGES is not C99
Date: Fri, 8 Jul 2011 12:02:38 +0200
Message-ID: <201107081202.42824.giecrilj@stegny.2a.pl>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Regarding setlocale(3): it should be noted that while setlocale itself is in C99, LC_MESSAGES is a POSIX extension.  This category should not be used in applications that claim to be portable outside POSIX, such as CGIC [1].

Best regards,
Chris

___
[1] <URL: http://www.boutell.com/cgic/ >
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Anders Thulin <anders.thulin-sdfhRxSboruzQB+pC5nmwQ@public.gmane.org>
Subject: Problem with sd(4) man page -- null reference to scsi(4)
Date: Thu, 30 Sep 2010 10:13:08 +0200
Message-ID: <4CA44694.9000609@sentor.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


  Noticed this in the Ubuntu 10.04 man pages (release 3.23, dated 1992-12-17), and it's also present
in the http://www.kernel.org/doc/man-pages/online/pages/man4/sd.4.html page.

  Just before the FILES section, the following text appears:
	
	The scsi(4) ioctl(2) operations are also supported.  If the ioctl(2)
	parameter is required, and it is NULL, then ioctl(2) will fail with the
	error EINVAL.

  However, there is no scsi(4) man page -- and the web page link produces a 404 web error.

  Looks like all those scsi(4) operations may be undocumented ...


  Additionally, I suspect (no more), that more of the ioctls available in <linux/hdreg.h>
are provided, than just HDIO_GETGEO mentioned on this page.

-- 
Anders Thulin      anders.thulin-sdfhRxSboruzQB+pC5nmwQ@public.gmane.org      070-757 36 10 / Intl. +46 70 757 36 10
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

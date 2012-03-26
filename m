From: Ricardo Catalinas =?iso-8859-1?Q?Jim=E9nez?=
	<jimenezrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Missing macro _SC_SYMLOOP_MAX in sysconf(3)
Date: Mon, 26 Mar 2012 11:11:29 +0200
Message-ID: <20120326091129.GA4683@viper.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

  In the man-page of sysconf(3), the macro SYMLOOP_MAX is listed but not
its symmetric _SC_SYMLOOP_MAX. At least in my Linux, in /usr/include
_SC_SYMLOOP_MAX is defined, so I think this could be a bug.


Best regards
-- 
Ricardo (http://r.untroubled.be/)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

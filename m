From: Jim Paris <jim-XrPbb/hENzg@public.gmane.org>
Subject: proc.5: meminfo fixes
Date: Thu, 15 Nov 2012 10:39:56 -0500
Message-ID: <20121115153955.GA18779@psychosis.jim.sh>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

In the /proc/meminfo section of proc.5:

- "Mlock" should be "Mlocked".

- "SwapFree" reports free swap space, but the manpage seems to be
  describing used swap space.

-jim
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: pacman-ptgZXYu0fikgsBAKwltoeQ@public.gmane.org
Subject: fixes for lockf.3
Date: Wed, 4 Jul 2012 19:50:09 -0500 (GMT+5)
Message-ID: <20120705005009.23975.qmail@kosh.dhis.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

In lockf(3), the description of EDEADLK says that it can occur with the
T_LOCK operation. That should be F_LOCK. The presence of the T makes it look
like maybe F_TLOCK was intended, but that would be wrong. Only the blocking
F_LOCK operation can cause EDEADLK.

Also, I was looking through Changes.old for the last few versions, and
noticed that fcntl.h was misspelled fntl.h a couple of times.

-- 
Alan Curry
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

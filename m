From: Alex Roper <aroper-63aXycvo3TyHXe+LvDLADg@public.gmane.org>
Subject: Possible typo in madvise(2)
Date: Thu, 27 Mar 2014 19:16:27 -0400
Message-ID: <5334B14B.7070409@umich.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Version: Current git repo

The first paragraph of DESCRIPTION states that madvise does not change
the semantics of an application except in the case of MADV_DONTNEED,
which I believe should read MADV_DONTFORK.

Thanks,
Alex
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

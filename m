From: starlight-Utvwg/EOxnhfq8cQ1yknNg@public.gmane.org
Subject: suggestion for improvement to vfork() man page
Date: Wed, 18 Jan 2012 22:16:28 -0500
Message-ID: <6.2.5.6.2.20120118221253.03aad598@binnacle.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Also I don't think it is unfortunate (or a bug)
that vfork() continues to exist in Linux aside
from the fact that the semantics differ from
other *nixes in subtle and potentially
confusing ways.

As implemented in Linux vfork() is quite useful
and with the aforementioned clarifications to
the documentation, worth retaining.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

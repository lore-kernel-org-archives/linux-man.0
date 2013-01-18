From: starlight.2013q1-Utvwg/EOxnhfq8cQ1yknNg@public.gmane.org
Subject: getxattr() errata
Date: Thu, 17 Jan 2013 23:16:34 -0500
Message-ID: <6.2.5.6.2.20130117231255.05e4dc38@binnacle.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

Just noticed that the getxattr() man page
says that ENOATTR is returned when an
extended attribute is not present.

http://man7.org/linux/man-pages/man2/getxattr.2.html

I believe the correct code for this
situation is ENODATA or 61.

   strace getcap /bin/bash

should confirm that.

Regards

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

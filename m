From: Eric Blake <ebb9-PGZyUNKar/Q@public.gmane.org>
Subject: symlinkat, unlinkat man page problem
Date: Tue, 08 Dec 2009 06:40:31 -0700
Message-ID: <4B1E574F.20805@byu.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Per POSIX and the system headers, symlinkat and unlinkat both live in
<unistd.h>, but:

http://www.kernel.org/doc/man-pages/online/pages/man2/symlinkat.2.html
claims <stdio.h>

http://www.kernel.org/doc/man-pages/online/pages/man2/unlinkat.2.html
claims <fcntl.h>

-- 
Don't work too hard, make some time for fun as well!

Eric Blake             ebb9-PGZyUNKar/Q@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

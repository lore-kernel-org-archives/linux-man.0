From: Rasmus Villemoes <Rasmus.Villemoes-RUss/tIHhir1P9xLtpHBDw@public.gmane.org>
Subject: mprotect(2)'s first argument is not const
Date: Mon, 9 Jul 2012 14:05:51 +0000
Message-ID: <0896F8203AB51141A0B652531431CACB8F8D33@smbx.decode.is>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Both my system's man-pages (3.22) and the latest online (3.41) shows 

  int mprotect(const void *addr, size_t len, int prot);

as the prototype for mprotect(2). However, POSIX [1] and the actual sys/mman.h (on all the systems I checked) do not have the const qualifier on the first argument.

[1] http://pubs.opengroup.org/onlinepubs/009604499/functions/mprotect.html--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

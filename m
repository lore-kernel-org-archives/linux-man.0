From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Some locale related updates
Date: Tue, 12 May 2015 16:57:27 +0300
Message-ID: <555206C7.8000308@redhat.com>
Reply-To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael,

I'll send some locale related updates shortly, most of them should be
pretty self-explanatory but I'll provide some references in few cases
and I'm sure you can come up with slightly better wording here and there.

Related to wording, I see that setlocale(3) states:

The locale "C" or "POSIX" is a portable locale; its LC_CTYPE part
corresponds to the 7-bit ASCII character set.

And
http://pubs.opengroup.org/onlinepubs/009695399/basedefs/xbd_chap07.html#tag_07_02
states:

The tables in Locale Definition describe the characteristics and
behavior of the POSIX locale for data consisting entirely of characters
from the portable character set and the control character set. For other
characters, the behavior is unspecified.

Do you think setlocale(3) is consistent with the above?

Thanks,

-- 
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: memcmp and strcmp man page duplication
Date: Fri, 23 Nov 2012 13:01:07 +0000
Message-ID: <CAGc9EverQ1Ak1_zDkzYXchpcgszzHdB8crtaQa_kgzAqVzHdJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello

http://man7.org/linux/man-pages/man3/memcmp.3.html

"DESCRIPTION" section contains a duplicate description of the "RETURN
VALUE" section. My suggestion would be to ask if the "DESCRIPTION"
section should be reduced.

http://man7.org/linux/man-pages/man3/strcmp.3.html
^ Also same duplication.


Pages that are fine:
http://man7.org/linux/man-pages/man3/wmemcmp.3.html
http://man7.org/linux/man-pages/man3/wcsncmp.3.html
http://man7.org/linux/man-pages/man3/wcscmp.3.html


Secondary feedback is that I found the return value description a
little wordy. Would be clearer to simply say:
"
<0: less than n bytes of s2 matched
 0: n bytes of s1 and s2 are matched.
>0: s1 is greater than the first n bytes of s2
"


Best regards, Jon
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

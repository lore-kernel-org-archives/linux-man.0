From: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: linux strlen man page accepts NULL?
Date: Fri, 7 Aug 2009 12:55:35 +0100
Message-ID: <19ac3f7a0908070455s33ecb5efo6810eb7959df1f70@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Looking at this man page:

http://linux.die.net/man/3/strlen

Should it not mention that a NULL address is a valid param? Or is it
not a valid param? On most systems NULL is a special error pointer.

Cheers, Jon
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

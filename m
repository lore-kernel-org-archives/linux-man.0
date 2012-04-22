From: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: errno man page query
Date: Sun, 22 Apr 2012 12:17:22 +0100
Message-ID: <4F93E8C2.5000903@jguk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello

Quoting from this page:

http://man7.org/linux/man-pages/man3/errno.3.html

"a function that succeeds is allowed to change errno."

^ This sounds clear, e.g. open() can change errno to 0, when it returns 
a valid fd handle.


"Valid error numbers are all nonzero; errno is never set to zero by any 
system
        call or library function."

^ This seems to be counter what the earlier line said. Therefore, open() 
wouldn't be allowed to change errno to 0.

Have I missed something?

Best regards, Jon
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

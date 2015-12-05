From: Jonny Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: dlerror.3 query
Date: Sat, 5 Dec 2015 12:59:41 +0000
Message-ID: <5662DFBD.1090009@jguk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello

Quoting from:
http://man7.org/linux/man-pages/man3/dlerror.3.html

"The dlerror() function returns a human-readable string describing the
most recent error that occurred from a call to one of the functions
in the dlopen API since the last call to dlerror().  The returned
string does not include a trailing newline."

My feeling is that this should say the string is null-terminated. Also I 
think it doesn't need to say it "does not include a trailing newline" - 
never seen that mentioned before, so probably no one would think it might.

Regards, Jonny
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

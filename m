From: Christian Seiler <christian-+GPkE3DhqnY@public.gmane.org>
Subject: typo in capabilities(7) man page
Date: Tue, 13 Jan 2015 19:12:46 +0100
Message-ID: <ee0727efea7a018dd84444dd9342ba7c@iwakd.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Dear Maintainers,

I have found a small typo in capabilities(7). As per instructions[1],
I'm reporting it directly via email.

Under the capability CAP_SYS_ADMIN it says that you need it if you
want to

  'forge UID when passing socket credentials;'

This should read instead:

  'forge PID when passing socket credentials;'

Rationale:

UID/GID are governed by CAP_SET[UG]ID instead (which is already
correctly mentioned in the man page), only PID requires CAP_SYS_ADMIN.

The check in the kernel source can be found in:
<https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/net/core/scm.c#n47>

Thanks!

Christian

[1] <https://www.kernel.org/doc/man-pages/reporting_bugs.html>

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: "Ersek, Laszlo" <lacos-hjAHdpL4VZo5Z0SDYBDJZg@public.gmane.org>
Subject: write(2) / SIGXFSZ
Date: Thu, 4 Mar 2010 01:14:08 +0100 (CET)
Message-ID: <Pine.LNX.4.64.1003040040220.6496@login01.caesar.elte.hu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk / Linux man-pages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

we were having a discussion in the comp.unix.programmer Usenet newsgroup, 
starting with Message-ID: 
<e8e1cb1d-9693-4803-bf29-b4828de384e0-nbjlO0B5Z98wq+9lhVFwFGB/v6IoIuQBVpNB7YpNyf8@public.gmane.org>. 
Consequently, I'd like to report two bugs (in separate e-mails):

(1/2) write(2) does not mention SIGXFSZ, even though Linux (the kernel) 
does generate SIGXFSZ for the thread calling write(), when appropriate.

SUSv[234] links for write(2):

http://www.opengroup.org/onlinepubs/007908775/xsh/write.html
http://www.opengroup.org/onlinepubs/000095399/functions/write.html
http://www.opengroup.org/onlinepubs/9699919799/functions/write.html

I'm using the manpages-dev package, version 3.05-1, under Debian Lenny. 
However, before sending this report, I've verified the bug's existence in 
the online page under

http://www.kernel.org/doc/man-pages/online/pages/man2/write.2.html

If this goes anywhere on linux-man@vger, please keep me CC'd.

Thank you very much,
lacos
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

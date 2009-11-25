From: =?GB2312?B?y++9qLjV?= <sunjiangangok-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: The error of "getpwuid"
Date: Wed, 25 Nov 2009 13:44:52 +0800
Message-ID: <bdf46e580911242144s733020bamd6816a7853887ccb@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

I have found an spelling error of "getpwuid" which is in the section 3
of man-pages.
The error is in the last third line of EXAMPLE in "getpwuid",
the primary is
 printf("Name: %s; UID: %ld0, pwd.pw_gecos, (long) pwd.pw_uid);
but it is wrong.The right is
 printf("Name: %s; UID: %ld", pwd.pw_gecos, (long) pwd.pw_uid);
should change "0" to quotation mark("), not "0".
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

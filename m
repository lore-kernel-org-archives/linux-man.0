From: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: null terminating byte man pages
Date: Thu, 25 Apr 2013 14:07:21 +0100
Message-ID: <CAGc9Evdt3W-OtH3B5xyWPtuLkVMuob2rK2_QWhqV_+Ev0S67LA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello

readdir (3) man page says:
"the terminating null byte"

Could it be updated to follow "man strlen" page and say:

"the terminating null byte ('\0')"

Other pages only say "null byte", e.g. getdomainname
http://man7.org/linux/man-pages/man2/setdomainname.2.html

Should they all be changed to clarify?

others: gethostname, readlink, stat, argz_add, asprintf, catgets,
confstr, getcwd, getline,
getlogin, memchr, pthread_setname_np, strerror, strfmon, strftime,
sysconf, inotify,

wprintf - should also say ('\0') ?

Thank you for looking into this
Best regards, Jon
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

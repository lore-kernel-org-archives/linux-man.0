From: Kevin Lyda <kevin-lVvlXWpnww44d9/VWYMlNA@public.gmane.org>
Subject: unlink(2) can return ENOSPC
Date: Sat, 22 Jun 2013 22:21:57 +0100
Message-ID: <CADJ56BTFpBzijGr3BA+9pSW_7P4R3tLu8MRE0-XnnMk9wLvFjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Filesystems like btrfs and zfs have certain scenarios where unlink(2)
can return ENOSPC. This can be rather surprising.

It's usually caused by snapshots consuming all space on the underlying
fs (though the docs on btrfs weren't clear and there was a lot of code
to trace).

Anyway, it's not covered in the unlink(2) man page and when you get an
error like that it's kind of unexpected for someone with a lot of Unix
experience.

Kevin

--
Kevin Lyda
Galway, Ireland
US Citizen overseas? We can vote.
Register now: http://www.votefromabroad.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: "Anatoli Klassen" <anatoli-onJMq2Hob96sTnJN9+BGXg@public.gmane.org>
Subject: Typos in inotify(7)
Date: Mon, 17 Sep 2012 15:19:03 +0200
Message-ID: <7ad784199184e8c7ace3a5a50bd16a6c.squirrel@control.26th.net>
Mime-Version: 1.0
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

there are two typos in actual (online) version of inotify(7):

cookie is a unique integer that connects related events.  Currently this
is only used for rename events, and allows the resulting pair of
IN_MOVE_FROM
and IN_MOVE_TO events to be connected by the application.  For all other
event types, cookie is set to 0.

It should be IN_MOVED_FROM and IN_MOVED_TO.

Regards,
Anatoli Klassen


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Typos in inotify(7)
Date: Sun, 23 Sep 2012 16:08:35 +0200
Message-ID: <CAKgNAkj5nZHmKBTVmb9Zj-m_VqN=+K8a6XApXwjSAJnQERoQCQ@mail.gmail.com>
References: <7ad784199184e8c7ace3a5a50bd16a6c.squirrel@control.26th.net>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7ad784199184e8c7ace3a5a50bd16a6c.squirrel-0ZXR/GfGkoX5c4ML5NIMpw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anatoli Klassen <anatoli-onJMq2Hob96sTnJN9+BGXg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Sep 17, 2012 at 3:19 PM, Anatoli Klassen <anatoli-onJMq2Hob96sTnJN9+BGXg@public.gmane.org> wrote:
> Hi,
>
> there are two typos in actual (online) version of inotify(7):
>
> cookie is a unique integer that connects related events.  Currently this
> is only used for rename events, and allows the resulting pair of
> IN_MOVE_FROM
> and IN_MOVE_TO events to be connected by the application.  For all other
> event types, cookie is set to 0.
>
> It should be IN_MOVED_FROM and IN_MOVED_TO.

Thanks, Anatoli. Fixed for the next release.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Johannes Laire <johannes-Dl1KTzG68bE@public.gmane.org>
Subject: Typo in memchr(3)
Date: Mon, 15 Aug 2011 10:39:35 +0300
Message-ID: <CAM2GC0CrzxG9hT9ACF6gHnjQwdgrJjid0kW1wZ3VWmDOOT_tpQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

memchr(3)
> If the character c is not in the string s, then rawmemchr() may proceed to
> search beyond the end of the string, and the result is unspecified. The
> folowing call is a fast means of locating a string's terminating null byte:

The word "folowing" needs a second "l". Also, "undefined" instead of
"unspecified" would be more in line with common C usage.

-- 
Johannes Laire
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

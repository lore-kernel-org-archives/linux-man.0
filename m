From: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Subject: RFC: Bug 60749 - Do not need to link against -lm for fabs*()
Date: Fri, 13 Sep 2013 18:46:18 +0200
Message-ID: <5233415A.90506@bfs.de>
Reply-To: wharms-fPG8STNUNVg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

hi list,
i was investigating this and the good news it that you still need a libm.
On the other side the reporter is right he does not need to specify that.
Obviously this depends on the linker script used.

The math man pages say: "Link with -lm".
Perhaps it is better to say 'You may need to Link with -lm".

any comments on that ?

re,
 wh
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

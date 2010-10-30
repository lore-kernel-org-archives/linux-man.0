From: Alexey Dobriyan <adobriyan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] clone.2: remove forward reference to 2.6.28
Date: Sat, 30 Oct 2010 15:19:51 +0300
Message-ID: <20101030121951.GA17323@core2.telecom.by>
References: <1287105955-32499-1-git-send-email-lucian.grijincu@gmail.com>
 <1287105955-32499-2-git-send-email-lucian.grijincu@gmail.com>
 <AANLkTik4kzXOTyeiYauMSri0xJVPamK4_RwxuJs9+Ufc@mail.gmail.com>
 <AANLkTi=QfA_h_U6A_W7TbYNXh2v2xnkbgLjVKRTJMX0X@mail.gmail.com>
 <AANLkTikgTd=onzd1rMkqfB8mcBhv+8ZA1xqV9MDG4_iB@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTikgTd=onzd1rMkqfB8mcBhv+8ZA1xqV9MDG4_iB-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Lucian Adrian Grijincu <lucian.grijincu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Emelyanov <xemul-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>, "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sat, Oct 30, 2010 at 08:11:28AM +0200, Michael Kerrisk wrote:
> by which kernel version did the CLONE_NEWNET implementation become complete?
> We suppose it is 2.6.29, but it would be good to have confirmation

In my book, this is 2.6.33 where netns XFRM became usable. :-)

commit d7c7544c3d5f59033d1bf3236bc7b289f5f26b75
Author: Alexey Dobriyan <adobriyan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date:   Sun Jan 24 22:47:53 2010 -0800

    netns xfrm: deal with dst entries in netns
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

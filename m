From: Mehdi Aqadjani Memar <m.aqadjanimemar-oe7qfRrRQfcprfpi5Sxi9A@public.gmane.org>
Subject: man page mlock/munlock
Date: Wed, 6 May 2015 10:49:16 +0200
Message-ID: <87k2wm84eo.fsf@student.vu.nl>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Dear Michael Kerrisk,
in my application I am using munlock() as described in the man page. munlock()
fails and returns ENOMEM. The man page for this error has not helped me to find
out what the problem was. I traced my code and discovered that this error
appears when "the process's maximum number of mappings would have been
exceeded", as it is mentioned at the man page of mmap(). This happens because
munlock() splits the vma's.
I believe that this information should be a part of the man page of munlock().
-- 
Met vriendelijke groet/Kind regards
Mehdi Aqadjani Memar
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

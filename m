From: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: posix_memalign
Date: Tue, 3 Sep 2013 18:32:33 +0100
Message-ID: <CAGc9EvdXthzgBYEV=zpq+POQypCN_ePs0g3tksz6jC71zBDr+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello

I have a proposal to change the description on this page to be clearer:
http://man7.org/linux/man-pages/man3/posix_memalign.3.html

Currently:

"If size is 0, then
posix_memalign() returns either NULL, or a unique pointer value that
can later be successfully passed to free(3)."

--As posix_memalign doesn't "return" the value, but places the address
in *memptr I propose to change it to:

"If size is 0, then
posix_memalign() either places NULL in *memptr, or a unique pointer value that
can later be successfully passed to free(3)."


Best regards, Jon
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Egmont Koblinger <egmont-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Merge dprintf(3) into printf(3)
Date: Sun, 26 Apr 2015 13:26:58 +0200
Message-ID: <CAGWcZkJEzfzvTNZ_aznQJfYVYOqFCp91-B5-mBR5W=k_ndhcFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

I'd like to propose a small change.

I often open the printf(3) manual page, and this beginning with
several variants (fprintf, sprintf...) implicitly suggested me for
many years that this list was kinda complete.  I just randomly came
across dprintf(3) (while visiting http://ewontfix.com/10/).

Of course, dprintf(3) is mentioned in the "see also" section of
printf(3), so strictly speaking I should've noticed it much sooner, I
just overlooked it.

I don't find it logical that some printf variations (f, s, sn) are
documented in the same manual page, while another that's not more
different from these (d) is not.

I'd like to recommend refactoring, and integrating dprintf(3) (and
probably asprintf(3) too) in the basic printf(3) manual page.

It's also more useful if "man 3 dprintf" brings up the complete
documentation, rather than just the feature test macros and the
confirmance specification, and points to another manpage for the rest.

Thanks for considering,
egmont
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

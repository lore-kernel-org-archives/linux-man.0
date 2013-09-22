From: Laurence Gonsalves <laurence-IXX7sqgBUuUXtBFVwdE/iw@public.gmane.org>
Subject: Possibly misleading description of cflags parameter in regcomp(3)
Date: Sun, 22 Sep 2013 11:41:53 -0700
Message-ID: <CAJbtQC8O8D+MJvFehX7N_t7ewaOxwhH9ttJr_uQ9RA3mQC2MrA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello.

"man 3 regcomp" says "cflags may be the bitwise-or of one or more of
the following", but I'm fairly certain that 0 is also a legal value
for this parameter.

The page http://pubs.opengroup.org/onlinepubs/009695399/functions/regcomp.html
says "The cflags argument is the bitwise-inclusive OR of zero or more
of the following flags...".

If 0 is, indeed, a legal value then I think it would be more clear if
the manpage said "cflags may be the bitwise-or of zero or more of the
following".

(Sorry for the duplicate email. vger.kernel.org bounced the original
apparently due to Gmail's use of HTML.)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

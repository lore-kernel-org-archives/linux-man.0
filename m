From: <Felix_Schulte-dDVk9ABzqyjQT0dZR+AlfA@public.gmane.org>
Subject: Bug in documentation
Date: Fri, 19 Jul 2013 11:37:51 +0000
Message-ID: <94A07449C751564EBBCDD7481A3E829E104E60@MIVEXEMEA1N2.corp.nai.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Content-ID: <1E221170D394BF41886E0BF83F2A0304-dDVk9ABzqyjQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi!

The documentation for inotify is a bit misleading
(http://man7.org/linux/man-pages/man7/inotify.7.html)

It says when describing the "mask" field:
IN_MOVED_FROM     File moved out of watched directory (*).

The description is not correct, since this event is also fired (on
read()) when a file is moved *within* the same directory (to a new name)
and is explicitly *not* *moved out* of the directory.

It's not a big deal, of course, I just was confused about it recently.

Ciao
Felix
Firmensitz: Muenchen Amtsgericht: AG Muenchen Handelsregister: HRB 144340 Geschaeftsfuehrer: Timothy James Daly, Jonathan Park, Martin Stecher Bankverbindung: ABN-Amro Bank N.V. Konto 671 211 9006 UST-ID: DE168122444
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Jonny Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: gethostbyname.3
Date: Tue, 14 Oct 2014 23:34:52 +0100
Message-ID: <CAGc9EvetrL3i+3wfHC5=Sh8kLhvsr8w0orp+ObeR6t9TFZ6e_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello
Just looking at this page:

http://man7.org/linux/man-pages/man3/gethostbyname.3.html

NO_ADDRESS or NO_DATA
              The requested name is valid but does not have an IP address.

These macros are actually the same value, is there a good way to
explain that? i.e. no way to have a switch for both.

perhaps just say NO_DATA, then add the following for compatibility?

#define NO_ADDRESS NO_DATA

Regards, Jonny
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

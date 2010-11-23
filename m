From: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: man strnlen
Date: Tue, 23 Nov 2010 18:13:40 +0000
Message-ID: <AANLkTi=3H9mA+=c16qiS8TEfbxOaewvxxEJyDfELLRRG@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello

Just looking at this page:

http://www.kernel.org/doc/man-pages/online/pages/man3/strnlen.3.html


It says "This function is a GNU extension."

Is strnlen still a GNU only extension?


Microsoft and also The Open Group also document this function.

http://www.opengroup.org/onlinepubs/9699919799/functions/strlen.html

http://msdn.microsoft.com/en-us/library/z50ty2zh%28VS.80%29.aspx

Microsoft call it "ANSI"



Could strlen page link to strnlen(3) as well please.

http://www.kernel.org/doc/man-pages/online/pages/man3/strlen.3.html

Likewise, should all four pages refer to each other:

wcsnlen
wcslen
strlen
strnlen



As there is a string(3) page, should there be a wchar(3) page? Even
just a page to collectively refer to other pages.

http://www.kernel.org/doc/man-pages/online/pages/man3/string.3.html

wchar(3) page could list wcstok wcspbrk(3), wcsrchr(3), wcsstr(3), wmem=
chr(3)

Thank you for taking a look at these.

Best regards, Jon


p.s. I noticed the http://man7.org/tlpi/TLPI-front-cover.png is very
large and slow to load. Also it is 674px =C3=97 890px (scaled to 454px =
=C3=97
600px). Reducing it and compressing would save a few seconds off the
download!
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

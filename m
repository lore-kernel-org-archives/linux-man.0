From: Hirotaka Yamamoto <ymmt2005-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: recv(2) man page does not mention ECONNRESET
Date: Wed, 9 Oct 2013 09:34:46 +0900
Message-ID: <CAC4RxrcfL21PWiwdWAk7MZZU_N00dmfmUKF0qs_K-GAto=4Ncg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

Linux kernel sometimes returns -1 with errno=104 (ECONNRESET), but
recv(2) man page does not mention that error.

Compared to man pages from FreeBSD and POSIX, I believe that Linux
man page wrongly describe ECONNREFUSED instead of ECONNRESET.

Please confirm.

Yamamoto, Hirotaka (@ymmt2005)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

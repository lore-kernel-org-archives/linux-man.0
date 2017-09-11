From: Yubin Ruan <ablacktshirt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: socket(2) guarantee to return the lowest-available file descriptor
Date: Mon, 11 Sep 2017 10:56:18 +0800
Message-ID: <CAJYFCiNrUL-Z2R2GsXy_rG-iS_hLWEL-y8wdpw65hdw41T0YWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,
Is there any guarantee that socket(2) will return the lowest-available
file descriptor?

I note in the man page that open(2) has that guarantee, conforming to
POSIX, but nothing about that has been add to socket(2). As socket(2)
is said to be conforming to POSIX in the main page, which implies that
guarantee, should we add that to the man page?

Yubin
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Ricardo Vegas <ricardovegas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [tfix] Logrotate - Size param typos
Date: Tue, 23 May 2017 10:45:37 +0200
Message-ID: <CAJftORHs3efqqM8CBAYOefaTtQAjkNyU_O622k39=sO1pdnfYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

In the "SIZE" option, the following description:

> Log files are rotated only if they grow bigger then size bytes. If size i=
s followed by k, the size is assumed to be in kilobytes. If the M is used, =
the size is in megabytes, and if G is used, the size is in gigabytes. So si=
ze 100, size 100k, size 100M and size 100Gare all valid.

MUST be changed to:

> Log files are rotated only if they grow bigger than size bytes. If size i=
s followed by k, the size is assumed to be in kilobytes. If the M is used, =
the size is in megabytes, and if G is used, the size is in gigabytes. So si=
ze 100, size 100k, size 100M and size 100G are all valid.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

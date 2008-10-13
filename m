From: didier <did447-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: signal(7) and restartable syscalls
Date: Mon, 13 Oct 2008 17:10:04 +0200
Message-ID: <eba800c90810130810y237bed5dkdc108bce094529ab@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi

In current man page (version 3.11) there's no mention that  with
timeout set on sockets (SO_RCVTIMEO, SO_SNDTIMEO)
read, write,send,... aren't restartable.

from include/net/sock.h
/* Alas, with timeout socket operations are not restartable.
 * Compare this to poll().
 */

Didier
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

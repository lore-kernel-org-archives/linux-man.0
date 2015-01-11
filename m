From: =?UTF-8?B?0JzQsNGA0Log0JrQvtGA0LXQvdCx0LXRgNCz?=
	<socketpair-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man 4 tty_ioctl fixes
Date: Mon, 12 Jan 2015 01:58:53 +0600
Message-ID: <CAEmTpZH2JX1EuFCPDxZwCR8Sbxdgm8VJ+EN+HdhAC+b9YL49xg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

$ egrep '[^A-Z0-9]EXTPROC' -r /usr/include
/usr/include/x86_64-linux-gnu/bits/termios.h:# define EXTPROC 0200000
/usr/include/asm-generic/termbits.h:#define EXTPROC 0200000
<-------- undocumented

$ fgrep TIOCPKT -r /usr/include
/usr/include/asm-generic/ioctls.h:#define TIOCPKT 0x5420
/usr/include/asm-generic/ioctls.h:#define TIOCPKT_DATA 0
/usr/include/asm-generic/ioctls.h:#define TIOCPKT_FLUSHREAD 1
/usr/include/asm-generic/ioctls.h:#define TIOCPKT_FLUSHWRITE 2
/usr/include/asm-generic/ioctls.h:#define TIOCPKT_STOP 4
/usr/include/asm-generic/ioctls.h:#define TIOCPKT_START 8
/usr/include/asm-generic/ioctls.h:#define TIOCPKT_NOSTOP 16
/usr/include/asm-generic/ioctls.h:#define TIOCPKT_DOSTOP 32
/usr/include/asm-generic/ioctls.h:#define TIOCPKT_IOCTL 64  <------ undocumented

Some information:

http://stackoverflow.com/questions/21641754/when-pty-pseudo-terminal-slave-fd-settings-are-changed-by-tcsetattr-how-ca
http://lists.gnu.org/archive/html/bug-readline/2011-01/msg00004.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

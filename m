From: Rich Brennan <brennan-6Ux8kzz+SMaSfXE08pXutE5Kex9jXQ5X@public.gmane.org>
Subject: small typo in socket(7) man page
Date: Tue, 08 Feb 2011 14:42:34 -0600
Message-ID: <201102082042.p18KgYbl005092@shell.connactivity.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, brennan-6Ux8kzz+SMaSfXE08pXutE5Kex9jXQ5X@public.gmane.org
List-Id: linux-man@vger.kernel.org


Unless I'm missing an inside joke, the following paragraph in the
socket(7) man page mistakenly references bind(8) instead of bind(2).


SO_BINDTODEVICE
              Bind this socket to a particular device like "eth0", as specified in
              the passed interface name.  If the name is an empty string or the
              option length is zero, the socket device binding is removed.  The
              passed option is a variable-length null-terminated interface name
              string with the maximum size of IFNAMSIZ.  If a socket is bound to an
              interface, only packets received from that particular interface are
              processed by the socket.  Note that this only works for some socket
              types, particularly AF_INET sockets.  It is not supported for packet
              sockets (use normal bind(8) there).

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

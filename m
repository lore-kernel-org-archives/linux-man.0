From: =?UTF-8?B?0JzQsNGA0Log0JrQvtGA0LXQvdCx0LXRgNCz?=
	<socketpair-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: pread/pwrite manpage
Date: Fri, 21 Jun 2013 01:59:37 +0600
Message-ID: <CAEmTpZEcKpzWMreouKeALi_2hPKJF8w14aSNF6uTw7z5y778bA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Man page does not say that not only file offset is not changed, but
that file offset is not ever used. So, race condition impossible when
one process/thread changes offset, and other is calling pread/pwrite.
I mean that we must say that pread/pwrite is not just combination of
seek+read/write.

The same is described in pselect manpage, saying that pselect is not
just combination of setprocmask+select.

--
Segmentation fault
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

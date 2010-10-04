From: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Typos introduced in 5fab2e7?
Date: Mon, 4 Oct 2010 06:41:43 +0200
Message-ID: <AANLkTi=ZkHV97T49vsJaY8scUngP0JAGj12NnOvhTQb3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

  $ git show 5fab2e7 | grep forward
  -The listing below is a TCP forwarding program that forwards
  +The listing below is a TCP forwarding program that forward
  -The above program properly forwards most kinds of TCP connections
  +The above program properly forward most kinds of TCP connections
  -pointed to by \fIs\fP instead of forwards from the beginning.
  +pointed to by \fIs\fP instead of forward from the beginning.
The first 2 change look wrong to me.

Denis
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

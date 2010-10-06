From: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Missing word in aio.7
Date: Wed, 6 Oct 2010 23:39:40 +0200
Message-ID: <AANLkTi=TgkncPeFgP8WTKnHn96Qm6xYK4mdLzumY6Vie@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

Around line 120 of man7/aio.7:
  This field specifies a value that is subtracted
  from the calling thread's real-time priority in order to
  determine the priority for execution of this I/O request.
  .BR pthread_setschedparam (3)).

Here is a patch
-determine the priority for execution of this I/O request.
+determine the priority for execution of this I/O request (see
but you may want to change punctuation.

Denis
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Yubin Ruan <ablacktshirt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: ld.so(8) need clarification
Date: Tue, 10 Oct 2017 21:48:40 +0800
Message-ID: <CAJYFCiOX0rt6sRioUqQei2dyz_F9+43DbQub3Ru5GLSS_efqAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,
In ld.so(8), when explaining whether a process is in the so-called
"secure execution mode", there are three circumstances:

   *  The process's real and effective user IDs differ, or the real and
      effective group IDs differ.  This typically occurs as a result of
      executing a set-user-ID or set-group-ID program.

   *  A process with a non-root user ID executed a binary that conferred
      permitted or effective capabilities.

   *  A nonzero value may have been set by a Linux Security Module.

I am confused with the second circumstance. What does it mean by
"confer permitted or effective capabilities"?

Yubin
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

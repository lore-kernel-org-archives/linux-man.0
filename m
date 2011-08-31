From: Timmy Lee <scuttimmy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: timer_create(2) typo
Date: Thu, 1 Sep 2011 07:42:15 +0800
Message-ID: <CAN98ibbEpk7rbv8TBWD4kO1MXA6Cs-jTrX=wMsR6v2vfGj26PQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linux Manpage <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

http://www.kernel.org/doc/man-pages/online/pages/man2/timer_create.2.ht=
ml

There is an example which demonstrate the use of timer_create().

I believe the line:=A0 ./a.out 1 10=A0=A0=A0=A0 should be ./a.out 1 100

According to the description, the overrun count and the code, the
timer frequency should be 100 nanoseconds.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

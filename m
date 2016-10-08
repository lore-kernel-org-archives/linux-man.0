From: enh <enh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: minor typo in clone(2) CLONE_FILES
Date: Sat, 8 Oct 2016 09:08:04 -0700
Message-ID: <CAJgzZoo5qaviD6Po6iqn1V4zmhd4uJigApE7GyLoriXs2O3QTg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

sorry for not noticing this before...

              calling process, and thus share file offsets and files status
              flags (see open(2)).

should be

              calling process, and thus share file offsets and file status
              flags (see open(2)).

(s/files status/file status/)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

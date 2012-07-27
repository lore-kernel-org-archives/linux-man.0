From: Aaron Peschel <aaron.peschel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Mistake in glob(7)
Date: Thu, 26 Jul 2012 22:40:37 -0700
Message-ID: <CAGN0+FQjEkjL+qKD7fYrcDjHeMfiZ1TmVk6ag_GKFqsyzKrwKg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

man-pages release version 3.41

Arch Linux

Line reads:

    With bash one can force the classical behavior by setting
allow_null_glob_expansion=true.

However this is no longer true.

Line should read:

    With bash one can force the classical behavior by setting shopt -s nullglob.

-Aaron Peschel
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

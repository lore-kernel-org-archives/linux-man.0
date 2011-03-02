From: "Sebastian Unger" <sebunger-hi6Y0CQ0nG0@public.gmane.org>
Subject: Bug in MEMCMP(3)
Date: Wed, 2 Mar 2011 13:38:48 +1300
Message-ID: <BCDD017C319D4720B5ECD2813C3C23E5@napa.ad.etn.com>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Resending due to bounce from linux-man due to formatting policy.

Hi there,

I just used the above man page and noticed that it did not say whether
"bytes" are compared signed or unsigned. This may not be specified, but in
this case I would expect the man-page to at least say so.

I'm using current ubuntu 10.10
Man-pages version 3.24-1ubuntu1

Cheers,
Seb

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

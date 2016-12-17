From: psybin <psybin-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: Grammatical Error
Date: Sat, 17 Dec 2016 11:41:24 +0100
Message-ID: <280bcd08-c107-d43c-8422-e30687eb7140@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi friends,
I believe I've found a simple grammatical error in the man pages:

readv(2) - readv, writev, preadv, pwritev

RETURN VALUE
	From: "Note that is not an error for a successful call..."
	To:   "Note that it is not an error for a successful call..."

This error is present in the latest version available in the Git repo.

Thanks!

Alex
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

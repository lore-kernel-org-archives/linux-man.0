From: Mark Robson <markxr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Proposal: block(4)
Date: Sun, 12 Sep 2010 15:51:56 +0100
Message-ID: <AANLkTin_m9n=X6k2S-8pDA_B6Z3sMt5ifYUjUG5wd_ab@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

Looking at the sd(4) man page, there appear to be some BLK* ioctls
documented, but these don't really belong here, as some of them apply to all
block devices.

Should the common functions of a block device appear on a new page, block(4)
and refer to hd(4), sd(4), ram(4) etc as necessary?

I would create one if there was some interest.

Regards

Mark
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

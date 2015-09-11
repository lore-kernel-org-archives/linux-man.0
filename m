From: Daniel Roskams <rocket.penguin-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: small bug in isxdigit(3) man page
Date: Fri, 11 Sep 2015 21:33:27 +0800
Message-ID: <55F2D827.3020507@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Release 3.54, if you do `man 3 isxdigit' and go down to the bottom, you 
will see that this phrase is incorrect:

checks for a hexadecimal digits, that is...
                               ^

-- 
Daniel Roskams
49 6E 61 63 63 75 72 61 63 79 20 73 61 76 65 73
20 61 20 77 6f 72 6C 64 20 6F 66 20 65 78 70 6C
61 6E 61 74 69 6F 6E 2E 0A 00 00 00 00 00 00 00
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

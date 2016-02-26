From: blackmoor-1Ww2luigxekRVMDPamJrIw@public.gmane.org
Subject: capabilities.7 bug
Date: Fri, 26 Feb 2016 13:05:25 +0100
Message-ID: <57293b5ae5201df06141bc43a5cea72a@openmailbox.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

I found a bug in the capabilities.7 manual page, in the latest git 
revision (e92f04afa522316c1df54819b45db46e5663b72d).

Line 1124 reads SECBIT_NO_CAP_AMBIENT_RAISE, but should be 
SECBIT_NO_CAP_AMBIENT_RAISE_LOCKED

I wish you a very good day.
Best regards,

Marianne CHEVROT
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

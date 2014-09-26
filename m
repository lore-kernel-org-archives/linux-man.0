From: Benjamin Herr <ben-x1pcLkrQkvQ@public.gmane.org>
Subject: Re: [PATCH] console_ioctl.4: tfix
Date: Fri, 26 Sep 2014 18:44:48 +0200
Message-ID: <1411749888.25390.11.camel@0x539.de>
References: <1411748049.25390.2.camel@0x539.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411748049.25390.2.camel-x1pcLkrQkvQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Benjamin Herr <ben-x1pcLkrQkvQ@public.gmane.org>
---
Please bear with me, I've been spoiled by the frivolities of git web frontends
and am apparently not properly prepared to convey patches via email. I believe
this one should apply, though.

diff --git a/man4/console_ioctl.4 b/man4/console_ioctl.4
index 6918b24..42819b1 100644
--- a/man4/console_ioctl.4
+++ b/man4/console_ioctl.4
@@ -59,7 +59,7 @@ are set to the state of the LEDs, as follows:
 .TS
 l l l.
 LED_CAP 	0x04	caps lock led
-LEC_NUM 	0x02	num lock led
+LED_NUM 	0x02	num lock led
 LED_SCR 	0x01	scroll lock led
 .TE
 .TP


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

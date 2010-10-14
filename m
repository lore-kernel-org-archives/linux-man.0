From: Jan Engelhardt <jengelh-nopoi9nDyk+ELgA04lAiVw@public.gmane.org>
Subject: crypt.3: inaccurate instructions listed for crypt_r
Date: Thu, 14 Oct 2010 20:42:32 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1010142039540.20852@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,


the crypt.3 is a bit confusing on crypt_r (looking at distro-provided 
man-pages-3.25 here). The manpage says to use _XOPEN_SOURCE and 
unistd.h, but the crypt_r function, being a GNU extension, requires 
#define _GNU_SOURCE and #include <crypt.h> instead.

thanks,
Jan
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

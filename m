From: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Subject: Re: syslog(3) inconsistency
Date: Fri, 24 Mar 2017 17:48:28 +0100
Message-ID: <58D54DDC.8060507@bfs.de>
References: <8ab6f0a9-1a71-c776-80a2-5913e941aaf2@mev.co.uk>
Reply-To: wharms-fPG8STNUNVg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8ab6f0a9-1a71-c776-80a2-5913e941aaf2-GUHe90Wt2aFaa/9Udqfwiw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ian Abbott <abbotti-GUHe90Wt2aFaa/9Udqfwiw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org



Am 23.03.2017 19:37, schrieb Ian Abbott:
> Hi,
> 
> The first parameter of `syslog()` is called `priority` in the man-page,
> except in the breakdown of the possible log levels, where it is called
> `level`.
> 
Hi Ia,
do you thing that this example would be helpful ?

re,
 wh

#include <syslog.h>

int main()
{
	openlog("prgname",LOG_PERROR|LOG_NDELAY,LOG_LOCAL0);
	syslog(LOG_LOCAL0|LOG_DEBUG,"hello error");
	closelog();

	return 0;
}
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Subject: Re: [Bug 61511] New: scanf man page is misleading re out-of-range
 integer conversions
Date: Mon, 16 Sep 2013 23:20:23 +0200
Message-ID: <52377617.4050604@bfs.de>
References: <bug-61511-11311@https.bugzilla.kernel.org/>
Reply-To: wharms-fPG8STNUNVg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-61511-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org



Am 16.09.2013 22:04, schrieb bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org:
> sscanf("9999999999999999999999999999999", "%d", &i).


please try this code:

#include <stdio.h>
#include <errno.h>
int main()
{
        int ret,i;
        ret=sscanf("9999999999999999999999999999999", "%d", &i);
        perror("scanf");
        printf("ret=%d i=%d\n",ret,i);
        return 0;
}

re,
 wh
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

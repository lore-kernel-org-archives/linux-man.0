From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 60749] Do not need to link against -lm for fabs*()
Date: Thu, 29 Aug 2013 10:09:26 +0000
Message-ID: <bug-60749-11311-pGBJHlF72Q@https.bugzilla.kernel.org/>
References: <bug-60749-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-60749-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=60749

--- Comment #1 from Jeyaram <rjayavrp2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Following code also works fine without linking with -lm

#include <math.h>
#include <stdlib.h>
#include <stdio.h>

int main(int argc, char **argv)
{
   printf("%lf\n", pow(5,3));
   return 0;
}

Actually, libc some how includes the math library
"/lib/i386-linux-gnu/libm.so.6".

If this file is not available, then following error message is displayed.

/usr/lib/gcc/i686-linux-gnu/4.7/cc1: error while loading shared libraries:
libm.so.6: cannot open shared object file: No such file or directory

I tried it by renaming libm.so.6. 

Solution:

I request not to remove the line "Link with -lm". This is mandatory.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

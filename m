From: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: <sys/memfd.h> header
Date: Fri, 3 Nov 2017 20:22:29 +0100
Message-ID: <a989051a-3dcd-9fe6-ab23-5d9fd5d3442b@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

memfd_create(2) mentions a <sys/memfd.h>.  Is this a typo for 
<linux/memfd.h>?

I want to implement the system call wrapper, but we're probably going to 
put it into <sys/mman.h> and have it include <linux/memfd.h> for 
_GNU_SOURCE.

Thanks,
Florian
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

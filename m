From: erbenton <erbenton-Wuw85uim5zDR7s880joybQ@public.gmane.org>
Subject: usleep man page issue
Date: Tue, 12 Dec 2017 17:16:11 -0800
Message-ID: <dce6dd89-90d6-9b8d-c81d-3c6b339cf671@comcast.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

   In man 3 usleep

ERRORS
        EINTR  Interrupted by a signal; see signal(7).

        EINVAL usec is not smaller than 1000000.  (On systems where that 
is considered an error.)

please change  "is not smaller than" to "is greater than or equal to" as 
this language is very confusing

Thanks

Eric

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Ian Abbott <abbotti-GUHe90Wt2aFaa/9Udqfwiw@public.gmane.org>
Subject: syslog(3) inconsistency
Date: Thu, 23 Mar 2017 18:37:07 +0000
Message-ID: <8ab6f0a9-1a71-c776-80a2-5913e941aaf2@mev.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

The first parameter of `syslog()` is called `priority` in the man-page, 
except in the breakdown of the possible log levels, where it is called 
`level`.

-- 
-=( Ian Abbott @ MEV Ltd.    E-mail: <abbotti-GUHe90Wt2aFaa/9Udqfwiw@public.gmane.org> )=-
-=(                          Web: http://www.mev.co.uk/  )=-
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

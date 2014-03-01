From: Rick Stanley <rstanley-PulMX1svUoYAvxtiuMwx3w@public.gmane.org>
Subject: man 3 strncpy error
Date: Sat, 01 Mar 2014 13:31:47 -0500
Message-ID: <1393698707.4142.12.camel@linus.home.rsiny.com>
Reply-To: rstanley-PulMX1svUoYAvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On the current page for `man 3 strncpy` there is an error in the sample
for forced termination if the copy does not result in a proper
null-terminated string. (Appears in both "Man-pages, release 3.58", and
on http://man7.org/linux/man-pages/man3/strncpy.3.html )

Current:
        
        strncpy(buf, str, n);
        if (n > 0)
            buf[n - 1]= '\0';
        
If n == 4, then 4 bytes are copied, (buf[0] - buf[3]) but n - 1 or
buf[3] is then overwritten with the '\0'.  Should be buf[n] instead.

Corrected code:
        
        strncpy(buf, str, n);
        if (n > 0)
            buf[n]= '\0';
        
Question:  Even if n == 0 why shouldn't buf[n] be set to '\0'?

Thank you!

Rick Stanley

-- 
RSI (Rick Stanley, Inc.)
(917) 822-7771
www.rsiny.com
Computer Systems Consulting
Linux & Open Source Specialists



--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

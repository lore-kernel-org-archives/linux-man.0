From: Martin Gebert <Murphy.Gebert-Mmb7MZpHnFY@public.gmane.org>
Subject: backtrace(3): Inconsistency and missing indentation
Date: Wed, 24 Feb 2016 10:26:04 +0100
Message-ID: <56CD772C.8030606@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

In the example section of the page the following snippet is given:

--8><--
        void
        myfunc3(void)
        {
            int j, nptrs;
        #define SIZE 100
            void *buffer[100];
            char **strings;

            nptrs = backtrace(buffer, SIZE);
--><8--

Problems:

 1. "#define SIZE 100" is not indented correctly.
 2. SIZE should also be used for the buffer array size.

Thank you.

Martin

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

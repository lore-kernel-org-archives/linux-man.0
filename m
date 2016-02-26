From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: backtrace(3): Inconsistency and missing indentation
Date: Fri, 26 Feb 2016 16:46:17 +0100
Message-ID: <56D07349.10901@gmail.com>
References: <56CD772C.8030606@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56CD772C.8030606-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Gebert <Murphy.Gebert-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/24/2016 10:26 AM, Martin Gebert wrote:
> In the example section of the page the following snippet is given:
> 
> --8><--
>         void
>         myfunc3(void)
>         {
>             int j, nptrs;
>         #define SIZE 100
>             void *buffer[100];
>             char **strings;
> 
>             nptrs = backtrace(buffer, SIZE);
> --><8--
> 
> Problems:
> 
>  1. "#define SIZE 100" is not indented correctly.
>  2. SIZE should also be used for the buffer array size.

Thanks, Martin. Fixed as below.

Cheers,

Michael

diff --git a/man3/backtrace.3 b/man3/backtrace.3
index afca93d..064b970 100644
--- a/man3/backtrace.3
+++ b/man3/backtrace.3
@@ -215,8 +215,8 @@ void
 myfunc3(void)
 {
     int j, nptrs;
-#define SIZE 100
-    void *buffer[100];
+    const int SIZE = 100;
+    void *buffer[SIZE];
     char **strings;
 
     nptrs = backtrace(buffer, SIZE);



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Broken program example in documentation to strverscmp(3)
Date: Wed, 25 Jan 2017 07:43:06 +1300
Message-ID: <CAKgNAkj7aHpnTe-2oNOo0GrjhDuS0E92UHkGFrYdeTo_5rqATA@mail.gmail.com>
References: <20170124105110.GA25883@ulegcpvplx.localdomain>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170124105110.GA25883-Xq46GwSkZg36NKmgiXY+hA0JkcsJGQge@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vivenzio Pagliari <vivenzio.pagliari-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Vinenzio

On 24 January 2017 at 23:51, Vivenzio Pagliari
<vivenzio.pagliari-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org> wrote:
> Dear Micheal Kerrisk,
>
> the program source example shown in the current version of the strverscmp(3)
> manpage is supposedly broken, as the return value of the library function is
> interpreted incorrectly.
>
> The execution of the example shows:
>
>   $ i./a.out jan1 jan10
>   jan1 < jan10
>
> Another expected output is:
>
>   $ i./a.out jan10 jan11
>   jan10 < jan11
>
> However, a simple change in the call unveils an unexpected result:
>
>   $ i./a.out jan10 jan12
>   jan10 > jan12
>
> The unexpected behaviour originates from the test of the result of
> strversort(): In the program code, the "less than" is tested by comparing
> the function result for  equality to -1, however the test shall compare for
> the function result to be less than 0, according the the documentation of
> the RETURN VALUE in the manpage.

Thanks for the report. I applied the patch below.

Cheers,

Michael


diff --git a/man3/strverscmp.3 b/man3/strverscmp.3
index e2a383a..8efc572 100644
--- a/man3/strverscmp.3
+++ b/man3/strverscmp.3
@@ -148,7 +148,7 @@ main(int argc, char *argv[])
     res = strverscmp(argv[1], argv[2]);

     printf("%s %s %s\\n", argv[1],
-            (res == \-1) ? "<" : (res == 0) ? "==" : ">", argv[2]);
+            (res < 0) ? "<" : (res == 0) ? "==" : ">", argv[2]);

     exit(EXIT_SUCCESS);
 }



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

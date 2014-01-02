From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: "Writing" instead of "Warning" in dlopen(3) manpage
Date: Thu, 02 Jan 2014 14:46:59 +1300
Message-ID: <52C4C513.7020509@gmail.com>
References: <20131231124209.GA4814@darkstar> <201312311119.55754.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201312311119.55754.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, noname-CuI0ZDT4mYnsrOwW+9ziJQ@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/01/14 05:19, Mike Frysinger wrote:
> On Tuesday 31 December 2013 07:42:09 noname-CuI0ZDT4mYnsrOwW+9ziJQ@public.gmane.org wrote:
>> dlopen C code example contains following comment:
>>
>> /* Writing: cosine = (double (*)(double)) dlsym(handle, "cos");
>>    ... */
>>
>> "Writing:" should be replaced with "Warning:".
> 
> both are correct
> 
> however, i wonder if the comment should be inverted.  the latest POSIX spec 
> requires that the natural cast work.
> http://pubs.opengroup.org/onlinepubs/9699919799/functions/dlsym.html#tag_16_96_07
> 
> Linux man pages document the normal Linux environment, and that means POSIX, 
> not strict ISO C.

Thanks for your comments Mike. It's been at the back of my mind for a while now
to do something about this. I applied the patch below. Look okay to you?

Cheers,

Michael


diff --git a/man3/dlopen.3 b/man3/dlopen.3
index dd54120..47ca55f 100644
--- a/man3/dlopen.3
+++ b/man3/dlopen.3
@@ -466,15 +466,22 @@ main(int argc, char **argv)
 
     dlerror();    /* Clear any existing error */
 
-    /* Writing: cosine = (double (*)(double)) dlsym(handle, "cos");
-       would seem more natural, but the C99 standard leaves
-       casting from "void *" to a function pointer undefined.
-       The assignment used below is the POSIX.1\-2003 (Technical
-       Corrigendum 1) workaround; see the Rationale for the
-       POSIX specification of dlsym(). */
+    cosine = (double (*)(double)) dlsym(handle, "cos");
 
-    *(void **) (&cosine) = dlsym(handle, "cos");
-.\" But in fact "gcc -O2 -Wall" will complain about the preceding cast.
+    /* According to the C99 standard, casting 'void *' to a function pointer
+       as shown above is forbidden. POSIX.1-2003 and POSIX.2008 followed
+       C99's requirement, and proposed the following workaround:
+
+           *(void **) (&cosine) = dlsym(handle, "cos");
+
+       This (clumsy) cast conforms with C99 and will avoid any compiler 
+       warnings.
+
+       The 2013 Technical Corrigendum to POSIX.1-2008 (a.k.a. POSIX.1-2013)
+       improved matters by requiring that conforming implementations support
+       casting 'void *' to a function pointer. Nevertheless, some compilers
+       (e.g., gcc with the '-pedantic' option) may complain about the cast
+       used in this program. */



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

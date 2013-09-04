From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: gethostbyname
Date: Wed, 04 Sep 2013 09:20:28 +0200
Message-ID: <5226DF3C.8040607@gmail.com>
References: <CAGc9EveL=F15GLtZYi22KHVf8Obai5Fx1kuC8ppDVx_LaJWkJA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGc9EveL=F15GLtZYi22KHVf8Obai5Fx1kuC8ppDVx_LaJWkJA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/12/13 00:04, Jon Grant wrote:
> Hello
> 
> Where on this page it talks about obsolete herror() and hstrerror(),
> could it highlight the functions that should be used instead. I am not
> sure what is the replacement, but pehaps it would return
> HOST_NOT_FOUND as a string?
> 
> http://man7.org/linux/man-pages/man3/gethostbyname.3.html

Hi Jon,

I applied the patch below.

Cheers,

Michael


diff --git a/man3/gethostbyname.3 b/man3/gethostbyname.3
index 23a11bf..9be2c28 100644
--- a/man3/gethostbyname.3
+++ b/man3/gethostbyname.3
@@ -131,14 +131,17 @@ none
 .PD
 .SH DESCRIPTION
 The
-.BR gethostbyname* ()
+.BR gethostbyname* (),
+.BR gethostbyaddr* (),
+.BR herror (),
 and
-.BR gethostbyaddr* ()
+.BR hstrerror ()
 functions are obsolete.
 Applications should use
-.BR getaddrinfo (3)
+.BR getaddrinfo (3),
+.BR getnameinfo (3),
 and
-.BR getnameinfo (3)
+.BR gai_strerror (3)
 instead.
 
 The

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

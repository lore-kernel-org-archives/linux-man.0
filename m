From: "Carlos O'Donell" <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Function sigvec removed in glibc 2.21
Date: Thu, 19 Feb 2015 13:40:22 -0500
Message-ID: <54E62E16.2070906@redhat.com>
References: <54E61B2D.3030402@redhat.com> <CAKgNAkhRrUA7EEvx3rJ1D5b=13i+_cC+EstryVgZwE_3iS_XjA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkhRrUA7EEvx3rJ1D5b=13i+_cC+EstryVgZwE_3iS_XjA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Roland McGrath <roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 02/19/2015 01:18 PM, Michael Kerrisk (man-pages) wrote:
> Hi Carlos,
> 
> On 19 February 2015 at 18:19, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>> Michael,
>>
>> We should update man3/sigvec.3 to indicate it can no longer be used
>> on Linux with glibc 2.21. The sigvec function was removed in glibc 2.21.
>>
>> https://sourceware.org/glibc/wiki/Release/2.21#Packaging_Changes
> 
> Thanks for the heads-up. I already committed the following a while back:
> http://git.kernel.org/cgit/docs/man-pages/man-pages.git/commit/man3/sigvec.3?id=5587b44c90ca19abf75e96c3e85371366b72e4da
> 
> Okay?

Perfect.

> Cheers,
> 
> Michael
> 
> diff --git a/man3/sigvec.3 b/man3/sigvec.3
> index 797d43d..2ccd8e7 100644
> --- a/man3/sigvec.3
> +++ b/man3/sigvec.3
> @@ -231,6 +231,13 @@ functions are thread-safe.
> The
> .BR sigmask ()
> macro is thread-safe.
> +.SH VERSIONS
> +Starting with version 2.21, the GNU C library no longer exports the
> +.BR sigvec ()
> +function as part of the ABI.
> +(To ensure backward compatibility,
> +the glibc symbol versioning scheme continues to export the interface
> +to binaries linked against older versions of the library.)
> .SH CONFORMING TO
> All of these functions were in
> 4.3BSD, except
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

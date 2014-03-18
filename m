From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: should "man feature_test_macros" mention _LARGEFILE_SOURCE?
Date: Tue, 18 Mar 2014 21:19:13 +0100
Message-ID: <CAKgNAkjBz_yZWOuVXeTmvuqBL=4PVZiaQ-So2UqKGQN9ehwaMQ@mail.gmail.com>
References: <alpine.LFD.2.11.1403181544010.5574@localhost>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LFD.2.11.1403181544010.5574@localhost>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, Mar 18, 2014 at 8:46 PM, Robert P. J. Day <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org> wrote:
>
>   just noticed under /usr/include on my fedora rawhide system the
> following:
>
> /usr/include/bits/environments.h:# define __ILP32_OFFBIG_CFLAGS "-m32 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
> /usr/include/python3.3m/pyconfig-64.h:#define _LARGEFILE_SOURCE 1
> /usr/include/features.h:   _LARGEFILE_SOURCE    Some more functions for correct standard I/O.
> /usr/include/features.h:#  undef _LARGEFILE_SOURCE
> /usr/include/features.h:#  define _LARGEFILE_SOURCE     1
> /usr/include/features.h:#ifdef _LARGEFILE_SOURCE
> /usr/include/python2.7/pyconfig-64.h:#define _LARGEFILE_SOURCE 1
>
> but there's no mention of "_LARGEFILE_SOURCE" in "man
> feature_test_macros". is that assumed to be implied by
> _LARGEFILE64_SOURCE? it's not clear.

I don't know the answer, but when you do, send a patch!

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

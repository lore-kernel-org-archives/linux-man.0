From: starlight.2013q1-Utvwg/EOxnhfq8cQ1yknNg@public.gmane.org
Subject: Re: getxattr() errata
Date: Fri, 18 Jan 2013 18:24:15 -0500
Message-ID: <6.2.5.6.2.20130118181853.05db72b8@binnacle.cx>
References: <6.2.5.6.2.20130117231255.05e4dc38@binnacle.cx>
 <CAKgNAkiacZSCb_J0fxT0wj-ynyTnCba8_DZMP-3UM_+PzTYJAg@mail.gmail.com> <CAKgNAkiacZSCb_J0fxT0wj-ynyTnCba8_DZMP-3UM_+PzTYJAg
 @mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkiacZSCb_J0fxT0wj-ynyTnCba8_DZMP-3UM_+PzTYJAg
 @mail.gmail.com>
References: <6.2.5.6.2.20130117231255.05e4dc38-Utvwg/EOxnhfq8cQ1yknNg@public.gmane.org>
 <CAKgNAkiacZSCb_J0fxT0wj-ynyTnCba8_DZMP-3UM_+PzTYJAg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrew_perepechko-qCPWdT176rRBDgjK7y7TUQ@public.gmane.org, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

That does make sense--sort of.  I'm
not fond of aliases, especially when
the aliases live in service-specific
include files rather than in the
generic 'errno*.h' files.

Ran into this while working with

   cap_get_file()

which is one layer removed from
getxattr() and is not documented
specifically making use of it.

I'm sure there's a reason why
the capability calls are not present
in MAN7, but I was a bit baffled
by the omission when doing the
research.  'libcap.so.2' is part
of the kernel.org code base:

https://git.kernel.org/?p=linux/kernel/git/morgan/libcap.git;a=summary


At 12:01 AM 1/19/2013 +0100, Michael Kerrisk (man-pages) wrote:
>On Fri, Jan 18, 2013 at 5:16 AM,  <starlight.2013q1-Utvwg/EOxnhfq8cQ1yknNg@public.gmane.org> 
>wrote:
>> Hello,
>>
>> Just noticed that the getxattr() man page
>> says that ENOATTR is returned when an
>> extended attribute is not present.
>>
>> http://man7.org/linux/man-pages/man2/getxattr.2.html
>>
>> I believe the correct code for this
>> situation is ENODATA or 61.
>>
>>    strace getcap /bin/bash
>>
>> should confirm that.
>
>Yup, others have also noted this; see
>https://bugzilla.kernel.org/show_bug.cgi?id=51871
>
>The point is that ENOATTR is a synonym for ENODATA.
>
>For each of the relevant pages, I've simply added the text: 
>"(ENOATTR
>is defined to be a synonym for ENODATA in <attr/xattr.h>.)"
>
>Thanks,
>
>Michael
>
>
>-- 
>Michael Kerrisk
>Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
>Author of "The Linux Programming Interface"; 
>http://man7.org/tlpi/

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

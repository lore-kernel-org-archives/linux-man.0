From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: getxattr() errata
Date: Sat, 19 Jan 2013 00:01:42 +0100
Message-ID: <CAKgNAkiacZSCb_J0fxT0wj-ynyTnCba8_DZMP-3UM_+PzTYJAg@mail.gmail.com>
References: <6.2.5.6.2.20130117231255.05e4dc38@binnacle.cx>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6.2.5.6.2.20130117231255.05e4dc38-Utvwg/EOxnhfq8cQ1yknNg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: starlight.2013q1-Utvwg/EOxnhfq8cQ1yknNg@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrew_perepechko-qCPWdT176rRBDgjK7y7TUQ@public.gmane.org, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, Jan 18, 2013 at 5:16 AM,  <starlight.2013q1-Utvwg/EOxnhfq8cQ1yknNg@public.gmane.org> wrote:
> Hello,
>
> Just noticed that the getxattr() man page
> says that ENOATTR is returned when an
> extended attribute is not present.
>
> http://man7.org/linux/man-pages/man2/getxattr.2.html
>
> I believe the correct code for this
> situation is ENODATA or 61.
>
>    strace getcap /bin/bash
>
> should confirm that.

Yup, others have also noted this; see
https://bugzilla.kernel.org/show_bug.cgi?id=51871

The point is that ENOATTR is a synonym for ENODATA.

For each of the relevant pages, I've simply added the text: "(ENOATTR
is defined to be a synonym for ENODATA in <attr/xattr.h>.)"

Thanks,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

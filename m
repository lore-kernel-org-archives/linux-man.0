From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: index.3 wcsnlen.3 proposals
Date: Wed, 21 Sep 2011 07:05:08 +0200
Message-ID: <CAKgNAkhVun+HXRWXub2OgrbfCds2Yv0DzuA7-ZOEN3Y0Hpcwxw@mail.gmail.com>
References: <4E791BB2.4040809@jguk.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E791BB2.4040809-hus3n9K41k0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Jon,

On Wed, Sep 21, 2011 at 1:03 AM, Jon Grant <jg-hus3n9K41k0@public.gmane.org> wrote:
> Hello
>
> Some feedback below. Great new release!
>
> I saw in index.3:
>
> http://man7.org/linux/man-pages/online/pages/man3/index.3.html
>
> Some use of "NULL" to mean the Nul terminating byte. I suggest to change
> from NULL, as that means (void*)0;

Thanks for spotting that!

> Current text:
> "The terminating NULL character is considered to be a part of the strings."
>
> Proposal:
>
> "The terminating NUL character '\0' is considered to be a part of the
> strings.

I made it "The terminating null byte (\0)..." since that's consistent
with what is usually written in other pages.

> A user call with c=0 to find the end of the string."

That doesn't quite parse, but I understand what you are meaning (I
think). However, I'm not sure that we want to suggest to the user to
do this. POSIX in any case marks this function as LEGACY.

> http://man7.org/linux/man-pages/online/pages/man3/wcsnlen.3.html
>
> I think worth clarifying "maxlen" is in wide-char units, not bytes.
>
> Current text:
>
> "but at most maxlen"
>
> Proposal:
> "but at most maxlen wide characters (note, this parameter is not a byte
> count)"

Agreed. I made the change.

The changes will be in 3.34.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

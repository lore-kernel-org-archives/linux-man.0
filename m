From: Archie Cobbs <archie.cobbs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Issue with asprintf()
Date: Tue, 12 May 2015 08:35:01 -0500
Message-ID: <CANSoFxuEGKuwZVRyJ_Ebmtyv63xhBXYUnAv4+BSODiBz29ckcw@mail.gmail.com>
References: <CANSoFxs8XW6Z7ph2Uy1wFdeQPOGb7zvwJKExSLoUrMQ94b-8XA@mail.gmail.com>
 <20150512025811.GA2965@vapier> <CAKgNAkjemzRg4OM02rQa2OLPU_EKJEDRcHWGpEFnNFvpkA02vQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkjemzRg4OM02rQa2OLPU_EKJEDRcHWGpEFnNFvpkA02vQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "mtk.manpages" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, May 12, 2015 at 12:17 AM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 12 May 2015 at 04:58, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
>> On 11 May 2015 17:46, Archie Cobbs wrote:
>>> There seems to be an issue with the asprintf() man page and underlying
>>> implementation (I'm using openSUSE 13.1 - man-pages-3.53).
>>>
>>> Since asprintf() is not POSIX, the man page effectively becomes the
>>> specification of its behavior.
>>
>> not really.  glibc specifies its behavior in its manual:
>>         https://www.gnu.org/software/libc/manual/html_node/Dynamic-Output.html
>
> Mike is of course right.
>
>> any behavior not covered in the manual is unspecified.  if you want to clarify
>> it, you should start with the glibc lists.
>
> But it would be good to have this point clarified. The glibc manual
> omits to say anything here.
>
> Archie, do you want to take this to libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org (and CC
> me, so that I might fix the man page if anything useful comes out of
> the conversation)?

Hi Michael,

Will do.. thanks for the pointer.

-Archie

-- 
Archie L. Cobbs
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

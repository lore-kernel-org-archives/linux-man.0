From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Migration of some *.7 keyutils man pages from keyutils to man-pages
Date: Tue, 13 Dec 2016 12:36:09 +0100
Message-ID: <CAKgNAkij-OBkK8-eEj=kCLLCzv5OCHu_C81mqOC_fbQJbD0PAA@mail.gmail.com>
References: <da3e1e69-bc26-fb2a-ce1f-980e77fc4652@gmail.com> <24383.1481625938@warthog.procyon.org.uk>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <24383.1481625938-S6HVgzuS8uM4Awkfq6JHfwNdhmdF6hFW@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, keyrings-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi David,

On 13 December 2016 at 11:45, David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> As we discussed face to face, it makes some sense to migrate various
>> of the section 7 keyutils man pages to the man-pages project, since
>> they document kernel-user-space interfaces.
>>
>> Thus, I have just pulled the current copies of the following pages
>> into man-pages:
>>
>> keyrings.7
>> persistent-keyring.7
>> process-keyring.7
>> session-keyring.7
>> thread-keyring.7
>> user-keyring.7
>> user-session-keyring.7
>>
>> Could you please delete these from the keyutils package.
>>
>> Note that I have NOT taken the keyutils.7 page, since that's an
>> overview page about the keyutils package and other bits and pieces.
>
> Do you want to give me a patch for this so that the commit has your details on
> it?

Yes, I can do that. I already have some other fixes already sent as a
pull request. Could you take a look at those?

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

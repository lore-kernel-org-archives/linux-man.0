From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Migration of some *.7 keyutils man pages from keyutils to man-pages
Date: Mon, 12 Dec 2016 13:06:08 +0100
Message-ID: <CAKgNAkg51nSYjNt-p_6GkAn9ZsuONy2KH1E0agvXaXCbm7Sj8g@mail.gmail.com>
References: <da3e1e69-bc26-fb2a-ce1f-980e77fc4652@gmail.com> <c7132641-17ac-8c92-0892-72d272527bce@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c7132641-17ac-8c92-0892-72d272527bce-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, keyrings-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello David,

Ping! I'm now about to merge my edited versions of the pages that were
migrated from keyutils for the next release of man-pages (4.10).

Cheers,

Michael


On 26 November 2016 at 13:50, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello David,
>
> Ping!
>
> I've by now integrated the pages below into man-pages, and
> substantially enhanced them. I want to ensure that we don't
> create a file conflict in future releases of man-pages and
> keyutils...
>
> Cheers,
>
> Michael
>
> On 11/01/2016 07:06 PM, Michael Kerrisk (man-pages) wrote:
>> Hi David
>>
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
>>
>> Thanks,
>>
>> Michael
>>
>
>
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Man page doc for SEEK_DATA/SEEK_HOLE
Date: Tue, 20 Sep 2011 07:24:24 +0200
Message-ID: <CAKgNAki0CtE6a_JLjPUsyozP2cfy_x8MSSYfhu5gMEeRE6Zaww@mail.gmail.com>
References: <CAKgNAkhZSb0UfZz7N+gKRQD0r7gnC_3-VCB_ORio8ojczbCDvQ@mail.gmail.com>
 <4E77827C.3030202@redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E77827C.3030202-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Blake <eblake-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Josef Bacik <josef-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Eric

On Mon, Sep 19, 2011 at 7:57 PM, Eric Blake <eblake-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> On 09/18/2011 01:07 AM, Michael Kerrisk wrote:
>>
>> +
>> +.BR SEEK_DATA
>> +and
>> +.BR SEEK_HOLE
>> +are nonstandard extensions also present in Solaris.
>
> Looks good to me, but you may also want to link to the proposed wording for
> mandating SEEK_HOLE/SEEK_DATA in the eventual POSIX Issue 8 (POSIX 2008 is
> Issue 7):
> http://austingroupbugs.net/view.php?id=415
>
> Also, it seems a shame that the kernel can fail with EINVAL instead of
> properly emulating SEEK_HOLE and SEEK_DATA even on file systems with no
> underlying support for reporting holes.

Thanks for catching that. I've added that point.

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

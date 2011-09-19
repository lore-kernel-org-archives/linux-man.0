From: Sunil Mushran <sunil.mushran-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: Man page doc for SEEK_DATA/SEEK_HOLE
Date: Mon, 19 Sep 2011 11:27:45 -0700
Message-ID: <4E7789A1.4080501@oracle.com>
References: <CAKgNAkhZSb0UfZz7N+gKRQD0r7gnC_3-VCB_ORio8ojczbCDvQ@mail.gmail.com> <4E77827C.3030202@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E77827C.3030202-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Blake <eblake-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Josef Bacik <josef-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/19/2011 10:57 AM, Eric Blake wrote:
> On 09/18/2011 01:07 AM, Michael Kerrisk wrote:
>> +
>> +.BR SEEK_DATA
>> +and
>> +.BR SEEK_HOLE
>> +are nonstandard extensions also present in Solaris.
>
> Looks good to me, but you may also want to link to the proposed wording for mandating SEEK_HOLE/SEEK_DATA in the eventual POSIX Issue 8 (POSIX 2008 is Issue 7):
> http://austingroupbugs.net/view.php?id=415
>
> Also, it seems a shame that the kernel can fail with EINVAL instead of properly emulating SEEK_HOLE and SEEK_DATA even on file systems with no underlying support for reporting holes.
>

Why do you say that? If I am reading generic_file_llseek_unlocked()
correctly, the default behavior is treat offset < i_size as data.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

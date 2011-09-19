From: Eric Blake <eblake-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Man page doc for SEEK_DATA/SEEK_HOLE
Date: Mon, 19 Sep 2011 12:44:07 -0600
Message-ID: <4E778D77.4070207@redhat.com>
References: <CAKgNAkhZSb0UfZz7N+gKRQD0r7gnC_3-VCB_ORio8ojczbCDvQ@mail.gmail.com> <4E77827C.3030202@redhat.com> <4E7789A1.4080501@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E7789A1.4080501-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sunil Mushran <sunil.mushran-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Josef Bacik <josef-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/19/2011 12:27 PM, Sunil Mushran wrote:
> On 09/19/2011 10:57 AM, Eric Blake wrote:
>> Also, it seems a shame that the kernel can fail with EINVAL instead of
>> properly emulating SEEK_HOLE and SEEK_DATA even on file systems with
>> no underlying support for reporting holes.
>>
>
> Why do you say that? If I am reading generic_file_llseek_unlocked()
> correctly, the default behavior is treat offset < i_size as data.

The proposed wording states:

>  .B EINVAL
>  .I whence
> -is not one of
> -.BR SEEK_SET ,
> -.BR SEEK_CUR ,
> -.BR SEEK_END ;
> -or the resulting file offset would be negative,
> +is not valid (this error may be returned if
> +.I whence
> +is
> +.BR SEEK_DATA
> +or
> +.BR SEEK_HOLE
> +and the underlying file system does not support the operation).

I guess it should instead read:

EINVAL whence is not valid (this error may be returned if whence is 
SEEK_DATA or SEEK_HOLE but the kernel does not support the operation).

Given your argument that new enough kernels understand SEEK_DATA and 
SEEK_HOLE for all file systems.

I agree that EINVAL will occur if you compile against new enough glibc 
that exposes the constants, but then run against an older kernel that 
does not yet understand them.  But I want the text to be clarified to be 
bullet-proof that if I am running against kernel 3.1 or newer, the only 
way I will ever get EINVAL for these two constants is if I do something 
else invalid, like a negative offset.

-- 
Eric Blake   eblake-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org    +1-801-349-2682
Libvirt virtualization library http://libvirt.org
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

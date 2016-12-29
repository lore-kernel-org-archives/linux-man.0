From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] New page describing userfaultfd(2) system call.
Date: Thu, 29 Dec 2016 21:02:44 +0100
Message-ID: <9046bf11-9299-267b-b6b4-19a2ec697859@gmail.com>
References: <1482995717-27063-1-git-send-email-rppt@linux.vnet.ibm.com>
 <20161229132215.GA6984@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161229132215.GA6984-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/29/2016 02:22 PM, Andrea Arcangeli wrote:
> Hello,
> 
> On Thu, Dec 29, 2016 at 09:15:17AM +0200, Mike Rapoport wrote:
>> +.in +4n
>> +.nf
>> +struct uffdio_copy {
>> +	__u64 dst;
>> +	__u64 src;
>> +	__u64 len;
>> +	__u64 mode;
>> +	__s64 copy;
>> +};
>> +.nf
> 
> -.nf
> 
>> +.fi
> 
> +.in
> 
>> +.in +4n
>> +.nf
>> +struct uffdio_zeropage {
>> +	struct uffdio_range range;
>> +	__u64 mode;
>> +	__s64 zeropage;
>> +};
>> +.nf
> 
> -.nf
> 
>> +.fi
> 
> +.in
> 
> The block opening/closing around the uffdio_copy/zeropage structs
> looks more correct in the previous ioctl descriptions so the next line
> that follows isn't indented.

Thanks, Andrea. Fixed!

> Reviewed-by: Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Thanks. Added this to the git log.

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

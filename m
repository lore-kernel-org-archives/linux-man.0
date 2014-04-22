From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] open.2: Update note about the alignment of the user buffer
 and the file offset for O_DIRECT flag
Date: Tue, 22 Apr 2014 20:04:14 +0200
Message-ID: <5356AF1E.7020906@gmail.com>
References: <5356A50F.4010602@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5356A50F.4010602-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, esandeen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/22/2014 07:21 PM, Peter Schiffer wrote:
> Hello Michael,
> 
> the sentence in open(2) man page in notes for O_DIRECT flag:
> "Under Linux 2.6, alignment to 512-byte boundaries suffices."
> 
> is not universally correct. The alignment is a property of the storage, 
> for example, 4k-sector drives with no 512 byte sector emulation will be 
> unable to perform 512-byte direct I/O.
> 
> The patch clarifies this sentence.

Thanks very much for that patch, Peter. It clears
up my (mis)understanding! Applied.

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

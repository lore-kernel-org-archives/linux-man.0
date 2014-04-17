From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 10/10] manpage: update FALLOC_FL_COLLAPSE_RANGE flag in fallocate
Date: Thu, 17 Apr 2014 22:11:06 +0200
Message-ID: <CAKgNAkgis+LvQeiabWaRbb3=rvEV2_Z_XQ8O6d5JGR=eEFSxCg@mail.gmail.com>
References: <1392741594-20335-1-git-send-email-linkinjeon@gmail.com>
 <20140416060510.GA25651@infradead.org> <534FD9B5.3000207@gmail.com> <20140417155959.GA24231@infradead.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140417155959.GA24231-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Namjae Jeon <linkinjeon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Theodore T'so <tytso-3s7WtUTddSA@public.gmane.org>, Dave Chinner <david-FqsqvQoI3Ljby3iVrkZq2A@public.gmane.org>, Linux-Fsdevel <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, Apr 17, 2014 at 5:59 PM, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org> wrote:
> On Thu, Apr 17, 2014 at 03:40:05PM +0200, Michael Kerrisk (man-pages) wrote:
>> On 04/16/2014 08:05 AM, Christoph Hellwig wrote:
>> > Michael, can you apply this now that we merged FALLOC_FL_COLLAPSE_RANGE
>> > into the kernel tree?
>>
>> I've applied Namjae Jeon's patch (thanks Namjae!), and done a lot of
>> tweaking to generate the patch below.
>>
>> Along the way I noticed that there is an inconsistency between XFS
>> and JFS that should be fixed (and so have added Dave and Ted to CC,
>
> ext4?

D'oh -- yes!

> Anyway, the documentation looks good to in general, but do you really think
> mentioning git commit hashs in a man page is a good idea?

Those are only comments in the source file, for reference (sometimes,
that's really helpful). They don't appear the rendered output.

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

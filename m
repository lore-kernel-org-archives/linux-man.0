From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fts.3 is not available in LFS builds
Date: Mon, 17 Mar 2014 15:02:53 +0100
Message-ID: <CAKgNAkh7ES18jT2coD39ZXvjUxkrZavaG=SufNS_-16SgM3kUg@mail.gmail.com>
References: <20140315135416.GA10430@infradead.org> <CAKgNAkgqXUf0yWaXyAD7yBJgivp9Jmwvz4EAnh_DpyActuoGwA@mail.gmail.com>
 <20140316172219.GA16900@infradead.org> <5326FF14.7010305@gmail.com> <20140317140118.GA11576@infradead.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140317140118.GA11576-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, Mar 17, 2014 at 3:01 PM, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org> wrote:
> On Mon, Mar 17, 2014 at 02:56:36PM +0100, Michael Kerrisk (man-pages) wrote:
>> I made it
>>
>>     BUGS
>>        All  of  the  APIs described in this man page are not safe when
>>        compiling a program using the LFS APIs  (e.g.,  when  compiling
>>        with  -D_FILE_OFFSET_BITS=64).  This means these APIs are unus???
>>        able on current 32-bit systems, since those  systems  are  nor???
>>        mally built with -D_FILE_OFFSET_BITS=64.
>
> Unfortunately that' not quite true - the default is still
> -D_FILE_OFFSET_BITS=32 for the compiler, so you'd need manual action to
> change it - which generally is a good idea.

Oh! I thought most distributors built their 32-bit distros with
-D_FILE_OFFSET_BITS=64 these days? Am I wrong? (I don't have any
32-bit systems handy to sample from.)



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

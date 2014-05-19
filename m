From: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
Subject: Re: [PATCH] remap_file_pages.2: Not actually useful on real files.
Date: Mon, 19 May 2014 09:31:55 -0700
Message-ID: <CALCETrW=rw1foEJmhdKHLO+eZ9qTan20QJQbqra+x4__OyCQVg@mail.gmail.com>
References: <5de30c3a21531919712fc7df213c18b46e521225.1355955125.git.luto@amacapital.net>
 <536B5221.60407@gmail.com> <20140508125032.GA24087@infradead.org>
 <CAKgNAkhPJ+w0Kur57bJeTOrLdgaLRebk9Yr0PsE4czqcGFudwQ@mail.gmail.com> <20140519144856.GA23758@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140519144856.GA23758-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, May 19, 2014 at 7:48 AM, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org> wrote:
> On Thu, May 08, 2014 at 03:29:32PM +0200, Michael Kerrisk (man-pages) wrote:
>> > I think the whole man page for remap_file_pages is a litt confusing I
>> > have to say, the concept of a VMA is purely kernel internal and doesn't
>> > really have a meaning for applications and thus shouldn't appear in a
>> > man page.
>>
>> I agree it could be better. Do you have a suggested text?
>
> Does the patch below look good?  I tries to explain it in user visible
> behavior:
>
>
> diff --git a/man2/remap_file_pages.2 b/man2/remap_file_pages.2
> index 67251e3..716b911 100644
> --- a/man2/remap_file_pages.2
> +++ b/man2/remap_file_pages.2
> @@ -46,8 +46,7 @@ The advantage of using
>  .BR remap_file_pages ()
>  over using repeated calls to
>  .BR mmap (2)
> -is that the former approach does not require the kernel to create
> -additional VMA (Virtual Memory Area) data structures.
> +is that the kernel can implement it more efficiently.
>
>  To create a nonlinear mapping we perform the following steps:
>  .TP 3
> @@ -160,11 +159,18 @@ Since Linux 2.6.23,
>  .BR remap_file_pages ()
>  creates non-linear mappings only
>  on in-memory file systems such as tmpfs, hugetlbfs or ramfs.
> +
>  On filesystems with a backing store,
>  .BR remap_file_pages ()
>  is not much more efficient than using
>  .BR mmap (2)
>  to adjust which parts of the file are mapped to which addresses.
> +
> +Non-linear mappings created by
> +.BR remap_file_pages ()
> +do not count against the limit of memory mappings set in
> +.I /proc/sys/vm/max_map_count
> +unless the above mentioned emulation is used.
>  .SH SEE ALSO
>  .BR getpagesize (2),
>  .BR mmap (2),

This could be misread as saying that, on real filesystems,
remap_file_pages isn't more efficient but still avoids max_map_count.
I think that this is not the case.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

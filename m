From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: remap_file_pages() update needed?
Date: Wed, 21 May 2014 08:51:11 +0200
Message-ID: <CAKgNAkh8xdLj=frH_yQ38_HTnGkfEEXCfVGpBayqzygDNmvrww@mail.gmail.com>
References: <CALN0BAvrOF-7z4+X-rPhxJ2V82L13V2Ym_uYZ1+q3ZDe1bzowQ@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALN0BAvrOF-7z4+X-rPhxJ2V82L13V2Ym_uYZ1+q3ZDe1bzowQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kenny Simpson <theonetruekenny-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Kenny,

On Wed, May 21, 2014 at 5:15 AM, Kenny Simpson
<theonetruekenny-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> http://man7.org/linux/man-pages/man2/remap_file_pages.2.html
>
> makes no mention of the restriction against disk-based files with this
> system call.
>
>> On Mon, May 19, 2014 at 5:24 PM, Kirill A. Shutemov
>> <kirill-oKw7cIdHH8eLwutG50LtGA@public.gmane.org> wrote:
>>> On Mon, May 19, 2014 at 01:34:05PM -0400, Kenny Simpson wrote:
>>>> For the other cases I had used the remapping to have more of a sliding
>>>> window over a disk-backed file where I also was using aliasing to
>>>> eliminate the corner cases of hitting the end of a window and needing
>>>> to split records due to crossing boundaries, etc..
>>>
>>> Disk backed files are not supported by remap_file_pages() since 2007.
>>> See commit 3ee6dafc677a.

Thanks for your note. Others recently also pointed this out, and the
next release of man-pages will address this. Currently waiting in Gt
is this text:

  NOTES
       Since Linux  2.6.23,  remap_file_pages()  creates  non-linear
       mappings  only  on  in-memory  file  systems  such  as tmpfs,
       hugetlbfs or ramfs.  On filesystems  with  a  backing  store,
       remap_file_pages()  is  not  much  more  efficient than using
       mmap(2) to adjust which parts of the file are mapped to which
       addresses.

And there may yet be more tweaks to that text.

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

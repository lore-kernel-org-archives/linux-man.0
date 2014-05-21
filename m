From: Kenny Simpson <theonetruekenny-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: remap_file_pages() update needed?
Date: Tue, 20 May 2014 23:15:51 -0400
Message-ID: <CALN0BAvrOF-7z4+X-rPhxJ2V82L13V2Ym_uYZ1+q3ZDe1bzowQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://man7.org/linux/man-pages/man2/remap_file_pages.2.html

makes no mention of the restriction against disk-based files with this
system call.

-Kenny

> On Mon, May 19, 2014 at 5:24 PM, Kirill A. Shutemov
> <kirill-oKw7cIdHH8eLwutG50LtGA@public.gmane.org> wrote:
>> On Mon, May 19, 2014 at 01:34:05PM -0400, Kenny Simpson wrote:
>>> For the other cases I had used the remapping to have more of a sliding
>>> window over a disk-backed file where I also was using aliasing to
>>> eliminate the corner cases of hitting the end of a window and needing
>>> to split records due to crossing boundaries, etc..
>>
>> Disk backed files are not supported by remap_file_pages() since 2007.
>> See commit 3ee6dafc677a.
>>
>> --
>>  Kirill A. Shutemov
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

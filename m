From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: For review: open_by_handle_at(2) man page [v4]
Date: Fri, 04 Apr 2014 13:14:13 +0200
Message-ID: <533E9405.9020803@gmail.com>
References: <CAKgNAkgtrc73kawRuoa-VoNx7DY2Ld+Qxwp5GNj9syxOmN_ctA@mail.gmail.com> <8738htnzje.fsf@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8738htnzje.fsf-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Aneesh Kumar K.V" <aneesh.kumar-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Andreas Dilger <adilger-m1MBpc4rdrD3fQ9qLvQP4Q@public.gmane.org>, Neil Brown <neilb-l3A5Bk7waGM@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Alexander Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 04/04/2014 12:45 PM, Aneesh Kumar K.V wrote:
> "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>> The process receiving the handle can later perform operations
>> on the symbolic link by converting the handle to a file descriptor using
>> .BR open_by_handle_at ()
>> with the
>> .BR O_PATH
>> flag, and then passing the file descriptor as the
>> .IR dirfd
>> argument in system calls such as
>> .BR readlinkat (2)
>> and
>> .BR fchownat (2).
> 
> 
> You may want to specify that one need to pass AT_EMPTY_PATH in case of
> fchownat ? readlinkat do take null names, because there is no flags
> argument. For syscalls that take flags, to make it operate on fd, one
> need to pass "" path name and a flag value of AT_EMPTY_PATH.

Thanks. However, those details are covered in (recent versions of) the
man pages for those system calls, and I'd prefer not to duplicate here.

Thanks also for your other reply re O_PATH/-ELOOP.

Otherwise, did all of the technical content in these pages look 
accurate?

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

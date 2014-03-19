From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: For review: open_by_name_at(2) man page [v2]
Date: Wed, 19 Mar 2014 10:09:36 +0100
Message-ID: <53295ED0.7070304@gmail.com>
References: <53271B69.3000305@gmail.com>	<53284233.3050800@gmail.com> <20140319151349.33a76023@notabene.brown>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140319151349.33a76023-wvvUuzkyo1EYVZTmpyfIwg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "Aneesh Kumar K.V" <aneesh.kumar-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Fsdevel <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andreas Dilger <adilger-m1MBpc4rdrD3fQ9qLvQP4Q@public.gmane.org>, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Al Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
List-Id: linux-man@vger.kernel.org

[CC =+ Al Viro]

Hi Neil,

On 03/19/2014 05:13 AM, NeilBrown wrote:
> On Tue, 18 Mar 2014 13:55:15 +0100 "Michael Kerrisk (man-pages)"
> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
>> Hi Aneesh, (and others)
>>
>> After integrating review comments from NeilBown and Christoph Hellwig,
>> here is draft 2 of a man page I've written for name_to_handle_at(2) and
>> open_by_name_at(2). Especially thanks to Neil's comments, several parts
>> of the page underwent a substantial rewrite. Would you be willing to 
>> review it please, and let me know of any corrections/improvements?

[various typos you reported fixed now.]

>> .TP
>> .B AT_EMPTY_PATH
>> Allow
>> .I pathname
>> to be an empty string.
>> See above.
>> (which may have been obtained using the
>> .BR open (2)
>> .B O_PATH
>> flag).
> 
> What "may have been obtained" ??

Crufty text. gone now.

>> The
>> .I flags
>> argument
>> is as for
>> .BR open (2).
>> .\" FIXME: Confirm that the following is intended behavior.
>> .\"        (It certainly seems to be the behavior, from experimenting.)
>> If
>> .I handle
>> refers to a symbolic link, the caller must specify the
>> .B O_PATH
>> flag, and the symbolic link is not dereferenced (the
>> .B O_NOFOLLOW
>> flag, if specified, is ignored).
> 
> It certainly sounds like reasonable behaviour.  I cannot comment on intention
> though.
> Are you bothered that O_PATH is needed for symlinks?  

No.

> An fd on a symlink is a
> sufficiently unusual thing that it seems reasonable for a programmer to
> explicitly say they are expecting one.

I think the point is this: If you have a file handle for a symlink, then
you can't follow the symlink, which is why you must specify O_PATH and
O_NOFOLLOW becomes irrelevant. I'm curious about the rationale though.
I suspect it's something like: the process receiving the handle doesn't
have enough information for the symlink to be interpreted, I think because
it can;t reliably determine what directory the link lives in.
Possibly Al Viro or Aneesh can confirm.

>> In the event of an error, both system calls return \-1 and set
>> .I errno
>> to indicate the cause of the error.
>> .SH ERRORS
>> .BR name_to_handle_at ()
>> and
>> .BR open_by_handle_at ()
>> can fail for the same errors as
>> .BR openat (2).
>> In addition, they can fail with the errors noted below.
> 
> Should you mention EFAULT if mount_id or handle are not valid pointers?

Done.

>> Not all filesystem types support the translation of pathnames to
>> file handles.
>> .\" FIXME NeilBrown noted:
>> .\"    ESTALE is also returned if the filesystem does not support
>> .\"    file-handle -> file mappings.
>> .\"    On filesystems which don't provide export_operations (/sys /proc
>> .\"    ubifs romfs cramfs nfs coda ... several others) name_to_handle_at
>> .\"    will produce a generic handle using the 32 bit inode and 32 bit
>> .\"    i_generation. open_by_name_at given this (or any) filehandle
>> .\"    will fail with ESTALE.
>> .\" However, on /proc and /sys, at least, name_to_handle_at() fails with
>> .\" EOPNOTSUPP. Are there really filesystems that can deliver ESTALE (the
>> .\" same error as for an invalid file handle) in the above circumstances?
> 
> This is all wrong - discard it :-)

Yup. Gone now ;-).

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

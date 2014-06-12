From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc.5: /proc/fs is not empty directory
Date: Thu, 12 Jun 2014 15:16:40 +0200
Message-ID: <CAKgNAkhWoYRWyi-UECHXiL6zChdamkgqrafXKgvnSH+VzK0iCg@mail.gmail.com>
References: <20140605140204.25995.48033.stgit@unused-4-157.brq.redhat.com>
 <539084A4.30301@bfs.de> <53917DD5.5090708@redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53917DD5.5090708-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jan Chaloupka <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Walter Harms <wharms-fPG8STNUNVg@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, Jun 6, 2014 at 10:37 AM, Jan Chaloupka <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> On 06/05/2014 04:54 PM, walter harms wrote:
>>
>> Am 05.06.2014 16:02, schrieb jchaloup:
>>>
>>> Man page for proc says:
>>> /proc/fs
>>>               Empty subdirectory.
>>>
>>> But ls says something else:
>>> $ ls /proc/fs/
>>> ext4  jbd2  nfs  nfsd
>>>
>>> In addition from
>>> https://www.kernel.org/doc/Documentation/filesystems/proc.txt, caption: 1.9
>>> Ext4 file system parameters:
>>>
>>> Information about mounted ext4 file systems can be found in
>>> /proc/fs/ext4.
>>>
>>> This patch gives better description for the content. Open to give more
>>> description if someone knows more or where to find it.
>>>
>>> Signed-off-by: jchaloup <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>   man5/proc.5 |    2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/man5/proc.5 b/man5/proc.5
>>> index 8fd7b19..956760c 100644
>>> --- a/man5/proc.5
>>> +++ b/man5/proc.5
>>> @@ -1805,7 +1805,7 @@ Then filesystems contained in this file are tried
>>>   (excepted those that are marked with "nodev").
>>>   .TP
>>>   .I /proc/fs
>>> -Empty subdirectory.
>>> +Directory shows which file systems are exported.
>>>   .TP
>>>   .I /proc/ide
>>>   This directory
>>
>> hi,
>> exported sounds for me like nfs export. what is about:
>> "Information about mounted file systems" (copied and ajusted from
>> proc.txt)
>
> Fine for me.
>

Walter's suggestion seems a reasonable place to start. I added the following:

[[
Contains subdirectories that in turn contain files
with information about (certain) mounted filesystems.
]]

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

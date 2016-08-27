From: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Subject: Re: CLONE_FILES description confusing
Date: Sat, 27 Aug 2016 13:07:00 +0200
Message-ID: <57C17454.80707@bfs.de>
References: <CAJgzZopmS1ph4G4zMu-_chLjsyE4CLnZiuOPqXBC=vdUE9R96w@mail.gmail.com> <e9dc2d61-4d72-32f4-3fb7-8864dd575f32@gmail.com> <CAJgzZor_Ru3TJfjA0L9PFo7r+2asCD+BxW=GAgmdFHY_UR2Gag@mail.gmail.com>
Reply-To: wharms-fPG8STNUNVg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJgzZor_Ru3TJfjA0L9PFo7r+2asCD+BxW=GAgmdFHY_UR2Gag-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: enh <enh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org



Am 24.08.2016 02:11, schrieb enh:
> On Tue, Aug 23, 2016 at 4:52 PM, Michael Kerrisk (man-pages)
> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hello Elliott
>>
>> On 08/24/2016 10:19 AM, enh wrote:
>>>        CLONE_FILES (since Linux 2.0)
>>>               If CLONE_FILES is set, the calling process and the child process
>>>               share  the same file descriptor table.  Any file descriptor cre‐
>>>               ated by the calling process or by  the  child  process  is  also
>>>               valid  in the other process.  Similarly, if one of the processes
>>>               closes a file descriptor, or changes its associated flags (using
>>>               the  fcntl(2)  F_SETFD  operation),  the  other  process is also
>>>               affected.
>>>
>>> this is fine.
>>>
>>>               If CLONE_FILES is not set, the child process inherits a copy  of
>>>               all  file  descriptors opened in the calling process at the time
>>>               of clone().  (The duplicated file descriptors in the child refer
>>>               to  the  same open file descriptions (see open(2)) as the corre‐
>>>               sponding file descriptors in the calling  process.)   Subsequent
>>>               operations  that  open or close file descriptors, or change file
>>>               descriptor flags, performed by either the calling process or the
>>>               child process do not affect the other process.
>>>
>>> this is strictly correct, but (having just had to explain what this
>>> descriptor/description distinction actually means in practice here) i
>>> think it would be helpful to explicitly mention that changes to the
>>> file offset or file status flags in one process *does* affect the
>>> other process.
>>
>> Yes, it wouldn't hurt to be a bit more explicit. I made the second paragraph:
>>
>>               If  CLONE_FILES  is  not  set, the child process inherits a
>>               copy of all file descriptors opened in the calling  process
>>               at the time of clone().  Subsequent operations that open or
>>               close file descriptors, or change  file  descriptor  flags,
>>               performed  by  either  the  calling  process  or  the child
>>               process do not affect the other  process.   Note,  however,
>>               that  the duplicated file descriptors in the child refer to
>>               the same open file descriptions as the  corresponding  file
>>               descriptors  in  the  calling  process, and thus share file
>>               offsets and files status flags (see open(2)).
> 


Just one note:
People are terrible bad at negation. So i would suggest:

If  CLONE_FILES  is  set, the child process share
all file descriptors opened in the calling  process
at the time of clone().
Subsequent operations that open or close file descriptors,
or change  file  descriptor  flags, performed  by  either
the  calling  process  or  the child
process do also affect the other  process.
 Note,  however,
 that  the duplicated file descriptors in the child refer to
 the same open file descriptions as the  corresponding  file
 descriptors  in  the  calling  process, and thus share file
 offsets and files status flags (see open(2)).


re,
 wh

> lgtm. thanks!
> 
>>> less important, but another suggestion would be that maybe we should
>>> also explicitly say that "clone calls for thread creation pass
>>> CLONE_FILES, but fork(3) calls clone without CLONE_FILES" so that
>>> folks who know how to use the C library but not how it's implemented
>>> don't need to ask their friendly local C library implementer (me)
>>> exactly how CLONE_FILES works :-)
>>
>> There is a small hint about this in the fork(2) man page. I'm not
>> (yet) convinced more is really needed.
> 
> all i meant was "most folks already correctly understand the
> fd-related implications of pthread_create and fork, so pointing out
> the parallel would have made the distinction between CLONE_FILES and
> no CLONE_FILES more obvious to them". but i think the new text is fine
> anyway.
> 
>> Thanks for the report.
>>
>> Cheers,
>>
>> Michael
>>
>> --
>> Michael Kerrisk
>> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
>> Linux/UNIX System Programming Training: http://man7.org/training/
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

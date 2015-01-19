From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: File sealing man pages for review (memfd_create(2), fcntl(2))
Date: Mon, 19 Jan 2015 09:33:23 +0100
Message-ID: <54BCC153.5060804@gmail.com>
References: <54AFCE4A.80804@gmail.com> <CANq1E4ScALBHtN5B_1N0ynKFx4HwZaQZNg3RAv4tcn10YLHtAA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <CANq1E4ScALBHtN5B_1N0ynKFx4HwZaQZNg3RAv4tcn10YLHtAA@mail.gmail.com>
Sender: owner-linux-mm@kvack.org
To: David Herrmann <dh.herrmann@gmail.com>
Cc: mtk.manpages@gmail.com, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Lennart Poettering <lennart@poettering.net>, Andy Lutomirski <luto@amacapital.net>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Hugh Dickins <hughd@google.com>, Florian Weimer <fweimer@redhat.com>, John Stultz <john.stultz@linaro.org>, Carlos O'Donell <carlos@systemhalted.org>
List-Id: linux-man@vger.kernel.org

Hello David,

Thanks for reviewing the pages! I'll trim everything that we agree 
on, and just comment on a few remaining points.

On 01/18/2015 11:28 PM, David Herrmann wrote:
> Hi
> 
> On Fri, Jan 9, 2015 at 1:49 PM, Michael Kerrisk (man-pages)
> <mtk.manpages@gmail.com> wrote:

[...]

>> ==================== memfd_create.2 ====================
>>
>> .\" Copyright (C) 2014 Michael Kerrisk <mtk.manpages@gmail.com>
>> .\" and Copyright (C) 2014 David Herrmann <dh.herrmann@gmail.com>
>> .\"
>> .\" %%%LICENSE_START(GPLv2+_SW_3_PARA)
>> .\"
>> .\" FIXME What is _SW_3_PARA?
> 
> No idea.. if that's due to my initial version, please feel free to drop it.

Dropped.

[...]

>> Therefore, files created by
>> .BR memfd_create ()
>> are subject to the same restrictions as other anonymous
>> .\" FIXME Can you give some examples of some of the restrictions please.
> 
> memfd uses VM_NORESERVE so each page is accounted on first access.
> This means, the overcommit-limits (see __vm_enough_memory()) and the
> memory-cgroup limits (mem_cgroup_try_charge()) are applied. Note that
> those are accounted on "current" and "current->mm", that is, the
> process doing the first page access.

Thanks for the info. That's probably more detail than we need to go 
into here. I've reworded the text more openly as:

    "have the same semantics as other anonymous memory allocations"

>> memory allocations such as those allocated using
>> .BR mmap (2)
>> with the
>> .BR MAP_ANONYMOUS
>> flag.
>>
>> The initial size of the file is set to 0.
>> .\" FIXME I added the following sentence. Please review.
> 
> Looks good. It's not needed if you use write(), as it adjusts the size
> accordingly. But people usually use mmap() so the recommendation
> sounds useful.

I added mention of "write(2) (and similar)" as well.

[...]

>> Names do not affect the behavior of the memfd,
>> .\" FIXME The term "memfd" appears here without having previously been
>> .\"       defined. Would the correct definition of "the memfd" be
>> .\"       "the file descriptor created by memfd_create"?
> 
> Yes.

Okay -- I've reworded two instances of the work "memfd" away,
replacing them with fuller wording such as my definition above.

[...]

>> .TP
>> .BR MFD_ALLOW_SEALING
>> Allow sealing operations on this file.
>> See the discussion of the
>> .B F_ADD_SEALS
>> and
>> .BR F_GET_SEALS
>> operations in
>> .BR fcntl (2),
>> and also NOTES, below.
>> The initial set of seals is empty.
>> If this flag is not set, the initial set of seals will be
>> .BR F_SEAL_SEAL ,
>> meaning that no other seals can be set on the file.
>> .\" FIXME Why is the MFD_ALLOW_SEALING behavior not simply the default?
>> .\"       Is it worth adding some text explaining this?
> 
> memfds are quite useful without sealing. It's a replacement for files
> in /tmp or O_TMPFILE if you never intended to actually link the file
> anywhere. Therefore, sealing is not enabled by default.

Good stuff! I've added those details to the page.

[...]

>> An example of the usage of the sealing mechanism is as follows:
>>
>> .IP 1. 3
>> The first process creates a
>> .I tmpfs
>> file using
>> .BR memfd_create ().
>> The call yields a file descriptor used in subsequent steps.
>> .IP 2.
>> The first process
>> sizes the file created in the previous step using
>> .BR ftruncate (2),
>> maps it using
>> .BR mmap (2),
>> and populates the shared memory with the desired data.
>> .IP 3.
>> The first process uses the
>> .BR fcntl (2)
>> .B F_ADD_SEALS
>> operation to place one or more seals on the file,
>> in order to restrict further modifications on the file.
>> (If placing the seal
>> .BR F_SEAL_WRITE ,
>> then it will be necessary to first unmap the shared writable mapping
>> created in the previous step.)
>> .IP 4.
>> A second process obtains a file descriptor for the
>> .I tmpfs
>> file and maps it.
>> This could happen in one of two ways:
> 
> 3rd case: file-descriptor passing via AF_UNIX. Further mechanisms
> (like kdbus) might allow fd-passing in the future, so I would reword
> this to an example, not a definite list.

Thanks. I reworded to indicate that these are examples, and also
added FD passing (as the first item in the list of examples).

> Also note that in you examples (opening /proc or fork()) you have a
> natural trust-relationship as you run as the same uid. So in those
> cases sealing is usually not needed.

Good point. I added that point, pretty much using your words.

[...]

>> .SH SEE ALSO
>> .BR fcntl (2),
>> .BR ftruncate (2),
>> .BR mmap (2),
>> .\" FIXME Why the reference to shmget(2) in particular (and not,
>> .\"       e.g., shm_open(3))?
> 
> No particular reason.

Okay -- for completeness, I added shm_open(3).

>> .BR shmget (2)
>>
>> ==================== fcntl.2 (partial) ====================
>> ...
>> .SH DESCRIPTION
>> ...
>> .SS File Sealing

[...]

>> and
>> .BR fallocate (2).
>> These calls will fail with
>> .B EPERM
>> if you use them to increase the file size or write beyond size boundaries.
>> .\" FIXME What does "size boundaries" mean here?
> 
> It means writing past the end of the file.

Okay -- I clarified that in the text.

>> If you keep the size or shrink it, those calls still work as expected.
>> .TP
>> .BR F_SEAL_WRITE
>> If this seal is set, you cannot modify the contents of the file.
>> Note that shrinking or growing the size of the file is
>> still possible and allowed.
>> .\" FIXME So, just to confirm my understanding of the previous sentence:
>> .\"       Given a file with the F_SEAL_WRITE seal set, then:
>> .\"
>> .\"       * Writing zeros into (say) the last 100 bytes of the file is
>> .\"         NOT be permitted.
>> .\"
>> .\"       * Shrinking the file by 100 bytes using ftruncate(), and then
>> .\"         increasing the file size by 100 bytes, which would have the
>> .\"         effect of replacing the last hundred bytes by zeros, IS
>> .\"         permitted.
>> .\"
>> .\"       Either my understanding is incorrect, or the above two cases
>> .\"       seem a little anomalous. Can you comment?
> 
> Your understanding is correct. That's why you usually want SEAL_WRITE
> in combination with either SEAL_SHRINK _or_ SEAL_GROW. SEAL_WRITE by
> itself only protects data-overwrite, but not removal or addition of
> data (which, effectively, can be used to achieve the same, but in a
> racy manner).

Okay -- thanks for clearing that up. (No change needed to the page text, 
I think.)

[...]

>> Furthermore, trying to create new shared, writable memory-mappings via
> 
> Comma after "new"?

Not needed, I think.

[...]

By the way, I forgot to say that I also added this error under ERRORS:

[[
.TP
.B EINVAL
.I cmd
is
.BR F_ADD_SEALS
and
.I arg
includes an unrecognized sealing bit or
the filesystem containing the inode referred to by
.I fd
does not support sealing.
]]

Look okay?

> Both man-pages look really good. Thanks a lot!

You're welcome. Thanks for the initial drafts, and this review.
The changes will go out with the next man-pages release.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>

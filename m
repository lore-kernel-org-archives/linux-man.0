From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] process_vm_{read,write}v(3): initial man pages
Date: Sat, 14 Apr 2012 13:07:28 +1200
Message-ID: <CAKgNAkiKL64_H2QT6v0hsP-=cM3w=wGJbjaph+JMq6R+Knhysg@mail.gmail.com>
References: <1331358148-17235-1-git-send-email-vapier@gentoo.org> <201203291517.46815.vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201203291517.46815.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: Christopher Yeoh <cyeoh-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Mike,

On Fri, Mar 30, 2012 at 8:17 AM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wro=
te:
> On Thursday 29 March 2012 14:42:49 Michael Kerrisk (man-pages) wrote:
>> .SH SYNOPSIS
>> .B #include <sys/uio.h>
>> .nf
>> .BI "ssize_t process_vm_readv(pid_t " pid ,
>
> i think there should be a blank line between sys/uio.h and the protot=
ypes

Yes.

>> These system calls transfer data between the address space
>> of the calling process ("the local process") and the process identif=
ied by
>> .IR pid
>> ("the remote process").
>
> you set up terms as if you're going to use them, but then later conti=
nue to
> say "the calling process" and "the process identified by pid". =A0wou=
ldn't it be
> better to convert all of those to "local" and "remote" ?

Thanks. I'll convert at least some of them.

>> .IR remote_vec
>> is a pointer to an array describing address ranges in the process
>> .IR pid ,
>> and
>> .IR riovcnt
>> specifies the number of items in
>
> personally, i prefer "elements" over "items"

Yes, "elements" is better.

>> is a pointer to an array describing address ranges in the calling pr=
ocess,
>> and
>> .IR liovcnt
>> specifies the specifies the number of items in
>
> got "specifies the" duplicated here

Thanks.

>> The
>> .BR process_vm_writev ()
>> system call is the converse of
>
> "inverse" might be better, but either works

I prefer converse.

>> .BR process_vm_readv ()\(emit
>> transfers data from the calling process to the process
>
> i don't like how this renders. =A0there's no spacing between the func=
 and the
> next word:
> =A0 =A0 =A0 =A0process_vm_readv()=97it
>
> imo, there should be:
> =A0 =A0 =A0 =A0process_vm_readv() =97 it

Normal typographic usage of em-dash is without surrounding spaces.

>> or the addresses refer to regions that are inaccessible in the local
>> process,
>
> might be better phrased as:
> =A0 =A0 =A0 =A0... inaccessible to the local process ...

Yes.

>> .\" FIXME: What does the following sentence mean?
>
> heh, i was just about to suggest a clarification. =A0consider the cas=
e where you
> want to read a C string from a remote process. =A0you don't know its =
length, so
> it is probably cheaper to read too much data and then discard the res=
t than it
> is to read it byte by byte in a single syscall.
>
> further consider the string lies in the last page of a valid mapping.=
 =A0you
> don't want to always say "read 500 bytes" because if the first 200 by=
tes are
> the last 200 bytes of the last page, the remaining 300 bytes cover in=
valid
> memory, and so no data will be read.
>
> instead, you'd split the remote read array into two elements and have=
 them
> merge back into a single write array entry. =A0the first read entry g=
oes up to
> the page boundary while the second starts on the next page boundary.
>
>> Keep this in mind when attempting to
>> extract data of unknown length (such as C strings which are
>> null-terminated) by avoiding spanning memory pages (typically 4KiB).
>
> ... by avoiding spanning memory pages (typically 4KiB) in a single io=
vec
> element.

Thanks for the clear explanation, and the crisp addition to the
man-page text. I also adapted a piece of your explanation to add into
the page after the above sentence:

=3D=3D
(Instead, split the remote read array into two
=2EI iovec
elements and have them merge back into a single write array entry.
The first read entry goes up to the page boundary,
while the second starts on the next page boundary.)
=3D=3D

However, as I look at the text, there is still a nagging doubt. The
paragraph starts
=3D=3D
The count arguments and
=2EIR local_iov
are checked before doing any transfers.
If the counts are too big, or
=2EI local_iov
is invalid,
or the addresses refer to regions that are inaccessible to the local pr=
ocess,
none of the vectors will be processed and an
error will be returned immediately.
=3D=3D

That seems to contradict the advice "Instead, split the remote read
array", because surely if the second of the iovec elements refers to
an inaccessible region, then as stated in the early part of the
paragraph, "none of the vectors will be processed". And the advice
refers to the "remote read array".

What am I missing? I suspect the advice should instead apply to the
*remote_iov*, and perhaps be placed in the following paragraph.

>> Note, however, that these system calls do not check the memory regio=
ns
>> in the remote process until just before doing the read/write.
>> Consequently, a partial read/write may result if one of the
>> .I remote_vec
>> elements points to an invalid memory region in the remote process.
>> No further reads/writes will be attempted beyond that point.
>
> should clarify that the partial read/write applies to iovec elements
> granularity and not byte granularity. =A0i.e. the syscall won't retur=
n a partial
> read that splits a single iovect element.

I added this text under RETURN VALUE:

=3D=3D
(Partial transfers apply at the granularity of
=2EI iovec
elements.
These system calls won't perform a partial
transfer that splits a single
=2EI iovec
element.)
=3D=3D

And again a question does "a single iovec element" here apply to the
remove iovec elements, the local iovec elements, or both?

>> In order to read from or write to another process,
>> either the caller must have the capability
>> .BR CAP_SYS_PTRACE ,
>> or
>> the real, effective, and saved set user IDs
>> of the target process must match the real user ID of the caller
>> .I and
>> the real, effective, and saved set group IDs
>> of the target process must match the real group ID of the caller.
>
> the "set" phrasing here seems off. =A0should it be:
> =A0 =A0 =A0 =A0... the real, effective, and saved set of user IDs ...
> i.e. add the word "of"

What is meant here is "real user ID, effective user ID, or saved
set-user-ID", but I was trying to be economical with characters. I'll
instead write the full text then. since it appears my economy is a
little unclear.

>> .SH "RETURN VALUE"
>> On success,
>> .BR process_vm_readv ()
>> returns the number of bytes read and
>> .BR process_vm_writev ()
>> returns the number of bytes written.
>> (This return value may be less than the total number of requested by=
tes,
>> if a partial read/write occurred.
>> The caller should check the return value to determine whether
>> a partial read/write occurred.)
>
> the stuff in parenthesis is larger than not. =A0maybe just drop them =
?

Yes.

>> .B ENOMEM
>> Out of memory.
>
> this can be a little confusing to people based on the statements earl=
ier that
> the kernel doesn't do any copying. =A0perhaps clarify that the kernel=
 allocates
> copies of the iovec structures/etc... for internal state and that can=
 OOM ?

I'll make it:

=3D=3D
Could not allocate memory for internal copies of the
=2EI iovec
structures.
=3D=3D

Thanks for these comments Mike.

Cheers,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

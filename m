From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] process_vm_{read,write}v(3): initial man pages
Date: Wed, 25 Apr 2012 14:16:25 +1200
Message-ID: <CAKgNAkj2hUUZCpG7F-1VpnAeNuM0aHtSqvoK26UbSj3bxnrsog@mail.gmail.com>
References: <1331358148-17235-1-git-send-email-vapier@gentoo.org>
 <CAKgNAki+hiCAdGe9ExFsY2MwsLE=yvHib+nb5WQbXqtBXCqHMw@mail.gmail.com>
 <CAKgNAkg2ag9cR217km4vLM0kZYANfayNt=4mvfiObnL4LY3ztQ@mail.gmail.com> <201204241349.31377.vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201204241349.31377.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: Christopher Yeoh <cyeoh-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, Apr 25, 2012 at 5:49 AM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wro=
te:
> On Tuesday 24 April 2012 05:11:54 Michael Kerrisk (man-pages) wrote:
>> The
>> .BR process_vm_readv ()
>> system call transfers data from the remote process to the local proc=
ess.
>> The data to be transferred is identified by
>> .IR remote_iov
>> and
>> .IR riovcnt :
>> .IR remote_iov
>> is a pointer to an array describing address ranges in the process
>> .IR pid ,
>
> maybe add the word "remote" here:
> =A0 =A0 =A0 =A0... in the remote process pid, ...
>
>> The data is transferred to the locations specified by
>> .IR local_iov
>> and
>> .IR liovcnt :
>> .IR local_iov
>> is a pointer to an array describing address ranges in the calling pr=
ocess,
>
> calling -> local

The last two wordings were actually deliberate emphasize the
connections pid =3D=3D remove, caller =3D=3D local, so I'll leave as is=
=2E

>> The
>> .BR process_vm_writev ()
>> system call is the converse of
>> .BR process_vm_readv ()\(emit
>
> this renders as:
> =A0 =A0 =A0 =A0... process_vm_readv()=97it transfers ...
>
> were you going to kill off that weird dash, or just add spacing aroun=
d it ?

As noted earlier, normal English typesetting convention is no spaces
around an em-dash...

>> Other than the direction of the transfer, the arguments
>> .IR liovcnt ,
>> .IR local_iov ,
>> .IR liovcnt ,
>> and
>> .IR remote_iov
>> have the same meaning as for
>> .BR process_vm_readv ().
>
> that second liovcnt is supposed to be riovcnt

Thanks!

>> Note, however, that these system calls do not check the memory regio=
ns
>> in the remote process until just before doing the read/write.
>> Consequently, a partial read/write (see RETURN VALUE)
>
> should that RETURN VALUE be bolded ?

No. (man-pages convention.)

>> may result if one of the
>> .I remote_iov
>> elements points to an invalid memory region in the remote process.
>> No further reads/writes will be attempted beyond that point.
>> Keep this in mind when attempting to read data of unknown length
>> (such as C strings that are null-terminated) from a remote process,
>> by avoiding spanning memory pages (typically 4KiB) in a single remot=
e
>> .I iovec
>> element.
>> (Instead, split the remote read into two
>> .I remove_iov
>> elements and have them merge back into a single write array entry.
>
> maybe change "array" to "local_iov"

Yes, better.

Thanks for checking this over again, Mike.

Christoper?

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

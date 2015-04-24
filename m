From: Dima Tisnek <dimaqq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: man 2 getdents64 struct linux_dirent incorrect.
Date: Fri, 24 Apr 2015 09:59:28 +0200
Message-ID: <CAGGBzXK7gisiG+jEYK4qPvE_zknEBCErHk-=dL65_G9nQp_3aA@mail.gmail.com>
References: <CAGGBzXKT2jtrSBS_Oa56if6pvw5zsnBq-1_65LbxBDZAiDHZdA@mail.gmail.com>
	<CAKgNAkhzAW_Vr_p-6G4ToXQuFH+qRYR0FpHg4BsP1FiAWgyWrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkhzAW_Vr_p-6G4ToXQuFH+qRYR0FpHg4BsP1FiAWgyWrQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hey, sorry if this is a bit off-topic.
Do you know if there's a requirement that data buffer is zeroed out by user?

I'm trying to use this system call directly from Python and I get odd
results, e.g.:

rv = libc.syscall(217, fd, buf, len(buf))
ipdb> print(buf[:rv])
b"E\x19\xaa\x05\x00\x00\x00\x00:H\xf5\xcb\xe6\xd91M
\x00\x08blk-iopoll.c\x00\xc2\x14\xac\x05\x00\x00\x00\x00\x91S\x81\x08Kv\xe9T
\x00\x04partitions\x00c\x00<\x19\xaa\x05\x00\x00\x00\x00\xfcM\xee\x9c\xae%xW(\x00\x08bio-integrity.c\x00\x05\x00\x00\x00\x00R\x19\xaa\x05\x00\x00\x00\x00iKo\x19v\xedxX
\x00\x08blk-sysfs.c\x00\x00D\x19\xaa\x05\x00\x00\x00\x00\xfb\xcckmB!\xb0X
\x00\x08blk-ioc.c\x00\x00\x00\x00[\x19\xaa\x05\x00\x00\x00\x00\x04\x83\x8fa\xad\xe7\xbac(\x00\x08cmdline-parser.c\x00\x00\x00\x00\x00Y\x19\xaa\x05\x00\x00\x00\x00\x9b\xb3\xad\xd1\xbf\xd1\x1dd
\x00\x08bsg.c\x00c\x00\x00\x00\x00\x00\x00P\x19\xaa\x05\x00\x00\x00\x00\xdd\xe2\x8b\xef\xbb\xf64d(\x00\x08blk-settings.c\x00\xaa\x05\x00\x00\x00\x00G\x19\xaa\x05\x00\x00\x00\x00\x1dD\xa8\x9a\xd9[\xd6d
\x00\x08blk-map.c\x00\x00\x00\x00@\x19\xaa\x05\x00\x00\x00\x00\xe1~H\x85\xc1\xd4\xcdj
\x00\x08blk-core.c\x00\x00\x00N\x19\xaa\x05\x00\x00\x00\x00\xfe\xe3\x15\x0c\xfd'\x87k
\x00\x08blk-mq.c\x00.c\x00\x00K\x19\xaa\x05\x00\x00\x00\x00Bd\xf0\xa3~3\xa6o(\x00\x08blk-mq-sysfs.c\x00\x00\x00\x00\x00\x00\x00;\x19\xaa\x05\x00\x00\x00\x00
\xc1Z_M\xd4\xe5o
\x00\x08Makefile\x00p.h\x00Z\x19\xaa\x05\x00\x00\x00\x00\x8bq\xeaX\x16\x84/s(\x00\x08cfq-iosched.c\x00\x19\xaa\x05\x00\x00\x00\x00\\\x19\xaa\x05\x00\x00\x00\x00OG)\xa8\xa3\xb1rs(\x00\x08compat_ioctl.c\x00\xa4\xfa\xdb;j.9\x19\xaa\x05\x00\x00\x00\x00\x07g\x1d4\xa0b?t
\x00\x08Kconfig\x00\x07\x9c5\x181S\x19\xaa\x05\x00\x00\x00\x00b\xb5\xb0\xb7\x93\xc0Ly
\x00\x08blk-tag.c\x00l\x941M\x19\xaa\x05\x00\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\x7f
\x00\x08blk-mq-tag.h\x00"

First record "blk-iopoll.c" is fine, but check the 2nd record:

buf = buf[rlen:]  # advance into buffer

pref = "@QQHB"
preflen = struct.calcsize(pref)  # 19
ino, off, rlen, ftype = struct.unpack_from(pref, buf)
ipdb> ino, off, rlen, ftype
(95163586, 6118551633396847505, 32, 4)
ipdb> buf[preflen:rlen]
b'partitions\x00c\x00'

3-byte padding is expected for alignment of next record; terminating
NULL char is expected. But why is there a 'c' char in the trailer?

I somehow expected kernel to zero out this trailer.

Is the convention that file name is text until null byte, and trailer
can contain garbage? is this user garbage or kernel garbage?

My suspicion is that kernel actually writes <header>"partitions\0"
then skips a couple of bytes and then writes <header>"next item\0".
Thus garbage is mine from previous call.



On 12 April 2015 at 07:51, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello Dima,
>
> On 1 April 2015 at 12:47, Dima Tisnek <dimaqq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Per current man page (shared between getdents and getdents64):
>>
>>            struct linux_dirent {
>>                unsigned long  d_ino;     /* Inode number */
>>                unsigned long  d_off;     /* Offset to next linux_dirent */
>>                unsigned short d_reclen;  /* Length of this linux_dirent */
>>                char           d_name[];  /* Filename (null-terminated) */
>>                                    /* length is actually (d_reclen - 2 -
>>                                       offsetof(struct linux_dirent, d_name) */
>>                /*
>>                char           pad;       // Zero padding byte
>>                char           d_type;    // File type (only since Linux 2.6.4;
>>                                          // offset is (d_reclen - 1))
>>                */
>>
>>            }
>>
>> However, when I issue this system call, the data seems to be:
>>
>>            struct linux_dirent {
>>                unsigned long  d_ino;  // 8 bytes
>>                unsigned long  d_off;  // 8 bytes
>>                unsigned short d_reclen;  // 2 bytes
>>                char d_type;  // 1 byte
>>                char           d_name[];  // null-terminated
>>                char           pad[];  // 0..7 bytes
>>            }
>>
>> Most important is that `d_type` is before `d_name`, not after.
>>
>> Tested on ext4 and virtual like tmpfs, devpts, cgroup, etc.
>
> You don't say it exactly, but I presume you are using getdents64()
> rather than getdents().
>
> What you say above is true for getdents64(). What the man page says is
> true for getdents() (AFAIK). The problem is that the page lacks
> documentation of getdents64() and the structure that it uses. I've
> added that documentation, and you can find the updated page in Git.
>
> Thanks for the report.
>
> Cheers,
>
> Michael
>
>
>
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

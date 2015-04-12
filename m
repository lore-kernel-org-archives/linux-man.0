From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: man 2 getdents64 struct linux_dirent incorrect.
Date: Sun, 12 Apr 2015 07:51:34 +0200
Message-ID: <CAKgNAkhzAW_Vr_p-6G4ToXQuFH+qRYR0FpHg4BsP1FiAWgyWrQ@mail.gmail.com>
References: <CAGGBzXKT2jtrSBS_Oa56if6pvw5zsnBq-1_65LbxBDZAiDHZdA@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGGBzXKT2jtrSBS_Oa56if6pvw5zsnBq-1_65LbxBDZAiDHZdA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dima Tisnek <dimaqq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Dima,

On 1 April 2015 at 12:47, Dima Tisnek <dimaqq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Per current man page (shared between getdents and getdents64):
>
>            struct linux_dirent {
>                unsigned long  d_ino;     /* Inode number */
>                unsigned long  d_off;     /* Offset to next linux_dirent */
>                unsigned short d_reclen;  /* Length of this linux_dirent */
>                char           d_name[];  /* Filename (null-terminated) */
>                                    /* length is actually (d_reclen - 2 -
>                                       offsetof(struct linux_dirent, d_name) */
>                /*
>                char           pad;       // Zero padding byte
>                char           d_type;    // File type (only since Linux 2.6.4;
>                                          // offset is (d_reclen - 1))
>                */
>
>            }
>
> However, when I issue this system call, the data seems to be:
>
>            struct linux_dirent {
>                unsigned long  d_ino;  // 8 bytes
>                unsigned long  d_off;  // 8 bytes
>                unsigned short d_reclen;  // 2 bytes
>                char d_type;  // 1 byte
>                char           d_name[];  // null-terminated
>                char           pad[];  // 0..7 bytes
>            }
>
> Most important is that `d_type` is before `d_name`, not after.
>
> Tested on ext4 and virtual like tmpfs, devpts, cgroup, etc.

You don't say it exactly, but I presume you are using getdents64()
rather than getdents().

What you say above is true for getdents64(). What the man page says is
true for getdents() (AFAIK). The problem is that the page lacks
documentation of getdents64() and the structure that it uses. I've
added that documentation, and you can find the updated page in Git.

Thanks for the report.

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

From: Yubin Ruan <ablacktshirt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: shmat(2) returns page size aligned memory address
Date: Sun, 8 Oct 2017 23:37:05 +0800
Message-ID: <CAJYFCiPhNVCMRVD-QpwsZk0wAKRXzFWcwVZDqLXxsxYfhFcVpg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael,
At the current man page for shmat(2)[1], there is no mentioning
whether the returned memory address of shmat(2) will be page size
aligned or not. As that is quite important to many applications(e.g.,
those that use locks heavily and would like to avoid some locks by
some atomic guarantees provided by the CPU), it would be great to
specify that for Linux.

I walked down the current implementation of shmat(2) in the latest
kernel src and found that shmat(2) does return a page size aligned
memory address:

SYSCALL_DEFINE3(shmat, int, shmid, char __user *, shmaddr, int, shmflg)
 -> do_shmat(...)
 -> do_mmap_pgoff(...)
 -> do_mmap(...)
 -> get_unmapped_area(...)
 -> get_area(...) -> offset_in_page(addr)

there is a `offset_in_page(addr)' assertion at the end and if that is
true a -EINVAL would be returned, by which we can be sure that
shmat(2) will return a page size aligned memory address on success[2].

I will create a patch later if that is acceptable.

Thanks,
Yubin

[1]: http://man7.org/linux/man-pages/man2/shmat.2.html
[2]: there is also a `offset_in_page(2)' in get_unmapped_area(...),
but that doesn't lead to -EINVAL...I am not sure whether the logic of
that code is right.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

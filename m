From: Weijie Yang <weijie.yang.kh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [bug report] fadvise64.2: Linux actually returns ESPIPE on FIFO/pipe
Date: Tue, 11 Nov 2014 15:33:02 +0800
Message-ID: <CAL1ERfM1P4OYDDwWGJS0+XArDByaE2mUvPCRbhg8Ri-RsLutDA@mail.gmail.com>
References: <000001cffd7f$cc610ce0$652326a0$%yang@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <000001cffd7f$cc610ce0$652326a0$%yang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Weijie Yang <weijie.yang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, Nov 11, 2014 at 3:18 PM, Weijie Yang <weijie.yang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> In man-page fadvise64.2(and its variants), the following is outdated:
>
> "ESPIPE The specified file descriptor refers to a pipe or FIFO.  (Linux actually returns EINVAL in this case.)"
>
>
> In Linux 2.6.12, kernel was modified to match the POSIX: return ESPIPE on FIFO/pipe

I'm very sorry, the version is 2.6.15.

> See detail:
>
> commit 87ba81dba431232548ce29d5d224115d0c2355ac
> Author: Valentine Barshak <vbarshak-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
> Date:   Sun Jan 8 01:03:44 2006 -0800
>
>     [PATCH] fadvise: return ESPIPE on FIFO/pipe
>
>     The patch makes posix_fadvise return ESPIPE on FIFO/pipe in order to be
>     fully POSIX-compliant.
>
>     Signed-off-by: Andrew Morton <akpm-3NddpPZAyC0@public.gmane.org>
>     Signed-off-by: Linus Torvalds <torvalds-3NddpPZAyC0@public.gmane.org>
>
> diff --git a/mm/fadvise.c b/mm/fadvise.c
> index 5f19e87..d257c89 100644
> --- a/mm/fadvise.c
> +++ b/mm/fadvise.c
> @@ -37,6 +37,11 @@ asmlinkage long sys_fadvise64_64(int fd, loff_t offset, loff_t len, int advice)
>         if (!file)
>                 return -EBADF;
>
> +       if (S_ISFIFO(file->f_dentry->d_inode->i_mode)) {
> +               ret = -ESPIPE;
> +               goto out;
> +       }
> +
>         mapping = file->f_mapping;
>         if (!mapping || len < 0) {
>                 ret = -EINVAL;
>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
